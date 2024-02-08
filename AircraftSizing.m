%Aircraft Sizing

clear, clc

%Given Parameters

W = 6/0.0625; %oz
ToW = 2; %Thrust over Weight
Vstall = 20*1.46667; %mph -> ft/s
Vmax = 45*1.46667; %mph -> ft/s

alt = 100; %ft
WoS = [10, 15, 20, 25, 30]; %oz/ft^2

Clcruise = 0.3;
Clmax = 1.2;
rho = 0.0742; %lb/ft^3

V = linspace(Vstall, Vmax); 

%Planform Area
S = W./WoS ;
%plot(WoS, S)
%title("Type of Plane, W/S vs. Planform Area, S (ft^2)")
%xlabel('Type of Plane')
%ylabel('Planform Area, ft^2')
%text(WoS(1), 9.6, '\leftarrow Glider')
%text(WoS(2), 6.4, '\leftarrow Trainer')
%text(WoS(3), 4.8, '\leftarrow Sport')
%text(WoS(4), 3.84, '\leftarrow Warbird')
%text(WoS(5), 3.2, '\leftarrow Jet')

%Select Planform Area
qmax= 0.5*rho*Vmax.^2;
qmin= 0.5*rho*Vstall^2;
Clmaxi = (1./qmin)*(WoS(2));
Clmin = (1./qmax)*(WoS(2));

plot(V, Cl);

Cdmin = Clmin./10 ;
Cdmaxi = Clmaxi./3 ;


%Prmax = 0.5*rho*(Vmax^3)*S(3)*Cdmax*(0.0421401101);
Prmin = 0.5*rho*(Vstall^3)*S(3)*Cdmin*(0.0421401101);
Pr = 0.5*rho*(Vmax^3)*S(3)*Cdmaxi*(0.0421401101);





