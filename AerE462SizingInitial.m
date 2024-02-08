%VTOL Vision Initial Sizing - Aer E 461
clear,clc,close all

%STATICS
M_p = (34.6 + 280 + 5*4 +22*2 + 75)/1000; %kg
e = 0.7; %dim, rectangle wing
a = 343; %m/s
t_c = .12; %thickness / chord for NACA4412
Q_wing = 1.25; %dim, assuming high mounted
sweep = 0;

%Flight Conditions
mu = 1.789*10^-5; %Pa*s
rho = 1.225; %kg/m^3

%Adjustables
M_craft_lb = 2.26796; %kgs
velocity_mph = linspace(25,45,500); %mph
chord_in = 8; %inches
span_in = 30; %inches


%Derived
velocity = velocity_mph * 0.44704; % m/s
M_craft = M_craft_lb * 0.453592; % kgs
chord = chord_in * 0.0254; %meters
span = span_in * 0.0254; %meters
M_tot = M_p + M_craft; % kgs
wing_area = chord*span; %m^2
Reynolds = rho * velocity * chord / mu; %dim
dynamic_p = .5 * rho * velocity.^2; %Pa
AR = span^2/wing_area; %dim
K = 1/(pi*e*AR); %dim
M = velocity/a; %dim

%Friction
Cf_wing = .455./(log10(Reynolds).^2.58*(1+.144*(.06).^2).^.65);
FF = (1+.6/(chord/4)*t_c+100*t_c^4)*(1.34*M.^.18*(cos(sweep))^.28);
S_wetwing = (1.977+.52*t_c)*wing_area;
S_ratio = S_wetwing/wing_area;

%Prints

fprintf("K is: %0.4f \n",K)
