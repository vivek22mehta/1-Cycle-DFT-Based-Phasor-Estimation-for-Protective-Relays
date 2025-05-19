% Fault Simulation and Protection Relay Analysis with Flexible Fault Types
% Supports LG, LL, LLG, LLL, LLLG faults on any phase combination

%% Clear workspace and setup
clear; close all; clc;

%% Prompt User for Fault Type and Parameters
faultOptions = { ...
    'A-G (Phase A to Ground)', ...
    'B-G (Phase B to Ground)', ...
    'C-G (Phase C to Ground)', ...
    'A-B (Phase A to B)', ...
    'B-C (Phase B to C)', ...
    'C-A (Phase C to A)', ...
    'A-B-G (Phase A–B to Ground)', ...
    'B-C-G (Phase B–C to Ground)', ...
    'C-A-G (Phase C–A to Ground)', ...
    'A-B-C (Three-phase)', ...
    'A-B-C-G (Three-phase to Ground)', ...
    'None (No fault)'};
[idx, tf] = listdlg(...
    'PromptString', 'Select Fault Type:', ...
    'SelectionMode', 'single', ...
    'ListString', faultOptions);
if ~tf
    error('No fault type selected. Exiting simulation.');
end
faultType = faultOptions{idx};

% Default fault parameters
fault_start_time = 0.2;    % seconds
fault_duration   = 0.08;   % seconds
fault_magnitude  = 5.0;    % per unit

%% System Parameters
fs      = 3840;           % Sampling frequency (Hz)
f0      = 60;             % System frequency (Hz)
t_final = 0.5;            % Simulation duration (s)
dt      = 1/fs;           % Time step

t = 0:dt:t_final-dt;       % Time vector
N = length(t);

%% Generate Balanced Three-Phase Currents
Ibase = 1.0;                     % per unit current
phi = [0, -120, 120] * pi/180;   % phase angles in radians
current = zeros(3, N);
for ph = 1:3
    current(ph, :) = Ibase * sin(2*pi*f0*t + phi(ph));
end

%% Determine Which Phases to Fault
switch idx
    case 1,  faultPhases = [1];           % A-G
    case 2,  faultPhases = [2];           % B-G
    case 3,  faultPhases = [3];           % C-G
    case 4,  faultPhases = [1, 2];        % A-B
    case 5,  faultPhases = [2, 3];        % B-C
    case 6,  faultPhases = [3, 1];        % C-A
    case 7,  faultPhases = [1, 2];        % A-B-G
    case 8,  faultPhases = [2, 3];        % B-C-G
    case 9,  faultPhases = [3, 1];        % C-A-G
    case 10, faultPhases = [1, 2, 3];     % A-B-C
    case 11, faultPhases = [1, 2, 3];     % A-B-C-G
    otherwise, faultPhases = [];         % None
end

%% Apply Fault(s)
fault_start_idx = round(fault_start_time * fs) + 1;
fault_end_idx   = round((fault_start_time + fault_duration) * fs);
for ph = faultPhases
    current(ph, fault_start_idx:fault_end_idx) = ...
        fault_magnitude * sin(2*pi*f0*t(fault_start_idx:fault_end_idx) + phi(ph));
end

%% Add Measurement Noise
noise_level = 0.03;
current = current + noise_level * randn(size(current));

%% 1-Cycle DFT Phasor Estimation
mag   = zeros(3, N);
phase = zeros(3, N);
realC = zeros(3, N);
imagC = zeros(3, N);
for ph = 1:3
    [mag(ph,:), phase(ph,:), realC(ph,:), imagC(ph,:), time_vector] = ...
        oneCycleDFTContinuous(current(ph,:), fs, f0);
end

%% Protection Settings and Nominal Current Calculation
settings.pickup_factor = 3.0;
settings.time_delay    = 0.01;
settings.sampling_rate = fs;
preFaultSamples = 1:round(0.1*fs);
nominal = mean(mag(:, preFaultSamples), 2);

%% Apply Protection Logic
for ph = 1:3
    trip(ph, :) = applyProtectionLogic(mag(ph,:)', nominal(ph), settings)';
end
combined_trip = any(trip, 1);

%% Find and Display Trip Time
tripIdx = find(combined_trip, 1, 'first');
if ~isempty(tripIdx)
    tripTime = time_vector(tripIdx);
    fprintf('Relay trip at %.4f s (%.2f ms after fault start)\n', ...
        tripTime, (tripTime - fault_start_time)*1000);
else
    fprintf('No trip detected.\n');
end

%% Plot Results
figure('Position',[100,100,900,900]);

% 1) Currents
subplot(4,1,1);
plot(t, current(1,:), 'r', t, current(2,:), 'g', t, current(3,:), 'b','LineWidth',1.2);
xline(fault_start_time,'--k','Fault Start');
if ~isempty(tripIdx), xline(tripTime,'--r','Relay Trip'); end
title('Three-Phase Currents'); legend('A','B','C'); grid on;

% 2) Magnitudes
subplot(4,1,2);
plot(time_vector, mag(1,:), 'r', time_vector, mag(2,:), 'g', time_vector, mag(3,:), 'b','LineWidth',1.2);
yline(nominal(1)*settings.pickup_factor,'--k','Pickup');
xline(fault_start_time,'--k'); if ~isempty(tripIdx), xline(tripTime,'--r'); end
title('Estimated Magnitudes'); legend('A','B','C'); grid on;

% 3) Phases
subplot(4,1,3);
plot(time_vector, phase(1,:)*180/pi,'r', time_vector, phase(2,:)*180/pi,'g', time_vector, phase(3,:)*180/pi,'b','LineWidth',1.2);
xline(fault_start_time,'--k'); if ~isempty(tripIdx), xline(tripTime,'--r'); end
title('Estimated Phases (deg)'); legend('A','B','C'); grid on;

% 4) Trips
subplot(4,1,4);
plot(time_vector, trip(1,:),'r', time_vector, trip(2,:),'g', time_vector, trip(3,:),'b', time_vector, combined_trip,'k','LineWidth',1.5);
xline(fault_start_time,'--k'); if ~isempty(tripIdx), xline(tripTime,'--r'); end
title('Trip Signals'); legend('A','B','C','Combined'); ylim([-0.1 1.1]); grid on;

%% === Power Analysis ===
V_base = 1.0;
voltage = zeros(3, N);
for ph = 1:3
    voltage(ph, :) = V_base * sin(2*pi*f0*t + phi(ph));
end

power = voltage .* current;
total_power = sum(power, 1);

P_pre_fault  = mean(total_power(t < fault_start_time));
P_post_fault = mean(total_power(t >= fault_start_time));
power_loss   = P_pre_fault - P_post_fault;

fprintf('Estimated average power loss due to fault: %.4f p.u.\n', power_loss);

figure('Position',[100,100,900,400]);
plot(t, power(1,:), 'r', t, power(2,:), 'g', t, power(3,:), 'b', t, total_power, 'k','LineWidth',1.2);
xline(fault_start_time,'--k','Fault Start');
if ~isempty(tripIdx), xline(tripTime,'--r','Relay Trip'); end
title('Instantaneous Power per Phase and Total');
legend('P_A','P_B','P_C','Total'); grid on;
xlabel('Time (s)');
ylabel('Power (p.u.)');

%% === Supporting Functions ===
function [magnitude, phase, real_comp, imag_comp, time_vector] = oneCycleDFTContinuous(input_signal, fs, f0)
    samples_per_cycle = round(fs/f0);
    N = length(input_signal);
    magnitude = zeros(1,N); phase = zeros(1,N);
    real_comp = zeros(1,N); imag_comp = zeros(1,N);
    n = 0:samples_per_cycle-1;
    cos_c = cos(2*pi*n/samples_per_cycle);
    sin_c = sin(2*pi*n/samples_per_cycle);
    for i = samples_per_cycle:N
        w = input_signal(i-samples_per_cycle+1:i);
        real_comp(i) = (2/samples_per_cycle)*sum(w .* cos_c);
        imag_comp(i) = (-2/samples_per_cycle)*sum(w .* sin_c);
        magnitude(i) = hypot(real_comp(i), imag_comp(i));
        phase(i) = atan2(imag_comp(i), real_comp(i));
    end
    time_vector = (0:N-1)/fs;
end

function trip_signal = applyProtectionLogic(magnitude, nominal, settings)
    threshold = settings.pickup_factor * nominal;
    over = magnitude > threshold;
    count = filter(1, [1 -1], over);
    trip_signal = count >= round(settings.time_delay * settings.sampling_rate);
end
