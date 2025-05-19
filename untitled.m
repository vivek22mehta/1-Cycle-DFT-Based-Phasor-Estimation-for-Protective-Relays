%%
clc; clear; close all;

% Define numerator and denominator coefficients
n = [1 2 4]; % Numerator coefficients
d = [3 6 7 8 9]; % Denominator coefficients

% Create Transfer Function
transfer_function = tf(n, d);

% Convert TF to Zero-Pole-Gain Representation
G = zpk(transfer_function);

% Compute Poles and Zeros
[z, p, k] = tf2zp(n, d);

% Convert back to Transfer Function (for verification)
[n1, d1] = zp2tf(z, p, k);

% Plot Pole-Zero Map
figure;
pzmap(transfer_function);
grid on;
title('Pole-Zero Configuration in S-Plane');
xlabel('Real Part');
ylabel('Imaginary Part');

% Open LTI Viewer for System Analysis
%ltiview(G);

%%
clc; clear; close all;

% Define Transfer Functions
n1 = [1 0];  % Numerator of G1
d1 = [0 1];  % Denominator of G1
G1 = tf(n1, d1, 'inputname', 'Ei', 'outputname', 'E01');

n2 = [5];    % Numerator of G2
d2 = [1];    % Denominator of G2
G2 = tf(n2, d2, 'inputname', 'Ei', 'outputname', 'E02');

n3 = [1];    % Numerator of G3
d3 = [1 1 0];% Denominator of G3
G3 = tf(n3, d3, 'inputname', 'E0', 'outputname', 'C');

n4 = [1];    % Numerator of H1 (feedback)
d4 = [1];    % Denominator of H1
H1 = tf(n4, d4, 'inputname', 'C', 'outputname', 'B');

% Compute Parallel Combination of G1 and G2
G_12 = parallel(G1, G2);

% Compute Series Combination of G_12 and G3
G_forward = series(G_12, G3);

% Compute Closed-loop Transfer Function using Negative Feedback
G_overall = feedback(G_forward, H1);

% Display the Overall Transfer Function
disp('Overall Transfer Function:');
G_overall

% Plot the Pole-Zero Map of the Overall System
figure;
pzmap(G_overall);
grid on;
title('Pole-Zero Configuration of the Overall System');
xlabel('Real Part');
ylabel('Imaginary Part');

%%
clc; clear; close all;

% Define the Transfer Function
n = [25];      % Numerator coefficients
d = [1 6 25];  % Denominator coefficients
sys = tf(n, d);

% Compute Poles (Roots of Denominator)
R = roots(d);
disp('Poles of the System:');
disp(R);

% Step Response Information
S = stepinfo(sys, 'RiseTimeLimits', [0.01, 1.00]);
disp('Step Response Information:');
disp(S);

% Plot Step Response
figure;
step(sys);
grid on;
title('Step Response of the System');

% Pole-Zero Plot
figure;
pzmap(sys);
grid on;
title('Pole-Zero Map of the System');

% Use LTI Viewer
ltiview({'step'}, sys);
%%
clc; clear; close all;

% Define Transfer Function
h1 = tf(9, [1 6 9]);

% Define Time Vector (100 points from 0 to 15)
t = linspace(0, 15, 100);

% Step Response
subplot(3,2,1);
step(h1);
title('Step Response');

% Impulse Response
subplot(3,2,2);
impulse(h1);
title('Impulse Response');

% Sine Input Response
r = sin(t);
subplot(3,2,3);
lsim(h1, r, t);
title('Response to sin(t)');

% Linear Input Response
s = 2*t;
subplot(3,2,4);
lsim(h1, s, t);
title('Response to 2t');

% Quadratic Input Response
q = 2 * (t.^2);
subplot(3,2,5);
lsim(h1, q, t);
title('Response to 2t^2');

% Pole-Zero Map
subplot(3,2,6);
pzmap(h1);
title('Pole-Zero Map');
grid on;

%%
clear all;
close all;
clc;

% Define Transfer Function
h = tf(4, [1 3 4]);

% Compute Step Response
[y, t] = step(h);

% Find Steady-State Value
c = y(end);  % Last value of the step response

% Compute Steady-State Error
sserror = abs(1 - c);

% Display Result
fprintf('Steady-State Error: %f\n', sserror);
