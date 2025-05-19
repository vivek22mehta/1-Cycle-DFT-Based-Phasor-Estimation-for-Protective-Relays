PSCAD 4.2.0

Settings
 {
 Id = "1745864581.1745952423"
 Author = "navee.navee"
 Desc = ""
 Arch = "windows"
 Options = 32
 Build = 18
 Warn = 1
 Check = 15
 Libs = ""
 Source = ""
 RunInfo = 
  {
  Fin = 0.5
  Step = 5e-005
  Plot = 0.00025
  Chat = 0.001
  Brch = 0.0005
  Lat = 100
  Options = 0
  Advanced = 4607
  Debug = 0
  StartFile = ""
  OFile = "noname.out"
  SFile = "noname.snp"
  SnapTime = 0.3
  Mruns = 10
  Mrunfile = 0
  StartType = 0
  PlotType = 0
  SnapType = 0
  MrunType = "mrun"
  }

 }

Definitions
 {
 Module("Main")
  {
  Desc = ""
  FileDate = 0
  Nodes = 
   {
   }

  Graphics = 
   {
   Rectangle(-18,-18,18,18)
   }


  Page(A/A4,Landscape,16,[768,386],5)
   {
   0.source_3([252,198],0,0,40)
    {
    Name = "Source 1"
    Type = "1"
    Grnd = "1"
    View = "0"
    Spec = "0"
    VCtrl = "1"
    FCtrl = "1"
    Vm = "230.0 [kV]"
    Tc = "0.05 [s]"
    f = "60.0 [Hz]"
    Ph = "0.0 [deg]"
    Vbase = "230.0 [kV]"
    Sbase = "100.0 [MVA]"
    Vpu = "1.0 [pu]"
    PhT = "0.0 [deg]"
    Pinit = "0.0 [pu]"
    Qinit = "0.0 [pu]"
    R = "1.0 [ohm]"
    Rs = "1.0 [ohm]"
    Rp = "1.0 [ohm]"
    Lp = "0.1 [H]"
    R' = "1.0 [ohm]"
    L = "0.1 [H]"
    C = "1.0 [uF]"
    L' = "0.1 [H]"
    C' = "1.0 [uF]"
    IA = ""
    IB = ""
    IC = ""
    }
   0.inductor([360,162],0,0,-1)
    {
    L = "0.1 [H]"
    }
   0.inductor([360,198],0,0,-1)
    {
    L = "0.1 [H]"
    }
   0.inductor([360,234],0,0,-1)
    {
    L = "0.1 [H]"
    }
   -Wire-([288,162],0,0,-1)
    {
    Vertex="0,0;72,0"
    }
   -Wire-([288,198],0,0,-1)
    {
    Vertex="0,0;72,0"
    }
   -Wire-([288,234],0,0,-1)
    {
    Vertex="0,0;72,0"
    }
   0.breaker3([504,198],2,0,190)
    {
    Ctrl = "0"
    OPCUR = "0"
    ENAB = "0"
    CLVL = "0.0 [kA]"
    View = "0"
    ViewB = "0"
    DisPQ = "0"
    NAME = "BRK"
    NAMEA = "BRKA"
    NAMEB = "BRKB"
    NAMEC = "BRKC"
    ROFF = "1.0e6 [ohm]"
    RON = "0.1 [ohm]"
    PRER = "0.5 [ohm]"
    TDA = "0.0 [s]"
    TDB = "0.0 [s]"
    TDC = "0.0 [s]"
    TDRA = "0.05 [s]"
    TDRB = "0.05 [s]"
    TDRC = "0.05 [s]"
    PostIns = "0"
    TDBOA = "0.005 [s]"
    IBRA = ""
    IBRB = ""
    IBRC = ""
    IBR0 = ""
    SBRA = ""
    SBRB = ""
    SBRC = ""
    BP = ""
    BQ = ""
    BOpen1 = "0"
    BOpen2 = "0"
    BOpen3 = "0"
    P = "0 [MW]"
    Q = "0 [MVAR]"
    }
   -Wire-([396,162],0,0,-1)
    {
    Vertex="0,0;72,0"
    }
   -Wire-([396,198],0,0,-1)
    {
    Vertex="0,0;72,0"
    }
   -Wire-([396,234],0,0,-1)
    {
    Vertex="0,0;72,0"
    }
   0.tpflt([666,360],1,0,180)
    {
    Ctype = "0"
    OpCur = "0"
    Grnd = "1"
    View = "0"
    CLVL = "0.0 [kA]"
    RON = "0.01 [ohm]"
    ROFF = "1.0E6 [ohm]"
    A = "1"
    B = "0"
    C = "0"
    G = "1"
    Ifla = ""
    Iflb = ""
    Iflc = ""
    AG1 = "0"
    }
   0.tfaultn([666,468],1,0,140)
    {
    TF = "0.2 [s]"
    DF = "0.2 [s]"
    }
   0.resistor([810,162],0,0,-1)
    {
    R = "100 [ohm]"
    }
   0.resistor([810,198],0,0,-1)
    {
    R = "100 [ohm]"
    }
   0.resistor([810,234],0,0,-1)
    {
    R = "100 [ohm]"
    }
   -Wire-([846,162],0,0,-1)
    {
    Vertex="0,0;0,72"
    }
   0.ground([846,198],0,0,-1)
    {
    }
   0.ammeter([540,162],0,0,30)
    {
    Name = "Ia"
    }
   0.ammeter([540,198],0,0,60)
    {
    Name = "Ib"
    }
   0.ammeter([540,234],0,0,80)
    {
    Name = "Ic"
    }
   -Wire-([576,162],0,0,-1)
    {
    Vertex="0,0;234,0"
    }
   -Wire-([576,198],0,0,-1)
    {
    Vertex="0,0;234,0"
    }
   -Wire-([576,234],0,0,-1)
    {
    Vertex="0,0;234,0"
    }
   -Wire-([702,324],0,0,-1)
    {
    Vertex="0,0;0,-162"
    }
   -Wire-([666,324],0,0,-1)
    {
    Vertex="0,0;0,-126"
    }
   -Wire-([630,324],0,0,-1)
    {
    Vertex="0,0;0,-90"
    }
   0.voltmetergnd([648,162],0,0,50)
    {
    Name = "Ea"
    }
   0.voltmetergnd([630,198],0,0,70)
    {
    Name = "Eb"
    }
   0.voltmetergnd([594,234],0,0,90)
    {
    Name = "Ec"
    }
   0.datalabel([828,324],0,0,-1)
    {
    Name = "Ia"
    }
   0.pgb([828,324],0,62507536,110)
    {
    Name = "Ia"
    Group = ""
    Display = "0"
    Scale = "1.0"
    Units = "A"
    mrun = "0"
    Pol = "0"
    Min = "-2.0"
    Max = "2.0"
    }
   0.datalabel([828,360],0,0,-1)
    {
    Name = "Ib"
    }
   0.pgb([828,360],0,62515696,120)
    {
    Name = "Ib"
    Group = ""
    Display = "0"
    Scale = "1.0"
    Units = ""
    mrun = "0"
    Pol = "0"
    Min = "-2.0"
    Max = "2.0"
    }
   0.datalabel([828,396],0,0,-1)
    {
    Name = "Ic"
    }
   0.pgb([828,396],0,62512024,130)
    {
    Name = "Ic"
    Group = ""
    Display = "0"
    Scale = "1.0"
    Units = ""
    mrun = "0"
    Pol = "0"
    Min = "-2.0"
    Max = "2.0"
    }
   0.consti([180,126],0,0,20)
    {
    Name = "F"
    Value = "50"
    }
   0.var([252,90],0,62508760,10)
    {
    Name = "<Untitled>"
    Group = ""
    Display = "0"
    Max = "230"
    Min = "0.0"
    Value = "230.0"
    Units = ""
    Collect = "1"
    }
   -Wire-([288,90],0,0,-1)
    {
    Vertex="0,0;36,0;36,36;-36,36"
    }
   -Plot-([990,216],0)
    {
    Title = "$(GROUP) : Graphs"
    Draw = 1
    Area = [0,0,450,216]
    Posn = [990,216]
    Icon = [-1,-1]
    Extents = 0,0,450,216
    XLabel = " "
    AutoPan = "false,75"
    Graph([0,0],[0,0,450,153],"y")
     {
     Options = 128
     Units = ""
     Curve(62515696,"Ib",0,,,)
     }
    }
   0.datalabel([432,504],0,0,-1)
    {
    Name = "Ea"
    }
   0.pgb([432,504],0,62504272,150)
    {
    Name = "Ea"
    Group = ""
    Display = "0"
    Scale = "1.0"
    Units = ""
    mrun = "0"
    Pol = "0"
    Min = "-2.0"
    Max = "2.0"
    }
   0.datalabel([432,540],0,0,-1)
    {
    Name = "Eb"
    }
   0.pgb([432,540],0,62509984,160)
    {
    Name = "Eb"
    Group = ""
    Display = "0"
    Scale = "1.0"
    Units = ""
    mrun = "0"
    Pol = "0"
    Min = "-150.0"
    Max = "150.0"
    }
   0.datalabel([432,576],0,0,-1)
    {
    Name = "Ec"
    }
   0.pgb([432,576],0,62505088,170)
    {
    Name = "Ec"
    Group = ""
    Display = "0"
    Scale = "1.0"
    Units = ""
    mrun = "0"
    Pol = "0"
    Min = "-2.0"
    Max = "2.0"
    }
   0.tbreakn([252,360],0,0,100)
    {
    NUMS = "2"
    INIT = "0"
    TO1 = "0.35[s]"
    TO2 = "0.5 [s]"
    }
   0.datalabel([180,360],0,0,-1)
    {
    Name = "BRK"
    }
   -Wire-([180,360],0,0,-1)
    {
    Vertex="0,0;36,0"
    }
   -ControlPanel-([360,0],0)
    {
    Name = "$(GROUP) : Controls"
    Flags = 0
    State = 1
    Icon = -1,-1
    Posn = 360,0
    Extents = 0,0,0,0
    Slider(62508760)
    }
   -Plot-([990,432],0)
    {
    Title = "$(GROUP) : Graphs"
    Draw = 1
    Area = [0,0,450,198]
    Posn = [990,432]
    Icon = [-1,-1]
    Extents = 0,0,450,198
    XLabel = " "
    AutoPan = "false,75"
    Graph([0,0],[0,0,450,135],"y")
     {
     Options = 128
     Units = ""
     Curve(62512024,"Ic",0,,,)
     }
    }
   -Plot-([414,648],0)
    {
    Title = "$(GROUP) : Graphs"
    Draw = 1
    Area = [0,0,450,198]
    Posn = [414,648]
    Icon = [-1,-1]
    Extents = 0,0,450,198
    XLabel = " "
    AutoPan = "false,75"
    Graph([0,0],[0,0,450,135],"y")
     {
     Options = 0
     Units = ""
     Curve(62509984,"Eb",0,,,)
     }
    }
   -Plot-([0,648],0)
    {
    Title = "$(GROUP) : Graphs"
    Draw = 1
    Area = [0,0,414,198]
    Posn = [0,648]
    Icon = [-1,-1]
    Extents = 0,0,414,198
    XLabel = " "
    AutoPan = "false,75"
    Graph([0,0],[0,0,414,135],"y")
     {
     Options = 128
     Units = ""
     Curve(62504272,"Ea",0,,,)
     }
    }
   -Plot-([864,648],0)
    {
    Title = "$(GROUP) : Graphs"
    Draw = 1
    Area = [0,0,432,198]
    Posn = [864,648]
    Icon = [-1,-1]
    Extents = 0,0,432,198
    XLabel = " "
    AutoPan = "false,75"
    Graph([0,0],[0,0,432,135],"y")
     {
     Options = 128
     Units = ""
     Curve(62505088,"Ec",0,,,)
     }
    }
   -Sticky-([684,0],0)
    {
    Name = ""
    Font = 1
    Bounds = 684,0,792,90
    Alignment = 0
    Style = 1
    Arrow = 0
    Color = 0,15792890
    Text = "\
Team : 7
Naveen S H
Aditya Singh
Rohit Prajapati
Vivek Kumar"
    }
   -Plot-([990,0],0)
    {
    Title = "$(GROUP) : Graphs"
    Draw = 1
    Area = [0,0,450,216]
    Posn = [990,0]
    Icon = [-1,-1]
    Extents = 0,0,450,216
    XLabel = " "
    AutoPan = "false,75"
    Graph([0,0],[0,0,450,153],"y")
     {
     Options = 128
     Units = ""
     Curve(62507536,"Ia",0,,,)
     }
    }
   }
  }
 }

