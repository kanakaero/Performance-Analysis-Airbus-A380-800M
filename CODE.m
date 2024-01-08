import ISA.*
format short
import InterX.*
height = [0:10:20000];            % meters
[T, a, P, rho] = atmosisa(height);
%% DATA A380 800M
wto = 6695; %kN
WTO = 6695*1000; %N
WEmpty= 2725;  %kN
WPayLoad = 1480; %kN
WFuel = 2490;  %kN
% T = 350;   % *sigma  Thrust per Engine  sigmakN (sigma is density ratio at altitude h)
% No of Engines:4
TSFC_SL = 47.5; %root theta kg/hr/kN (theta is temperature ratio at altitude h)
S = 845; %m2
AR = 7.53;
e = 0.965;
Mcrit_orig = 0.895;
AL = 55; %kN/m2 Maximum permissible dynamic head (Aeroelastic limit)
q_max = AL*1000; %N/m2
CDo= 0.011; %Parasite drag coefficient 
CLmax= 1.15;  %Aircraft CLmaxwithout HLD (plain wing) 
CLmax_HLD_full = 1.85; %DeltaCLmaxfrom full HLD for landing 
CLmax_HLD_part = 1.15;  %DeltaCLmaxfrom partial HLD for take off
CLmax_climb = 0.9; % CLmaxTO (CLmax for climb segment of take off)
CDo_Land_Gear =0.0042; % DELTA
CDo_Flap = 0.0034; % DELTA (for take off ground run and climb segments)
CL_Ground_Run = 0.12;
mu = 0.02;  %Rolling friction coefficient mu
n_max= 2.5;  %Load factor 
% Seats: 3 Class 575 and 1 Class 853
Range = 14800; %km
Take_off_dist = 3000; %m
Rho_SL = 1.225;
T_SL = T(1);
k = 1/(pi*AR*e);
g = 9.81; % m/s2
%% PLOT 1
%% DRAG POLAR CALCULATION
% 0.9 WTO, 0.8 WTO and 0.6 WTO for 0.5, 3, 5.5, 8.5,10.5 & 11.5 km
[~,a_1,~, rho_1] = ISA(500);
[~,a_2,~, rho_2] = ISA(3000);
[~,a_3,~, rho_3] = ISA(5500);
[~,a_4,~, rho_4] = ISA(8500);
[~,a_5,~, rho_5] = ISA(10500);
[~,a_6,~, rho_6] = ISA(11000);
% Mcrit for diff altitudes
Mcrit_1 = 0.895*a_1;
Mcrit_2 = 0.895*a_2;
Mcrit_3 = 0.895*a_3;
Mcrit_4 = 0.895*a_4;
Mcrit_5 = 0.895*a_5;
Mcrit_6 = 0.895*a_6;
% Density ratio
sigma_1 = rho_1/Rho_SL;
sigma_2 = rho_2/Rho_SL;
sigma_3 = rho_3/Rho_SL;
sigma_4 = rho_4/Rho_SL;
sigma_5 = rho_5/Rho_SL;
sigma_6 = rho_6/Rho_SL;
% V_stall Calculation
% 0.9 WTO
V_stall_1_9 = ((2*0.9*WTO)/(rho_1*S*CLmax))^0.5;
V_stall_2_9 = ((2*0.9*WTO)/(rho_2*S*CLmax))^0.5;
V_stall_3_9 = ((2*0.9*WTO)/(rho_3*S*CLmax))^0.5;
V_stall_4_9 = ((2*0.9*WTO)/(rho_4*S*CLmax))^0.5;
V_stall_5_9 = ((2*0.9*WTO)/(rho_5*S*CLmax))^0.5;
V_stall_6_9 = ((2*0.9*WTO)/(rho_6*S*CLmax))^0.5;
% 0.8 WTO
V_stall_1_8 = ((2*0.8*WTO)/(rho_1*S*CLmax))^0.5;
V_stall_2_8 = ((2*0.8*WTO)/(rho_2*S*CLmax))^0.5;
V_stall_3_8 = ((2*0.8*WTO)/(rho_3*S*CLmax))^0.5;
V_stall_4_8 = ((2*0.8*WTO)/(rho_4*S*CLmax))^0.5;
V_stall_5_8 = ((2*0.8*WTO)/(rho_5*S*CLmax))^0.5;
V_stall_6_8 = ((2*0.8*WTO)/(rho_6*S*CLmax))^0.5;
% 0.6 WTO
V_stall_1_6 = ((2*0.6*WTO)/(rho_1*S*CLmax))^0.5;
V_stall_2_6 = ((2*0.6*WTO)/(rho_2*S*CLmax))^0.5;
V_stall_3_6 = ((2*0.6*WTO)/(rho_3*S*CLmax))^0.5;
V_stall_4_6 = ((2*0.6*WTO)/(rho_4*S*CLmax))^0.5;
V_stall_5_6 = ((2*0.6*WTO)/(rho_5*S*CLmax))^0.5;
V_stall_6_6 = ((2*0.6*WTO)/(rho_6*S*CLmax))^0.5;
% A for various altitudes
A_0 = CDo*Rho_SL*S*0.5;
A_1 = CDo*rho_1*S*0.5;
A_2 = CDo*rho_2*S*0.5;
A_3 = CDo*rho_3*S*0.5;
A_4 = CDo*rho_4*S*0.5;
A_5 = CDo*rho_5*S*0.5;
A_6 = CDo*rho_6*S*0.5;
% B for various altitudes at 0.9 WTO
B_0_9 = (2*k*((0.9*WTO)^2))/(Rho_SL*S);
B_1_9 = (2*k*((0.9*WTO)^2))/(rho_1*S);
B_2_9 = (2*k*((0.9*WTO)^2))/(rho_2*S);
B_3_9 = (2*k*((0.9*WTO)^2))/(rho_3*S);
B_4_9 = (2*k*((0.9*WTO)^2))/(rho_4*S);
B_5_9 = (2*k*((0.9*WTO)^2))/(rho_5*S);
B_6_9 = (2*k*((0.9*WTO)^2))/(rho_6*S);
% B for various altitudes at 0.8 WTO
B_0_8 = (2*k*((0.8*WTO)^2))/(Rho_SL*S);
B_1_8 = (2*k*((0.8*WTO)^2))/(rho_1*S);
B_2_8 = (2*k*((0.8*WTO)^2))/(rho_2*S);
B_3_8 = (2*k*((0.8*WTO)^2))/(rho_3*S);
B_4_8 = (2*k*((0.8*WTO)^2))/(rho_4*S);
B_5_8 = (2*k*((0.8*WTO)^2))/(rho_5*S);
B_6_8 = (2*k*((0.8*WTO)^2))/(rho_6*S);
% B for various altitudes at 0.6 WTO
B_0_6 = (2*k*((0.6*WTO)^2))/(Rho_SL*S);
B_1_6 = (2*k*((0.6*WTO)^2))/(rho_1*S);
B_2_6 = (2*k*((0.6*WTO)^2))/(rho_2*S);
B_3_6 = (2*k*((0.6*WTO)^2))/(rho_3*S);
B_4_6 = (2*k*((0.6*WTO)^2))/(rho_4*S);
B_5_6 = (2*k*((0.6*WTO)^2))/(rho_5*S);
B_6_6 = (2*k*((0.6*WTO)^2))/(rho_6*S);
% Drag Calculation
V = 25:1:500;
% D for various altitudes at 0.9 WTO
D_0_9 = ((A_0).*(V.^2))+((B_0_9)./(V.^2));
D_1_9 = ((A_1).*(V.^2))+((B_1_9)./(V.^2));
D_2_9 = ((A_1).*(V.^2))+((B_2_9)./(V.^2));
D_3_9 = ((A_1).*(V.^2))+((B_3_9)./(V.^2));
D_4_9 = ((A_1).*(V.^2))+((B_4_9)./(V.^2));
D_5_9 = ((A_1).*(V.^2))+((B_5_9)./(V.^2));
D_6_9 = ((A_1).*(V.^2))+((B_6_9)./(V.^2));
% D for various altitudes at 0.8 WTO
D_0_8 = ((A_0).*(V.^2))+((B_0_8)./(V.^2));
D_1_8 = ((A_1).*(V.^2))+((B_1_8)./(V.^2));
D_2_8 = ((A_1).*(V.^2))+((B_2_8)./(V.^2));
D_3_8 = ((A_1).*(V.^2))+((B_3_8)./(V.^2));
D_4_8 = ((A_1).*(V.^2))+((B_4_8)./(V.^2));
D_5_8 = ((A_1).*(V.^2))+((B_5_8)./(V.^2));
D_6_8 = ((A_1).*(V.^2))+((B_6_8)./(V.^2));
% D for various altitudes at 0.6 WTO
D_0_6 = ((A_0).*(V.^2))+((B_0_6)./(V.^2));
D_1_6 = ((A_1).*(V.^2))+((B_1_6)./(V.^2));
D_2_6 = ((A_1).*(V.^2))+((B_2_6)./(V.^2));
D_3_6 = ((A_1).*(V.^2))+((B_3_6)./(V.^2));
D_4_6 = ((A_1).*(V.^2))+((B_4_6)./(V.^2));
D_5_6 = ((A_1).*(V.^2))+((B_5_6)./(V.^2));
D_6_6 = ((A_1).*(V.^2))+((B_6_6)./(V.^2));
% V_D_min for 0.9 WTO and various Altitudes
V_D_min_1_9 = (((2*(0.9*WTO))/(rho_1*S))*((k/CDo)^0.5))^0.5;
V_D_min_2_9 = (((2*(0.9*WTO))/(rho_2*S))*((k/CDo)^0.5))^0.5;
V_D_min_3_9 = (((2*(0.9*WTO))/(rho_3*S))*((k/CDo)^0.5))^0.5;
V_D_min_4_9 = (((2*(0.9*WTO))/(rho_4*S))*((k/CDo)^0.5))^0.5;
V_D_min_5_9 = (((2*(0.9*WTO))/(rho_5*S))*((k/CDo)^0.5))^0.5;
V_D_min_6_9 = (((2*(0.9*WTO))/(rho_6*S))*((k/CDo)^0.5))^0.5;
% V_D_min for 0.9 WTO and various Altitudes
V_D_min_1_8 = (((2*(0.8*WTO))/(rho_1*S))*((k/CDo)^0.5))^0.5;
V_D_min_2_8 = (((2*(0.8*WTO))/(rho_2*S))*((k/CDo)^0.5))^0.5;
V_D_min_3_8 = (((2*(0.8*WTO))/(rho_3*S))*((k/CDo)^0.5))^0.5;
V_D_min_4_8 = (((2*(0.8*WTO))/(rho_4*S))*((k/CDo)^0.5))^0.5;
V_D_min_5_8 = (((2*(0.8*WTO))/(rho_5*S))*((k/CDo)^0.5))^0.5;
V_D_min_6_8 = (((2*(0.8*WTO))/(rho_6*S))*((k/CDo)^0.5))^0.5;
% V_D_min for 0.9 WTO and various Altitudes
V_D_min_1_6 = (((2*(0.6*WTO))/(rho_1*S))*((k/CDo)^0.5))^0.5;
V_D_min_2_6 = (((2*(0.6*WTO))/(rho_2*S))*((k/CDo)^0.5))^0.5;
V_D_min_3_6 = (((2*(0.6*WTO))/(rho_3*S))*((k/CDo)^0.5))^0.5;
V_D_min_4_6 = (((2*(0.6*WTO))/(rho_4*S))*((k/CDo)^0.5))^0.5;
V_D_min_5_6 = (((2*(0.6*WTO))/(rho_5*S))*((k/CDo)^0.5))^0.5;
V_D_min_6_6 = (((2*(0.6*WTO))/(rho_6*S))*((k/CDo)^0.5))^0.5;
% Altitude plot
A_0 = CDo*Rho_SL*S*0.5;
B_0_9 = (2*k*((0.9*WTO)^2))/(Rho_SL*S);
B_0_8 = (2*k*((0.8*WTO)^2))/(Rho_SL*S);
B_0_6 = (2*k*((0.6*WTO)^2))/(Rho_SL*S);
% Drag 0.9 WTO and various altitudes
D_0_9_1 = ((A_0).*((V.*(sigma_1)^0.5).^2))+((B_0_9)./((V.*(sigma_1)^0.5).^2));
D_0_9_2 = ((A_0).*((V.*(sigma_2)^0.5).^2))+((B_0_9)./((V.*(sigma_2)^0.5).^2));
D_0_9_3 = ((A_0).*((V.*(sigma_3)^0.5).^2))+((B_0_9)./((V.*(sigma_3)^0.5).^2));
D_0_9_4 = ((A_0).*((V.*(sigma_4)^0.5).^2))+((B_0_9)./((V.*(sigma_4)^0.5).^2));
D_0_9_5 = ((A_0).*((V.*(sigma_5)^0.5).^2))+((B_0_9)./((V.*(sigma_5)^0.5).^2));
D_0_9_6 = ((A_0).*((V.*(sigma_6)^0.5).^2))+((B_0_9)./((V.*(sigma_6)^0.5).^2));
% Drag 0.8 WTO and various altitudes
D_0_8_1 = ((A_0).*((V.*(sigma_1)^0.5).^2))+((B_0_8)./((V.*(sigma_1)^0.5).^2));
D_0_8_2 = ((A_0).*((V.*(sigma_2)^0.5).^2))+((B_0_8)./((V.*(sigma_2)^0.5).^2));
D_0_8_3 = ((A_0).*((V.*(sigma_3)^0.5).^2))+((B_0_8)./((V.*(sigma_3)^0.5).^2));
D_0_8_4 = ((A_0).*((V.*(sigma_4)^0.5).^2))+((B_0_8)./((V.*(sigma_4)^0.5).^2));
D_0_8_5 = ((A_0).*((V.*(sigma_5)^0.5).^2))+((B_0_8)./((V.*(sigma_5)^0.5).^2));
D_0_8_6 = ((A_0).*((V.*(sigma_6)^0.5).^2))+((B_0_8)./((V.*(sigma_6)^0.5).^2));
% Drag 0.6 WTO and various altitudes
D_0_6_1 = ((A_0).*((V.*(sigma_1)^0.5).^2))+((B_0_6)./((V.*(sigma_1)^0.5).^2));
D_0_6_2 = ((A_0).*((V.*(sigma_2)^0.5).^2))+((B_0_6)./((V.*(sigma_2)^0.5).^2));
D_0_6_3 = ((A_0).*((V.*(sigma_3)^0.5).^2))+((B_0_6)./((V.*(sigma_3)^0.5).^2));
D_0_6_4 = ((A_0).*((V.*(sigma_4)^0.5).^2))+((B_0_6)./((V.*(sigma_4)^0.5).^2));
D_0_6_5 = ((A_0).*((V.*(sigma_5)^0.5).^2))+((B_0_6)./((V.*(sigma_5)^0.5).^2));
D_0_6_6 = ((A_0).*((V.*(sigma_6)^0.5).^2))+((B_0_6)./((V.*(sigma_6)^0.5).^2));
% % D_min at Various Weights
D_min_9 = (2*0.9*WTO)*((k*CDo)^0.5);
D_min_8 = (2*0.8*WTO)*((k*CDo)^0.5);
D_min_6 = (2*0.6*WTO)*((k*CDo)^0.5);
%% D_min indices
% 0.9 WTO
[D_min_1_9,index_1_9] = min(D_0_9_1);
[D_min_2_9,index_2_9] = min(D_0_9_2);
[D_min_3_9,index_3_9] = min(D_0_9_3);
[D_min_4_9,index_4_9] = min(D_0_9_4);
[D_min_5_9,index_5_9] = min(D_0_9_5);
[D_min_6_9,index_6_9] = min(D_0_9_6);

% 0.8 WTO
[D_min_1_8,index_1_8] = min(D_0_8_1);
[D_min_2_8,index_2_8] = min(D_0_8_2);
[D_min_3_8,index_3_8] = min(D_0_8_3);
[D_min_4_8,index_4_8] = min(D_0_8_4);
[D_min_5_8,index_5_8] = min(D_0_8_5);
[D_min_6_8,index_6_8] = min(D_0_8_6);

% 0.6 WTO
[D_min_1_6,index_1_6] = min(D_0_6_1);
[D_min_2_6,index_2_6] = min(D_0_6_2);
[D_min_3_6,index_3_6] = min(D_0_6_3);
[D_min_4_6,index_4_6] = min(D_0_6_4);
[D_min_5_6,index_5_6] = min(D_0_6_5);
[D_min_6_6,index_6_6] = min(D_0_6_6);

% Alt 1
[D_min_1_9_n,index_1_9_n] = min(D_1_9);
[D_min_1_8_n,index_1_8_n] = min(D_1_8);
[D_min_1_6_n,index_1_6_n] = min(D_1_6);

% Alt 2
[D_min_2_9_n,index_2_9_n] = min(D_2_9);
[D_min_2_8_n,index_2_8_n] = min(D_2_8);
[D_min_2_6_n,index_2_6_n] = min(D_2_6);

% Alt 3
[D_min_3_9_n,index_3_9_n] = min(D_3_9);
[D_min_3_8_n,index_3_8_n] = min(D_3_8);
[D_min_3_6_n,index_3_6_n] = min(D_3_6);

% Alt 4
[D_min_4_9_n,index_4_9_n] = min(D_4_9);
[D_min_4_8_n,index_4_8_n] = min(D_4_8);
[D_min_4_6_n,index_4_6_n] = min(D_4_6);

% Alt 5
[D_min_5_9_n,index_5_9_n] = min(D_5_9);
[D_min_5_8_n,index_5_8_n] = min(D_5_8);
[D_min_5_6_n,index_5_6_n] = min(D_5_6);

% Alt 6
[D_min_6_9_n,index_6_9_n] = min(D_6_9);
[D_min_6_8_n,index_6_8_n] = min(D_6_8);
[D_min_6_6_n,index_6_6_n] = min(D_6_6);
%% DRAG POLAR PLOT
%% 0.9 WTO
title("Drag Polar for Various Altitudes at 0.9 $W_{TO}$","Interpreter","latex",'FontSize',20)
hold on
% Curves
plot(V(78:280),D_0_9_1(78:280),'Color','magenta','LineWidth',1.2)
plot(V(88:270),D_0_9_2(88:270),'Color','blue','LineWidth',1.2)
plot(V(105:265),D_0_9_3(105:265),'Color',	"#D95319",'LineWidth',1.2)
plot(V(130:255),D_0_9_4(130:255),'Color',	"#EDB120",'LineWidth',1.2)
plot(V(150:245),D_0_9_5(150:245),'Color','green','LineWidth',1.2)
plot(V(160:243),D_0_9_6(160:243),'Color',"#4DBEEE",'LineWidth',1.2)
% V_D_min for legend
plot([V(index_1_9) V(index_1_9)],[0 D_min_1_9],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit for legend
plot([Mcrit_1 Mcrit_1],[0 D_0_9_1(278)],'-.','Color',"#009899",'LineWidth',1.3)
% V_stall for legend
plot([V_stall_1_9 V_stall_1_9],[0 D_0_9_1(79)],'-.','Color',"#6600cc",'LineWidth',1.1)
% V_stall lines
plot([V_stall_2_9 V_stall_2_9],[0 D_0_9_2(92)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_3_9 V_stall_3_9],[0 D_0_9_3(109)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_4_9 V_stall_4_9],[0 D_0_9_4(134)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_5_9 V_stall_5_9],[0 D_0_9_5(154)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_6_9 V_stall_6_9],[0 D_0_9_6(160)],'-.','Color',"#6600cc",'LineWidth',1.1)
% D_min line
yline(264549,'--','Color','black','LineWidth',1.1)
% D_min text
text(40,240000,'$D_{min}$ = 264549 N','Interpreter','latex','FontSize',15)
% V_D_min line
plot([V(index_2_9) V(index_2_9)],[0 D_min_2_9],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_3_9) V(index_3_9)],[0 D_min_3_9],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_4_9) V(index_4_9)],[0 D_min_4_9],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_5_9) V(index_5_9)],[0 D_min_5_9],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_6_9) V(index_6_9)],[0 D_min_6_9],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit line
plot([Mcrit_2 Mcrit_2],[0 D_0_9_2(270)],'-.','Color',"#009899",'LineWidth',1.3)
plot([Mcrit_3 Mcrit_3],[0 D_0_9_3(261)],'-.','Color',"#009899",'LineWidth',1.3)
plot([Mcrit_4 Mcrit_4],[0 D_0_9_4(249)],'-.','Color',"#009899",'LineWidth',1.3)
plot([Mcrit_5 Mcrit_5],[0 D_0_9_5(242)],'-.','Color',"#009899",'LineWidth',1.3)
plot([Mcrit_6 Mcrit_6],[0 D_0_9_6(240)],'-.','Color',"#009899",'LineWidth',1.3)
hold off
grid on
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',17)
ylabel("Drag (N)",'Interpreter','latex','FontSize',17)
xlim([0 340])
ylim([0 700000])
xticks(25:25:330)
leg1 = legend("0.5 Km","3 Km","5.5 Km","8.5 Km","10.5 Km","11.5 Km","$V_{D_{min}}$","$V_{crit}$","$V_{stall}$",'Interpreter','latex','Location','northwest','FontSize',16); 
title(leg1,'Legend')
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
% matlab2tikz('09WTO.tex'); 
%% 0.8 WTO
title("Drag Polar for Various Altitudes at 0.8 $W_{TO}$","Interpreter","latex",'FontSize',20)
hold on
% Curves
plot(V(70:280),D_0_8_1(70:280),'Color','magenta','LineWidth',1.2)
plot(V(85:273),D_0_8_2(85:273),'Color','blue','LineWidth',1.2)
plot(V(100:263),D_0_8_3(100:263),'Color',	"#D85318",'LineWidth',1.2)
plot(V(123:253),D_0_8_4(123:253),'Color',	"#EDB120",'LineWidth',1.2)
plot(V(140:243),D_0_8_5(140:243),'Color','green','LineWidth',1.2)
plot(V(148:233),D_0_8_6(148:233),'Color',"#4DBEEE",'LineWidth',1.2)
% V_D_min for legend
plot([V(index_1_8) V(index_1_8)],[0 D_min_1_8],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit for legend
plot([Mcrit_1 Mcrit_1],[0 D_0_8_1(278)],'-.','Color',"#008888",'LineWidth',1.3)
% V_stall for legend
plot([V_stall_1_8 V_stall_1_8],[0 D_0_8_1(72)],'-.','Color',"#6600cc",'LineWidth',1.1)
% V_stall lines
plot([V_stall_2_8 V_stall_2_8],[0 D_0_8_2(85)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_3_8 V_stall_3_8],[0 D_0_8_3(100)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_4_8 V_stall_4_8],[0 D_0_8_4(124)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_5_8 V_stall_5_8],[0 D_0_8_5(144)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_6_8 V_stall_6_8],[0 D_0_8_6(149)],'-.','Color',"#6600cc",'LineWidth',1.1)
% D_min line
yline(235145,'--','Color','black','LineWidth',1.1)
% D_min text
text(40,190000,'$D_{min}$ = 235145 N','Interpreter','latex','FontSize',14)
% V_D_min line
plot([V(index_2_8) V(index_2_8)],[0 D_min_2_8],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_3_8) V(index_3_8)],[0 D_min_3_8],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_4_8) V(index_4_8)],[0 D_min_4_8],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_5_8) V(index_5_8)],[0 D_min_5_8],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_6_8) V(index_6_8)],[0 D_min_6_8],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit line
plot([Mcrit_2 Mcrit_2],[0 D_0_8_2(270)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_3 Mcrit_3],[0 D_0_8_3(261)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_4 Mcrit_4],[0 D_0_8_4(248)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_5 Mcrit_5],[0 D_0_8_5(242)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_6 Mcrit_6],[0 D_0_8_6(240)],'-.','Color',"#008888",'LineWidth',1.3)
hold off
grid on
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',17)
ylabel("Drag (N)",'Interpreter','latex','FontSize',17)
leg1 = legend("0.5 Km","3 Km","5.5 Km","8.5 Km","10.5 Km","11.5 Km","$V_{D_{min}}$","$V_{crit}$","$V_{stall}$",'Interpreter','latex','Location','northwest','FontSize',16); 
title(leg1,'Legend')
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
ylim([0 0.8e6])
xlim([0 340])
xticks(25:25:330)
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
% matlab2tikz('08WTO.tex'); 
%% O.6 WTO
hold on
title("Drag Polar for Various Altitudes at 0.6 $W_{TO}$","Interpreter","latex",'FontSize',20)
hold on
% Curves
plot(V(58:280),D_0_6_1(58:280),'Color','magenta','LineWidth',1.2)
plot(V(70:271),D_0_6_2(70:271),'Color','blue','LineWidth',1.2)
plot(V(83:263),D_0_6_3(83:263),'Color',	"#D65316",'LineWidth',1.2)
plot(V(105:252),D_0_6_4(105:252),'Color',	"#EDB120",'LineWidth',1.2)
plot(V(120:243),D_0_6_5(120:243),'Color','green','LineWidth',1.2)
plot(V(125:241),D_0_6_6(125:241),'Color',"#4DBEEE",'LineWidth',1.2)
% V_D_min for legend
plot([V(index_1_6) V(index_1_6)],[0 D_min_1_6],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit for legend
plot([Mcrit_1 Mcrit_1],[0 D_0_6_1(278)],'-.','Color',"#006666",'LineWidth',1.3)
% V_stall for legend
plot([V_stall_1_6 V_stall_1_6],[0 D_0_6_1(60)],'-.','Color',"#6600cc",'LineWidth',1.1)
% V_stall lines
plot([V_stall_2_6 V_stall_2_6],[0 D_0_6_2(71)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_3_6 V_stall_3_6],[0 D_0_6_3(84)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_4_6 V_stall_4_6],[0 D_0_6_4(105)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_5_6 V_stall_5_6],[0 D_0_6_5(121)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_6_6 V_stall_6_6],[0 D_0_6_6(126)],'-.','Color',"#6600cc",'LineWidth',1.1)
% D_min line
yline(176492,'--','Color','black','LineWidth',1.1)
% D_min text
text(40,150000,'$D_{min}$ = 176492 N','Interpreter','latex','FontSize',15)
% V_D_min line
plot([V(index_2_6) V(index_2_6)],[0 D_min_2_6],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_3_6) V(index_3_6)],[0 D_min_3_6],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_4_6) V(index_4_6)],[0 D_min_4_6],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_5_6) V(index_5_6)],[0 D_min_5_6],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_6_6) V(index_6_6)],[0 D_min_6_6],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit line
plot([Mcrit_2 Mcrit_2],[0 D_0_6_2(270)],'-.','Color',"#006666",'LineWidth',1.3)
plot([Mcrit_3 Mcrit_3],[0 D_0_6_3(261)],'-.','Color',"#006666",'LineWidth',1.3)
plot([Mcrit_4 Mcrit_4],[0 D_0_6_4(246)],'-.','Color',"#006666",'LineWidth',1.3)
plot([Mcrit_5 Mcrit_5],[0 D_0_6_5(242)],'-.','Color',"#006666",'LineWidth',1.3)
plot([Mcrit_6 Mcrit_6],[0 D_0_6_6(240)],'-.','Color',"#006666",'LineWidth',1.3)
hold off
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',17)
ylabel("Drag (N)",'Interpreter','latex','FontSize',17)
leg1 = legend("0.5 Km","3 Km","5.5 Km","8.5 Km","10.5 Km","11.5 Km","$V_{D_{min}}$","$V_{crit}$","$V_{stall}$",'Interpreter','latex','Location','northwest','FontSize',16); 
title(leg1,'Legend')
ax = gca;
ax.TickDir = 'out';
grid on
ax.TickLength = [0.005 0.005];
ylim([0 6.5e5])
xlim([0 340])
xticks(25:25:330)
set(gcf, 'Position', get(0,'ScreenSize'));
% matlab2tikz('06WTO.tex'); 
%% Alt 1
hold on
title("Drag Polar at 0.5 Km for Various $W_{TO}$","Interpreter","latex",'FontSize',20)
hold on
% Curves
plot(V(78:280),D_1_9(78:280),'Color','magenta','LineWidth',1.2)
plot(V(71:280),D_1_8(71:280),'Color','blue','LineWidth',1.2)
plot(V(60:280),D_1_6(60:280),'Color',"#D65316",'LineWidth',1.2)
% V_D_min for legend
plot([V(index_1_9_n) V(index_1_9_n)],[0 D_min_1_9_n],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit for legend
plot([Mcrit_1 Mcrit_1],[0 D_1_9(278)],'-.','Color',"#006666",'LineWidth',1.3)
% V_stall for legend
plot([V_stall_1_9 V_stall_1_9],[0 D_1_9(79)],'-.','Color',"#6600cc",'LineWidth',1.1)
% V_stall lines
plot([V_stall_1_8 V_stall_1_8],[0 D_1_8(72)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_1_6 V_stall_1_6],[0 D_1_6(60)],'-.','Color',"#6600cc",'LineWidth',1.1)
% V_D_min line
plot([V(index_1_8_n) V(index_1_8_n)],[0 D_min_1_8_n],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_1_6_n) V(index_1_6_n)],[0 D_min_1_6_n],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit line
plot([Mcrit_1 Mcrit_1],[0 D_1_8(278)],'-.','Color',"#006666",'LineWidth',1.3)
plot([Mcrit_1 Mcrit_1],[0 D_1_6(276)],'-.','Color',"#006666",'LineWidth',1.3)
hold off
grid on
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',17)
ylabel("Drag (N)",'Interpreter','latex','FontSize',17)
leg1 = legend("0.9 $W_{TO}$","0.8 $W_{TO}$","0.6 $W_{TO}$","$V_{D_{min}}$","$V_{crit}$","$V_{stall}$",'Interpreter','latex','Location','northwest','FontSize',16); 
title(leg1,'Legend')
ax = gca;
ax.TickDir = 'out';
grid on
ax.TickLength = [0.005 0.005];
xlim([0 340])
ylim([0 6.5e5])
xticks(25:25:330)
set(gcf, 'Position', get(0,'ScreenSize'));
% matlab2tikz('Alt1.tex'); 
%% Alt 2
hold on
title("Drag Polar at 3 Km for Various $W_{TO}$","Interpreter","latex",'FontSize',20)
hold on
% Curves
plot(V(88:272),D_2_9(88:272),'Color','magenta','LineWidth',1.2)
plot(V(85:272),D_2_8(85:272),'Color','blue','LineWidth',1.2)
plot(V(70:272),D_2_6(70:272),'Color',"#D65316",'LineWidth',1.2)
% V_D_min for legend
plot([V(index_2_9_n) V(index_2_9_n)],[0 D_min_2_9_n],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit for legend
plot([Mcrit_2 Mcrit_2],[0 D_2_9(270)],'-.','Color',"#006666",'LineWidth',1.3)
%V_stall for legend
plot([V_stall_2_9 V_stall_2_9],[0 D_2_9(92)],'-.','Color',"#6600cc",'LineWidth',1.1)
% V_stall lines
plot([V_stall_2_8 V_stall_2_8],[0 D_2_8(86)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_2_6 V_stall_2_6],[0 D_2_6(71)],'-.','Color',"#6600cc",'LineWidth',1.1)
% V_D_min line
plot([V(index_2_8_n) V(index_2_8_n)],[0 D_min_2_8_n],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_2_6_n) V(index_2_6_n)],[0 D_min_2_6_n],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit line
plot([Mcrit_2 Mcrit_2],[0 D_2_8(270)],'-.','Color',"#006666",'LineWidth',1.3)
plot([Mcrit_2 Mcrit_2],[0 D_2_6(270)],'-.','Color',"#006666",'LineWidth',1.3)
hold off
grid on
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',17)
ylabel("Drag (N)",'Interpreter','latex','FontSize',17)
leg1 = legend("0.9 $W_{TO}$","0.8 $W_{TO}$","0.6 $W_{TO}$","$V_{D_{min}}$","$V_{crit}$","$V_{stall}$",'Interpreter','latex','Location','northwest','FontSize',16); 
title(leg1,'Legend')
ax = gca;
ax.TickDir = 'out';
grid on
ax.TickLength = [0.005 0.005];
grid on
xlim([0 330])
ylim([0 7e5])
xticks(25:25:330)
set(gcf, 'Position', get(0,'ScreenSize'));
% matlab2tikz('Alt2.tex');
%% Alt 3
hold on
title("Drag Polar at 5.5 Km for Various $W_{TO}$","Interpreter","latex",'FontSize',20)
hold on
% Curves
plot(V(108:265),D_3_9(108:265),'Color','magenta','LineWidth',1.2)
plot(V(100:265),D_3_8(100:265),'Color','blue','LineWidth',1.2)
plot(V(83:265),D_3_6(83:265),'Color',"#D65316",'LineWidth',1.2)
% V_D_min for legend
plot([V(index_3_9_n) V(index_3_9_n)],[0 D_min_3_9_n],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit for legend
plot([Mcrit_3 Mcrit_3],[0 D_3_9(261)],'-.','Color',"#006666",'LineWidth',1.3)
% V_stall for legend
plot([V_stall_3_9 V_stall_3_9],[0 D_3_9(109)],'-.','Color',"#6600cc",'LineWidth',1.1)
% V_stall lines
plot([V_stall_3_8 V_stall_3_8],[0 D_3_8(101)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_3_6 V_stall_3_6],[0 D_3_6(84)],'-.','Color',"#6600cc",'LineWidth',1.1)
% V_D_min line
plot([V(index_3_8_n) V(index_3_8_n)],[0 D_min_3_8_n],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_3_6_n) V(index_3_6_n)],[0 D_min_3_6_n],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit line
plot([Mcrit_3 Mcrit_3],[0 D_3_8(100)],'-.','Color',"#006666",'LineWidth',1.3)
plot([Mcrit_3 Mcrit_3],[0 D_3_6(261)],'-.','Color',"#006666",'LineWidth',1.3)
hold off
grid on
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',17)
ylabel("Drag (N)",'Interpreter','latex','FontSize',17)
leg1 = legend("0.9 $W_{TO}$","0.8 $W_{TO}$","0.6 $W_{TO}$","$V_{D_{min}}$","$V_{crit}$","$V_{stall}$",'Interpreter','latex','Location','northwest','FontSize',16); 
title(leg1,'Legend')
ax = gca;
ax.TickDir = 'out';
grid on
ax.TickLength = [0.005 0.005];
xlim([0 320])
ylim([0 6.5e5])
xticks(25:25:330)
set(gcf, 'Position', get(0,'ScreenSize'));
% matlab2tikz('Alt3.tex');
%% Alt 4
hold on
title("Drag Polar at 8.5 Km for Various $W_{TO}$","Interpreter","latex",'FontSize',20)
hold on
% Curves
plot(V(133:253),D_4_9(133:253),'Color','magenta','LineWidth',1.2)
plot(V(123:253),D_4_8(123:253),'Color','blue','LineWidth',1.2)
plot(V(103:253),D_4_6(103:253),'Color',	"#D65416",'LineWidth',1.2)
% V_D_min for legend
plot([V(index_4_9_n) V(index_4_9_n)],[0 D_min_4_9_n],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit for legend
plot([Mcrit_4 Mcrit_4],[0 D_4_9(250)],'-.','Color',"#006666",'LineWidth',1.4)
% V_stall for legend
plot([V_stall_4_9 V_stall_4_9],[0 D_4_9(134)],'-.','Color',"#6600cc",'LineWidth',1.1)
% V_stall lines
plot([V_stall_4_8 V_stall_4_8],[0 D_4_8(124)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_4_6 V_stall_4_6],[0 D_4_6(105)],'-.','Color',"#6600cc",'LineWidth',1.1)
% V_D_min line
plot([V(index_4_8_n) V(index_4_8_n)],[0 D_min_4_8_n],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_4_6_n) V(index_4_6_n)],[0 D_min_4_6_n],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit line
plot([Mcrit_4 Mcrit_4],[0 D_4_8(250)],'-.','Color',"#006666",'LineWidth',1.4)
plot([Mcrit_4 Mcrit_4],[0 D_4_6(250)],'-.','Color',"#006666",'LineWidth',1.4)
hold off
grid on
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',17)
ylabel("Drag (N)",'Interpreter','latex','FontSize',17)
leg1 = legend("0.9 $W_{TO}$","0.8 $W_{TO}$","0.6 $W_{TO}$","$V_{D_{min}}$","$V_{crit}$","$V_{stall}$",'Interpreter','latex','Location','northwest','FontSize',16); 
title(leg1,'Legend')
xlim([0 300])
ylim([0 6e5])
xticks(25:25:330)
set(gcf, 'Position', get(0,'ScreenSize'));
% matlab2tikz('Alt4.tex');
%% Alt 5
hold on
title("Drag Polar at 10.5 Km for Various $W_{TO}$","Interpreter","latex",'FontSize',20)
hold on
% Curves
plot(V(153:245),D_5_9(153:245),'Color','magenta','LineWidth',1.2)
plot(V(142:245),D_5_8(142:245),'Color','blue','LineWidth',1.2)
plot(V(120:245),D_5_6(120:245),'Color',"#D65516",'LineWidth',1.2)
% V_D_min for legend
plot([V(index_5_9_n) V(index_5_9_n)],[0 D_min_5_9_n],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit for legend
plot([Mcrit_5 Mcrit_5],[0 D_5_9(242)],'-.','Color',"#006666",'LineWidth',1.4)
% V_stall for legend
plot([V_stall_5_9 V_stall_5_9],[0 D_5_9(154)],'-.','Color',"#6600cc",'LineWidth',1.1)
% V_stall lines
plot([V_stall_5_8 V_stall_5_8],[0 D_5_8(144)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_5_6 V_stall_5_6],[0 D_5_6(121)],'-.','Color',"#6600cc",'LineWidth',1.1)
% V_D_min line
plot([V(index_5_8_n) V(index_5_8_n)],[0 D_min_5_8_n],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_5_6_n) V(index_5_6_n)],[0 D_min_5_6_n],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit line
plot([Mcrit_5 Mcrit_5],[0 D_5_8(242)],'-.','Color',"#006666",'LineWidth',1.4)
plot([Mcrit_5 Mcrit_5],[0 D_5_6(121)],'-.','Color',"#006666",'LineWidth',1.4)
hold off
grid on
h=gca;
h.XAxis.TickLength = [0 0];
h.YAxis.TickLength = [0 0];
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',17)
ylabel("Drag (N)",'Interpreter','latex','FontSize',17)
leg1 = legend("0.9 $W_{TO}$","0.8 $W_{TO}$","0.6 $W_{TO}$","$V_{D_{min}}$","$V_{crit}$","$V_{stall}$",'Interpreter','latex','Location','northwest','FontSize',16); 
title(leg1,'Legend')
ax = gca;
ax.TickDir = 'out';
grid on
ax.TickLength = [0.005 0.005];
xlim([0 290])
ylim([0 6e5])
xticks(25:25:330)
set(gcf, 'Position', get(0,'ScreenSize'));
% matlab2tikz('Alt5.tex');
%% Alt 6
hold on
title("Drag Polar at 11.5 Km for Various $W_{TO}$","Interpreter","latex",'FontSize',20)
% Curves
plot(V(158:243),D_6_9(158:243),'Color','magenta','LineWidth',1.2)
plot(V(148:243),D_6_8(148:243),'Color','blue','LineWidth',1.2)
plot(V(123:243),D_6_6(123:243),'Color',	"#D66616",'LineWidth',1.2)
% V_D_min for legend
plot([V(index_6_9_n) V(index_6_9_n)],[0 D_min_6_9_n],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit for legend
plot([Mcrit_6 Mcrit_6],[0 D_6_9(240)],'-.','Color',"#006666",'LineWidth',1.4)
% V_stall for legend
plot([V_stall_6_9 V_stall_6_9],[0 D_6_9(160)],'-.','Color',"#6600cc",'LineWidth',1.1)
% V_stall lines
plot([V_stall_6_8 V_stall_6_8],[0 D_6_8(149)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_6_6 V_stall_6_6],[0 D_6_6(126)],'-.','Color',"#6600cc",'LineWidth',1.1)
% V_D_min line
plot([V(index_6_8_n) V(index_6_8_n)],[0 D_min_6_8_n],'-.','Color',"#A2142F",'LineWidth',1.1)
plot([V(index_6_6_n) V(index_6_6_n)],[0 D_min_6_6_n],'-.','Color',"#A2142F",'LineWidth',1.1)
% M_crit line
plot([Mcrit_6 Mcrit_6],[0 D_6_8(240)],'-.','Color',"#006666",'LineWidth',1.4)
plot([Mcrit_6 Mcrit_6],[0 D_6_6(240)],'-.','Color',"#006666",'LineWidth',1.4)
hold off
grid on
h=gca;
h.XAxis.TickLength = [0 0];
h.YAxis.TickLength = [0 0];
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',17)
ylabel("Drag (N)",'Interpreter','latex','FontSize',17)
leg1 = legend("0.9 $W_{TO}$","0.8 $W_{TO}$","0.6 $W_{TO}$","$V_{D_{min}}$","$V_{crit}$","$V_{stall}$",'Interpreter','latex','Location','northwest','FontSize',16); 
title(leg1,'Legend')
ax = gca;
ax.TickDir = 'out';
grid on
ax.TickLength = [0.005 0.005];
xlim([0 300])
ylim([0 6e5])
xticks(25:25:330)
set(gcf, 'Position', get(0,'ScreenSize'));
% matlab2tikz('Alt6.tex');
%% PLOT 2 - h-V CALCULATION
Tasl = 350*4;
v_q = sqrt((2*q_max)./rho);
%% 0.9 WTO and 100% Throttle
% Calculations
sigma_9_100 = (2*(k*CDo)^0.5)/(Tasl/(0.9*wto));
rho_9_a = sigma_9_100*Rho_SL;
A = CDo.*rho.*S.*0.5;
B = (2*k*((0.9*wto*1000)^2))./(rho.*S);
h_abs_9 = height(1388);
sigma = rho./Rho_SL;
v = [];
for i=1:1388
    v1 = sqrt(((Tasl*1000*sigma(i))+sqrt(((Tasl*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v1];
end
for i=1:1388
    v2 = sqrt(((Tasl*1000*sigma(i))-sqrt(((Tasl*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v2];
end

% Boundaries
v_stall_9 = ((2*0.9*wto*1000)./(rho(1:1190).*S.*CLmax)).^0.5;
v_crit_9 = 0.895*a(1:1320);

% Plot
hold on
title("\textbf{V-h Plot for 0.9 $W_{TO}$ and 100 \% Throttle}","Interpreter","latex",'FontSize',30)
plot(v(1:1388),height(1:1388),'Color','magenta','LineWidth',1.2)
plot(v(1389:2776),height(1:1388),'Color','magenta','LineWidth',1.2)
plot(v_stall_9,height(1:1190),'Color','blue','LineWidth',1.5)
plot(v_crit_9,height(1:1320),'Color','red','LineWidth',1.5)
plot(v_q(1:885),height(1:885),'Color','green','LineWidth',1.3)
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',25)
ylabel("Altitude (m)",'Interpreter','latex','FontSize',25)
plot([0 350],[h_abs_9 h_abs_9],'--','Color',"#FFA500",'LineWidth',1.1)
ylim([0 16000])
xlim([0 500])
% Text
text(115,4000,'Stall Boundary','Interpreter','latex','FontSize',20,'Rotation',65)
text(350,3800,'Aeroelastic Boundary ($q_{max}$)','Interpreter','latex','FontSize',20,'Rotation',38)
text(180,6200,'Flight Envelope','Interpreter','latex','FontSize',30,'Rotation',0)
text(280,8000,'Critical Velocity Boundary','Interpreter','latex','FontSize',20,'Rotation',-75)
text(100,h_abs_9+200,'Absolute Ceiling = 13870 m','Interpreter','latex','FontSize',20,'Rotation',0)
hold off
xticks(50:50:500)
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\2','09WTO.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('09WTO.tex'); 
%% 0.8 WTO and 100% Throttle
% Calculations
sigma_8_100 = (2*(k*CDo)^0.5)/(Tasl/(0.8*wto));
rho_8_a = sigma_8_100*Rho_SL;
A = CDo.*rho.*S.*0.5;
B = (2*k*((0.8*wto*1000)^2))./(rho.*S);
sigma = rho./Rho_SL;
h_abs_8 = height(1463);
v = [];
for i=1:1470
    v1 = sqrt(((Tasl*1000*sigma(i))+sqrt(((Tasl*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v1];
end
for i=1:1470
    v2 = sqrt(((Tasl*1000*sigma(i))-sqrt(((Tasl*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v2];
end

% Boundaries
v_stall_8 = ((2*0.8*wto*1000)./(rho(1:1270).*S.*CLmax)).^0.5;
v_crit_8 = 0.895*a(1:1400);

% Plot
hold on
title("\textbf{V-h Plot for 0.8 $W_{TO}$ and 100 \% Throttle}","Interpreter","latex",'FontSize',30)
plot(v(1:1470),height(1:1470),'Color','magenta','LineWidth',1.2)
plot(v(1471:2940),height(1:1470),'Color','magenta','LineWidth',1.2)
plot(v_stall_8,height(1:1270),'Color','blue','LineWidth',1.5)
plot(v_crit_8,height(1:1400),'Color','red','LineWidth',1.5)
plot(v_q(1:895),height(1:895),'Color','green','LineWidth',1.3)
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',25)
ylabel("Altitude (m)",'Interpreter','latex','FontSize',25)
plot([0 350],[h_abs_8 h_abs_8],'--','Color',"#FFA500",'LineWidth',1.1)
ylim([0 16000])
xlim([0 500])
% Text
text(110,4000,'Stall Boundary','Interpreter','latex','FontSize',20,'Rotation',67)
text(350,3700,'Aeroelastic Boundary ($q_{max}$)','Interpreter','latex','FontSize',20,'Rotation',40)
text(175,6200,'Flight Envelope','Interpreter','latex','FontSize',30,'Rotation',0)
text(280,8000,'Critical Velocity Boundary','Interpreter','latex','FontSize',20,'Rotation',-75)
text(100,h_abs_8+200,'Absolute Ceiling = 14620 m','Interpreter','latex','FontSize',20,'Rotation',0)
hold off
xticks(50:50:500)
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\2','08WTO.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('08WTO.tex'); 
%% 0.6 WTO and 100% Throttle
% Calculations
sigma_6_100 = (2*(k*CDo)^0.5)/(Tasl/(0.6*wto));
rho_6_a = sigma_6_100*Rho_SL;
A = CDo.*rho.*S.*0.5;
B = (2*k*((0.6*wto*1000)^2))./(rho.*S);
h_abs_6 = 16440;
sigma = rho./Rho_SL;
v = [];
for i=1:1650
    v1 = sqrt(((Tasl*1000*sigma(i))+sqrt(((Tasl*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v1];
end
for i=1:1650
    v2 = sqrt(((Tasl*1000*sigma(i))-sqrt(((Tasl*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v2];
end

% Boundaries
v_stall_8 = ((2*0.8*wto*1000)./(rho(1:1550).*S.*CLmax)).^0.5;
v_crit_8 = 0.895*a(1:1580);

% Plot
hold on
title("\textbf{V-h Plot for 0.6 $W_{TO}$ and 100 \% Throttle}","Interpreter","latex",'FontSize',30)
plot(v(1:1650),height(1:1650),'Color','magenta','LineWidth',1.2)
plot(v(1651:3300),height(1:1650),'Color','magenta','LineWidth',1.2)
plot(v_stall_8,height(1:1550),'Color','blue','LineWidth',1.5)
plot(v_crit_8,height(1:1580),'Color','red','LineWidth',1.5)
plot(v_q(1:910),height(1:910),'Color','green','LineWidth',1.3)
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',25)
ylabel("Altitude (m)",'Interpreter','latex','FontSize',25)
plot([0 350],[h_abs_6 h_abs_6],'--','Color',"#FFA500",'LineWidth',1.1)
ylim([0 18000])
xlim([0 500])
% Text
text(110,4000,'Stall Boundary','Interpreter','latex','FontSize',20,'Rotation',65)
text(350,3800,'Aeroelastic Boundary ($q_{max}$)','Interpreter','latex','FontSize',20,'Rotation',35)
text(175,6200,'Flight Envelope','Interpreter','latex','FontSize',30,'Rotation',0)
text(275,9500,'Critical Velocity Boundary','Interpreter','latex','FontSize',20,'Rotation',-75)
text(100,h_abs_6+200,'Absolute Ceiling = 16440 m','Interpreter','latex','FontSize',20,'Rotation',0)
hold off
xticks(50:50:500)
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\2','06WTO.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('06WTO.tex'); 
%% 0.9 WTO and 95% Throttle
sigma_9_95 = (2*(k*CDo)^0.5)/(Tasl*0.95/(0.9*wto));
rho_9_a_1 = sigma_9_95*Rho_SL;
A = CDo.*rho.*S.*0.5;
B = (2*k*((0.9*wto*1000)^2))./(rho.*S);
h_abs_9_1 = 13540;
sigma = rho./Rho_SL;
v = [];
for i=1:1360
    v1 = sqrt(((Tasl*0.95*1000*sigma(i))+sqrt(((Tasl*0.95*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v1];
end
for i=1:1360
    v2 = sqrt(((Tasl*0.95*1000*sigma(i))-sqrt(((Tasl*0.95*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v2];
end

% Boundaries
v_stall_9 = ((2*0.9*wto*1000)./(rho(1:1150).*S.*CLmax)).^0.5;
v_crit_9 = 0.895*a(1:1300);

% Plot
hold on
title("\textbf{V-h Plot for 0.9 $W_{TO}$ and 95 \% Throttle}","Interpreter","latex",'FontSize',30)
plot(v(1:1360),height(1:1360),'Color','magenta','LineWidth',1.2)
plot(v(1361:2720),height(1:1360),'Color','magenta','LineWidth',1.2)
plot(v_stall_9,height(1:1150),'Color','blue','LineWidth',1.5)
plot(v_crit_9,height(1:1300),'Color','red','LineWidth',1.5)
plot(v_q(1:840),height(1:840),'Color','green','LineWidth',1.3)
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',25)
ylabel("Altitude (m)",'Interpreter','latex','FontSize',25)
plot([0 350],[h_abs_9_1 h_abs_9_1],'--','Color',"#FFA500",'LineWidth',1.1)
ylim([0 16000])
xlim([0 500])
% Text
text(118,4000,'Stall Boundary','Interpreter','latex','FontSize',20,'Rotation',67)
text(350,3720,'Aeroelastic Boundary ($q_{max}$)','Interpreter','latex','FontSize',20,'Rotation',40)
text(175,6200,'Flight Envelope','Interpreter','latex','FontSize',30,'Rotation',0)
text(280,8000,'Critical Velocity Boundary','Interpreter','latex','FontSize',15,'Rotation',-77)
text(100,h_abs_9_1+200,'Absolute Ceiling = 13540 m','Interpreter','latex','FontSize',20,'Rotation',0)
hold off
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\2','T1.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('T1.tex'); 
%% 0.9 WTO and 82.5% Throttle
sigma_9_82 = (2*(k*CDo)^0.5)/(Tasl*0.825/(0.9*wto));
rho_9_a_2 = sigma_9_82*Rho_SL;
A = CDo.*rho.*S.*0.5;
B = (2*k*((0.9*wto*1000)^2))./(rho.*S);
h_abs_9_2 = 12650;
sigma = rho./Rho_SL;
v = [];
for i=1:1270
    v1 = sqrt(((Tasl*0.825*1000*sigma(i))+sqrt(((Tasl*0.825*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v1];
end
for i=1:1270
    v2 = sqrt(((Tasl*0.825*1000*sigma(i))-sqrt(((Tasl*0.825*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v2];
end

% Boundaries
v_stall_9 = ((2*0.9*wto*1000)./(rho(1:1060).*S.*CLmax)).^0.5;
v_crit_9 = 0.895*a(1:1230);

% Plot
hold on
title("\textbf{V-h Plot for 0.9 $W_{TO}$ and 82.5 \% Throttle}","Interpreter","latex",'FontSize',30)
plot(v(1:1270),height(1:1270),'Color','magenta','LineWidth',1.2)
plot(v(1271:2540),height(1:1270),'Color','magenta','LineWidth',1.2)
plot(v_stall_9,height(1:1060),'Color','blue','LineWidth',1.5)
plot(v_crit_9,height(1:1230),'Color','red','LineWidth',1.5)
plot(v_q(1:720),height(1:720),'Color','green','LineWidth',1.3)
plot([0 325],[h_abs_9_2 h_abs_9_2],'--','Color',"#FFA500",'LineWidth',1.1)
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',25)
ylabel("Altitude (m)",'Interpreter','latex','FontSize',25)
ylim([0 14000])
xlim([0 500])
% Text
text(117,4000,'Stall Boundary','Interpreter','latex','FontSize',20,'Rotation',69)
text(330,2500,'Aeroelastic Boundary ($q_{max}$)','Interpreter','latex','FontSize',20,'Rotation',47)
text(175,5000,'Flight Envelope','Interpreter','latex','FontSize',30,'Rotation',0)
text(280,8000,'Critical Velocity Boundary','Interpreter','latex','FontSize',20,'Rotation',-78)
text(100,h_abs_9_2+200,'Absolute Ceiling = 12650 m','Interpreter','latex','FontSize',20,'Rotation',0)
hold off
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\2','T2.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('T2.tex'); 
%% 0.9 WTO and 70% Throttle
% Calculations
sigma_9_7 = (2*(k*CDo)^0.5)/(Tasl*0.7/(0.9*wto));
rho_9_a_3 = sigma_9_7*Rho_SL;
A = CDo.*rho.*S.*0.5;
B = (2*k*((0.9*wto*1000)^2))./(rho.*S);
h_abs_9_3 = 11610;
sigma = rho./Rho_SL;
v = [];
for i=1:1165
    v1 = sqrt(((Tasl*0.7*1000*sigma(i))+sqrt(((Tasl*0.7*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v1];
end
for i=1:1165
    v2 = sqrt(((Tasl*0.7*1000*sigma(i))-sqrt(((Tasl*0.7*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v2];
end

% Boundaries
v_stall_9 = ((2*0.9*wto*1000)./(rho(1:925).*S.*CLmax)).^0.5;
v_crit_9 = 0.895*a(1:1150);

% Plot
hold on
title("\textbf{V-h Plot for 0.9 $W_{TO}$ and 70 \% Throttle}","Interpreter","latex",'FontSize',30)
plot(v(1:1165),height(1:1165),'Color','magenta','LineWidth',1.2)
plot(v(1166:2330),height(1:1165),'Color','magenta','LineWidth',1.2)
plot(v_stall_9,height(1:925),'Color','blue','LineWidth',1.5)
plot(v_crit_9,height(1:1150),'Color','red','LineWidth',1.5)
plot(v_q(1:575),height(1:575),'Color','green','LineWidth',1.3)
plot([0 300],[h_abs_9_3 h_abs_9_3],'--','Color',"#FFA500",'LineWidth',1.1)
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',25)
ylabel("Altitude (m)",'Interpreter','latex','FontSize',25)
ylim([0 13000])
xlim([0 500])
% Text
text(112,3300,'Stall Boundary','Interpreter','latex','FontSize',20,'Rotation',70)
text(315,1600,'Aeroelastic Boundary ($q_{max}$)','Interpreter','latex','FontSize',20,'Rotation',50)
text(180,6200,'Flight Envelope','Interpreter','latex','FontSize',30,'Rotation',0)
text(284,7000,'Critical Velocity Boundary','Interpreter','latex','FontSize',20,'Rotation',-79)
text(100,h_abs_9_3+200,'Absolute Ceiling = 11610 m','Interpreter','latex','FontSize',20,'Rotation',0)
hold off
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\2','T3.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('T3.tex'); 
%% Combined V-h Plot
% 0.9 WTO and 100% Throttle
% Calculations
sigma_9_100 = (2*(k*CDo)^0.5)/(Tasl/(0.9*wto));
rho_9_a = sigma_9_100*Rho_SL;
A = CDo.*rho.*S.*0.5;
B = (2*k*((0.9*wto*1000)^2))./(rho.*S);
h_abs_9 = height(1388);
sigma = rho./Rho_SL;
v = [];
for i=1:1388
    v1 = sqrt(((Tasl*1000*sigma(i))+sqrt(((Tasl*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v1];
end
for i=1:1388
    v2 = sqrt(((Tasl*1000*sigma(i))-sqrt(((Tasl*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v2];
end

% Boundaries
v_stall_9 = ((2*0.9*wto*1000)./(rho(1:1190).*S.*CLmax)).^0.5;
v_crit_9 = 0.895*a(1:1320);

% Plot
hold on
plot(v(1:1388),height(1:1388),'Color','magenta','LineWidth',1.2)
plot(v(1389:2776),height(1:1388),'Color','magenta','LineWidth',1.2)
plot(v_stall_9,height(1:1190),'Color','blue','LineWidth',1.5)
plot(v_crit_9,height(1:1320),'Color','red','LineWidth',1.5)
plot(v_q(1:885),height(1:885),'Color','green','LineWidth',1.3)
plot([0 350],[h_abs_9 h_abs_9],'--','Color',"black",'LineWidth',1.1)

% Text
text(100,h_abs_9+200,'Absolute Ceiling = 13870 m','Interpreter','latex','FontSize',20,'Rotation',0)

% 0.9 WTO and 95% Throttle
sigma_9_95 = (2*(k*CDo)^0.5)/(Tasl*0.95/(0.9*wto));
rho_9_a_1 = sigma_9_95*Rho_SL;
A = CDo.*rho.*S.*0.5;
B = (2*k*((0.9*wto*1000)^2))./(rho.*S);
h_abs_9_1 = 13540;
sigma = rho./Rho_SL;
v = [];
for i=1:1360
    v1 = sqrt(((Tasl*0.95*1000*sigma(i))+sqrt(((Tasl*0.95*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v1];
end
for i=1:1360
    v2 = sqrt(((Tasl*0.95*1000*sigma(i))-sqrt(((Tasl*0.95*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v2];
end

% Boundaries
v_stall_9 = ((2*0.9*wto*1000)./(rho(1:1150).*S.*CLmax)).^0.5;
v_crit_9 = 0.895*a(1:1300);

% Plot

plot(v(1:1360),height(1:1360),'Color','cyan','LineWidth',1.2)
plot(v(1361:2720),height(1:1360),'Color','cyan','LineWidth',1.2)
plot(v_stall_9,height(1:1150),'Color','blue','LineWidth',1.5)
plot(v_crit_9,height(1:1300),'Color','red','LineWidth',1.5)
plot(v_q(1:840),height(1:840),'Color','green','LineWidth',1.3)
plot([0 350],[h_abs_9_1 h_abs_9_1],'--','Color',"black",'LineWidth',1.1)
% Text
text(100,h_abs_9_1-200,'Absolute Ceiling = 13540 m','Interpreter','latex','FontSize',20,'Rotation',0)

% 0.9 WTO and 82.5% Throttle
sigma_9_82 = (2*(k*CDo)^0.5)/(Tasl*0.825/(0.9*wto));
rho_9_a_2 = sigma_9_82*Rho_SL;
A = CDo.*rho.*S.*0.5;
B = (2*k*((0.9*wto*1000)^2))./(rho.*S);
h_abs_9_2 = 12650;
sigma = rho./Rho_SL;
v = [];
for i=1:1270
    v1 = sqrt(((Tasl*0.825*1000*sigma(i))+sqrt(((Tasl*0.825*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v1];
end
for i=1:1270
    v2 = sqrt(((Tasl*0.825*1000*sigma(i))-sqrt(((Tasl*0.825*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v2];
end

% Boundaries
v_stall_9 = ((2*0.9*wto*1000)./(rho(1:1060).*S.*CLmax)).^0.5;
v_crit_9 = 0.895*a(1:1230);

% Plot

plot(v(1:1270),height(1:1270),'Color','#808000','LineWidth',1.2)
plot(v(1271:2540),height(1:1270),'Color','#808000','LineWidth',1.2)
plot(v_stall_9,height(1:1060),'Color','blue','LineWidth',1.5)
plot(v_crit_9,height(1:1230),'Color','red','LineWidth',1.5)
plot(v_q(1:720),height(1:720),'Color','green','LineWidth',1.3)
plot([0 325],[h_abs_9_2 h_abs_9_2],'--','Color',"black",'LineWidth',1.1)

% Text
text(100,h_abs_9_2-200,'Absolute Ceiling = 12650 m','Interpreter','latex','FontSize',20,'Rotation',0)

% 0.9 WTO and 70% Throttle
% Calculations
sigma_9_7 = (2*(k*CDo)^0.5)/(Tasl*0.7/(0.9*wto));
rho_9_a_3 = sigma_9_7*Rho_SL;
A = CDo.*rho.*S.*0.5;
B = (2*k*((0.9*wto*1000)^2))./(rho.*S);
h_abs_9_3 = 11610;
sigma = rho./Rho_SL;
v = [];
for i=1:1165
    v1 = sqrt(((Tasl*0.7*1000*sigma(i))+sqrt(((Tasl*0.7*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v1];
end
for i=1:1165
    v2 = sqrt(((Tasl*0.7*1000*sigma(i))-sqrt(((Tasl*0.7*1000*sigma(i))^2)-(4*A(i)*B(i))))/(2*A(i)));
    v = [v v2];
end

% Boundaries
v_stall_9 = ((2*0.9*wto*1000)./(rho(1:925).*S.*CLmax)).^0.5;
v_crit_9 = 0.895*a(1:1150);

% Plot

title("\textbf{Combined V-h Plot for 0.9 $W_{TO}$ and Various Throttle Settings}","Interpreter","latex",'FontSize',30)
plot(v(1:1165),height(1:1165),'Color','#FFA500','LineWidth',1.2)
plot(v(1166:2330),height(1:1165),'Color','#FFA500','LineWidth',1.2)
plot(v_stall_9,height(1:925),'Color','blue','LineWidth',1.5)
plot(v_crit_9,height(1:1150),'Color','red','LineWidth',1.5)
plot(v_q(1:575),height(1:575),'Color','green','LineWidth',1.3)
plot([0 300],[h_abs_9_3 h_abs_9_3],'--','Color',"black",'LineWidth',1.1)
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',25)
ylabel("Altitude (m)",'Interpreter','latex','FontSize',25)

% Text
text(112,3300,'Stall Boundary','Interpreter','latex','FontSize',20,'Rotation',70)
text(315,1600,'Aeroelastic Boundary ($q_{max}$)','Interpreter','latex','FontSize',20,'Rotation',47)
text(180,6200,'Flight Envelope','Interpreter','latex','FontSize',30,'Rotation',0)
text(284,7000,'Critical Velocity Boundary','Interpreter','latex','FontSize',20,'Rotation',-79)
text(75,h_abs_9_3+200,'Absolute Ceiling = 11610 m','Interpreter','latex','FontSize',20,'Rotation',0)
hold off
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on
ylim([0 15000])
xticks(25:25:500)
yticks(0:1000:15000)
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\2','T.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('T.tex'); 
%% PLOT 3
%% INITIALISATION
%% V_stall Calculation
% 0.9 WTO
V_stall_1_9_t = ((2*0.9*WTO)/(rho_1*S*0.9*CLmax_HLD_part))^0.5;
V_stall_2_9_t = ((2*0.9*WTO)/(rho_2*S*0.9*CLmax_HLD_part))^0.5;
V_stall_3_9_t = ((2*0.9*WTO)/(rho_3*S*0.9*CLmax_HLD_part))^0.5;
V_stall_4_9_t = ((2*0.9*WTO)/(rho_4*S*0.9*CLmax_HLD_part))^0.5;
V_stall_5_9_t = ((2*0.9*WTO)/(rho_5*S*0.9*CLmax_HLD_part))^0.5;
V_stall_6_9_t = ((2*0.9*WTO)/(rho_6*S*0.9*CLmax_HLD_part))^0.5;
% 0.8 WTO
V_stall_1_8_t = ((2*0.8*WTO)/(rho_1*S*0.9*CLmax_HLD_part))^0.5;
V_stall_2_8_t = ((2*0.8*WTO)/(rho_2*S*0.9*CLmax_HLD_part))^0.5;
V_stall_3_8_t = ((2*0.8*WTO)/(rho_3*S*0.9*CLmax_HLD_part))^0.5;
V_stall_4_8_t = ((2*0.8*WTO)/(rho_4*S*0.9*CLmax_HLD_part))^0.5;
V_stall_5_8_t = ((2*0.8*WTO)/(rho_5*S*0.9*CLmax_HLD_part))^0.5;
V_stall_6_8_t = ((2*0.8*WTO)/(rho_6*S*0.9*CLmax_HLD_part))^0.5;
%% THRUST DATA
t_1 = sigma_1*4*350*1000;
t_2 = sigma_1*4*350*1000;
t_3 = sigma_1*4*350*1000;
t_4 = sigma_1*4*350*1000;
t_5 = sigma_1*4*350*1000;
t_6 = sigma_1*4*350*1000;
t_sl = 4*350*1000;
%% Calculations
% Sea Level and 0.9 WTO
P_avb_0_9 = t_sl.*V;
P_reqd_0_9 = D_0_9.*V;
Delta_P_0_9 = P_avb_0_9 - P_reqd_0_9;
ROC_0_9 = Delta_P_0_9./(0.9*WTO);

% Sea Level and 0.8 WTO
P_avb_0_8 = t_sl.*V;
P_reqd_0_8 = D_0_8.*V;
Delta_P_0_8 = P_avb_0_8 - P_reqd_0_8;
ROC_0_8 = Delta_P_0_8./(0.8*WTO);

% Alt 1 and 0.9 WTO
P_avb_1_9 = t_1.*V;
P_reqd_1_9 = D_1_9.*V;
Delta_P_1_9 = P_avb_1_9 - P_reqd_1_9;
ROC_1_9 = Delta_P_1_9./(0.9*WTO);

% Alt 1 and 0.8 WTO
P_avb_1_8 = t_1.*V;
P_reqd_1_8 = D_1_8.*V;
Delta_P_1_8 = P_avb_1_8 - P_reqd_1_8;
ROC_1_8= Delta_P_1_8./(0.8*WTO);

% Alt 2 and 0.9 WTO
P_avb_2_9 = t_2.*V;
P_reqd_2_9 = D_2_9.*V;
Delta_P_2_9 = P_avb_2_9 - P_reqd_2_9;
ROC_2_9 = Delta_P_2_9./(0.9*WTO);

% Alt 2 and 0.8 WTO
P_avb_2_8 = t_2.*V;
P_reqd_2_8 = D_2_8.*V;
Delta_P_2_8 = P_avb_2_8 - P_reqd_2_8;
ROC_2_8= Delta_P_2_8./(0.8*WTO);

% Alt 3 and 0.9 WTO
P_avb_3_9 = t_3.*V;
P_reqd_3_9 = D_3_9.*V;
Delta_P_3_9 = P_avb_3_9 - P_reqd_3_9;
ROC_3_9 = Delta_P_3_9./(0.9*WTO);

% Alt 3 and 0.8 WTO
P_avb_3_8 = t_3.*V;
P_reqd_3_8 = D_3_8.*V;
Delta_P_3_8 = P_avb_3_8 - P_reqd_3_8;
ROC_3_8= Delta_P_3_8./(0.8*WTO);

% Alt 4 and 0.9 WTO
P_avb_4_9 = t_4.*V;
P_reqd_4_9 = D_4_9.*V;
Delta_P_4_9 = P_avb_4_9 - P_reqd_4_9;
ROC_4_9 = Delta_P_4_9./(0.9*WTO);

% Alt 4 and 0.8 WTO
P_avb_4_8 = t_4.*V;
P_reqd_4_8 = D_4_8.*V;
Delta_P_4_8 = P_avb_4_8 - P_reqd_4_8;
ROC_4_8= Delta_P_4_8./(0.8*WTO);

% Alt 5 and 0.9 WTO
P_avb_5_9 = t_5.*V;
P_reqd_5_9 = D_5_9.*V;
Delta_P_5_9 = P_avb_5_9 - P_reqd_5_9;
ROC_5_9 = Delta_P_5_9./(0.9*WTO);

% Alt 5 and 0.8 WTO
P_avb_5_8 = t_5.*V;
P_reqd_5_8 = D_5_8.*V;
Delta_P_5_8 = P_avb_5_8 - P_reqd_5_8;
ROC_5_8= Delta_P_5_8./(0.8*WTO);

% Alt 6 and 0.9 WTO
P_avb_6_9 = t_6.*V;
P_reqd_6_9 = D_6_9.*V;
Delta_P_6_9 = P_avb_6_9 - P_reqd_6_9;
ROC_6_9 = Delta_P_6_9./(0.9*WTO);

% Alt 6 and 0.8 WTO
P_avb_6_8 = t_6.*V;
P_reqd_6_8 = D_6_8.*V;
Delta_P_6_8 = P_avb_6_8 - P_reqd_6_8;
ROC_6_8= Delta_P_6_8./(0.8*WTO);

%% Plotting
%% Plot 0.9 WTO and 6 Altitudes
hold on
title("\textbf{Rate of Climb Plot for 0.9 $W_{TO}$ and Various Altitudes}","Interpreter","latex",'FontSize',30)
plot(V,ROC_1_9,'Color','magenta','LineWidth',1.2)
plot(V,ROC_2_9,'Color','blue','LineWidth',1.2)
plot(V,ROC_3_9,'Color',"#D95319",'LineWidth',1.2)
plot(V,ROC_4_9,'Color',"#EDB120",'LineWidth',1.2)
plot(V,ROC_5_9,'Color','green','LineWidth',1.2)
plot(V,ROC_6_9,'Color',"#4DBEEE",'LineWidth',1.2)
% M_crit for legend
plot([Mcrit_1 Mcrit_1],[0 ROC_1_9(278)],'-.','Color',"#008888",'LineWidth',1.3)
% V_stall for legend
plot([V_stall_1_9 V_stall_1_9],[0 ROC_1_9(79)],'-.','Color',"#6600cc",'LineWidth',1.1)
% V_stall lines
plot([V_stall_2_9 V_stall_2_9],[0 ROC_2_9(92)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_3_9 V_stall_3_9],[0 ROC_3_9(109)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_4_9 V_stall_4_9],[0 ROC_4_9(134)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_5_9 V_stall_5_9],[0 ROC_5_9(154)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_6_9 V_stall_6_9],[0 ROC_6_9(160)],'-.','Color',"#6600cc",'LineWidth',1.1)
% M_crit line
plot([Mcrit_2 Mcrit_2],[0 ROC_2_9(270)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_3 Mcrit_3],[0 ROC_3_9(261)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_4 Mcrit_4],[0 ROC_4_9(249)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_5 Mcrit_5],[0 ROC_5_9(242)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_6 Mcrit_6],[0 ROC_6_9(240)],'-.','Color',"#008888",'LineWidth',1.3)
hold off
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',25)
ylabel("Rate of Climb (m/s)",'Interpreter','latex','FontSize',25)
leg1 = legend("0.5 Km","3 Km","5.5 Km","8.5 Km","10.5 Km","11.5 Km","$V_{crit}$","$V_{stall}$",'Interpreter','latex','Location','northwest','FontSize',20); 
title(leg1,'Legend')
ylim([5 50])
xlim([50 325])
xticks(45:15:325)
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on 
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\3','09WTO.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('09WTO.tex'); 
%% Plot 0.8 WTO and 6 Altitudes
hold on
title("\textbf{Rate of Climb Plot for 0.8 $W_{TO}$ and Various Altitudes}","Interpreter","latex",'FontSize',30)
plot(V,ROC_1_8,'Color','magenta','LineWidth',1.2)
plot(V,ROC_2_8,'Color','blue','LineWidth',1.2)
plot(V,ROC_3_8,'Color',"#D95319",'LineWidth',1.2)
plot(V,ROC_4_8,'Color',"#EDB120",'LineWidth',1.2)
plot(V,ROC_5_8,'Color','green','LineWidth',1.2)
plot(V,ROC_6_8,'Color',"#4DBEEE",'LineWidth',1.2)
% M_crit for legend
plot([Mcrit_1 Mcrit_1],[0 ROC_1_8(278)],'-.','Color',"#008888",'LineWidth',1.3)
% V_stall for legend
plot([V_stall_1_9 V_stall_1_9],[0 ROC_1_8(80)],'-.','Color',"#6600cc",'LineWidth',1.1)
% V_stall lines
plot([V_stall_2_9 V_stall_2_9],[0 ROC_2_8(93)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_3_9 V_stall_3_9],[0 ROC_3_8(110)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_4_9 V_stall_4_9],[0 ROC_4_8(134)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_5_9 V_stall_5_9],[0 ROC_5_8(155)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_6_9 V_stall_6_9],[0 ROC_6_8(161)],'-.','Color',"#6600cc",'LineWidth',1.1)
% M_crit line
plot([Mcrit_2 Mcrit_2],[0 ROC_2_8(270)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_3 Mcrit_3],[0 ROC_3_8(261)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_4 Mcrit_4],[0 ROC_4_8(248)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_5 Mcrit_5],[0 ROC_5_8(242)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_6 Mcrit_6],[0 ROC_6_8(240)],'-.','Color',"#008888",'LineWidth',1.3)
hold off
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',25)
ylabel("Rate of Climb (m/s)",'Interpreter','latex','FontSize',25)
leg1 = legend("0.5 Km","3 Km","5.5 Km","8.5 Km","10.5 Km","11.5 Km","$V_{crit}$","$V_{stall}$",'Interpreter','latex','Location','northwest','FontSize',20); 
title(leg1,'Legend')
ylim([15 50])
xlim([75 325])
xticks(45:15:325)
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on 
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\3','08WTO.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('08WTO.tex'); 
%% R/C Max Calculation
[ROC_max_0_9,indexr_0_9] = max(ROC_0_9);
[ROC_max_1_9,indexr_1_9] = max(ROC_1_9);
[ROC_max_2_9,indexr_2_9] = max(ROC_2_9);
[ROC_max_3_9,indexr_3_9] = max(ROC_3_9);
[ROC_max_4_9,indexr_4_9] = max(ROC_4_9);
[ROC_max_5_9,indexr_5_9] = max(ROC_5_9);
[ROC_max_6_9,indexr_6_9] = max(ROC_6_9);

[ROC_max_0_8,indexr_0_8] = max(ROC_0_8);
[ROC_max_1_8,indexr_1_8] = max(ROC_1_8);
[ROC_max_2_8,indexr_2_8] = max(ROC_2_8);
[ROC_max_3_8,indexr_3_8] = max(ROC_3_8);
[ROC_max_4_8,indexr_4_8] = max(ROC_4_8);
[ROC_max_5_8,indexr_5_8] = max(ROC_5_8);
[ROC_max_6_8,indexr_6_8] = max(ROC_6_8);

ROC_Best_9 = (ROC_max_1_9+ROC_max_6_9)/2;
ROC_Best_8 = (ROC_max_1_8+ROC_max_6_8)/2;

V_Best_9 = (V(indexr_1_9)+V(indexr_6_9))/2;
V_Best_8 = (V(indexr_1_8)+V(indexr_6_8))/2;
%% Plot for R/C MAX 0.9 WTO

hold on
title("Rate of Climb Plot $(R/C)_{max}$ for 0.9 $W_{TO}$ and Various Altitudes","Interpreter","latex",'FontSize',20)
plot(V,ROC_1_9,'Color','magenta','LineWidth',1.2)
plot(V,ROC_2_9,'Color','blue','LineWidth',1.2)
plot(V,ROC_3_9,'Color',"#D95319",'LineWidth',1.2)
plot(V,ROC_4_9,'Color',"#EDB120",'LineWidth',1.2)
plot(V,ROC_5_9,'Color','green','LineWidth',1.2)
plot(V,ROC_6_9,'Color',"#4DBEEE",'LineWidth',1.2)
% M_crit for legend
plot([Mcrit_1 Mcrit_1],[0 ROC_1_9(278)],'-.','Color',"#008888",'LineWidth',1.3)
% V_stall for legend
plot([V_stall_1_9 V_stall_1_9],[0 ROC_1_9(79)],'-.','Color',"#6600cc",'LineWidth',1.1)
% R/C Max line
plot([V(indexr_1_9) V(indexr_2_9) V(indexr_3_9) V(indexr_4_9) V(indexr_5_9) V(indexr_6_9)],[ROC_max_1_9 ROC_max_2_9 ROC_max_3_9 ROC_max_4_9 ROC_max_5_9 ROC_max_6_9],'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
% V_best
plot([V_Best_9 V_Best_9],[ROC_max_6_9 ROC_max_1_9],'Color',"blue",'LineWidth',1.5)
% ROC_Best
plot([0 V_Best_9],[ROC_Best_9 ROC_Best_9],'--','Color',"#A020F0",'LineWidth',1.3)
% V_stall lines
plot([V_stall_2_9 V_stall_2_9],[0 ROC_2_9(92)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_3_9 V_stall_3_9],[0 ROC_3_9(109)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_4_9 V_stall_4_9],[0 ROC_4_9(134)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_5_9 V_stall_5_9],[0 ROC_5_9(154)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_6_9 V_stall_6_9],[0 ROC_6_9(160)],'-.','Color',"#6600cc",'LineWidth',1.1)
% M_crit line
plot([Mcrit_2 Mcrit_2],[0 ROC_2_9(270)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_3 Mcrit_3],[0 ROC_3_9(261)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_4 Mcrit_4],[0 ROC_4_9(249)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_5 Mcrit_5],[0 ROC_5_9(242)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_6 Mcrit_6],[0 ROC_6_9(240)],'-.','Color',"#008888",'LineWidth',1.3)
text(260,41.5,'Best Speed for Climb = 294 m/s','Interpreter','latex','FontSize',15)
text(195,39.5,'Best (R/C) = 38.4 m/s','Interpreter','latex','FontSize',15)
hold off
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',17)
ylabel("Rate of Climb (m/s)",'Interpreter','latex','FontSize',17)
leg1 = legend("0.5 Km","3 Km","5.5 Km","8.5 Km","10.5 Km","11.5 Km","$V_{crit}$","$V_{stall}$","$(R/C)_{max}$","Best Speed For Climb","Best (R/C)",'Interpreter','latex','Location','west','FontSize',16); 
title(leg1,'Legend')
ylim([5 50])
xlim([50 325])
xticks(45:15:325)
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on 
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\3','RC9.pdf');
% exportgraphics(gcf,filename)
% matlab2tikz('RC9.tex'); 
%% Plot R/C Max at 0.8 WTO
hold on
title("\textbf{Rate of Climb Plot $(R/C)_{max}$ for 0.8 $W_{TO}$ and Various Altitudes}","Interpreter","latex",'FontSize',30)
plot(V,ROC_1_8,'Color','magenta','LineWidth',1.2)
plot(V,ROC_2_8,'Color','blue','LineWidth',1.2)
plot(V,ROC_3_8,'Color',"#D95319",'LineWidth',1.2)
plot(V,ROC_4_8,'Color',"#EDB120",'LineWidth',1.2)
plot(V,ROC_5_8,'Color','green','LineWidth',1.2)
plot(V,ROC_6_8,'Color',"#4DBEEE",'LineWidth',1.2)
% M_crit for legend
plot([Mcrit_1 Mcrit_1],[0 ROC_1_8(278)],'-.','Color',"#008888",'LineWidth',1.3)
% V_stall for legend
plot([V_stall_1_9 V_stall_1_9],[0 ROC_1_8(80)],'-.','Color',"#6600cc",'LineWidth',1.1)
% R/C Max line
plot([V(indexr_1_8) V(indexr_2_8) V(indexr_3_8) V(indexr_4_8) V(indexr_5_8) V(indexr_6_8)],[ROC_max_1_8 ROC_max_2_8 ROC_max_3_8 ROC_max_4_8 ROC_max_5_8 ROC_max_6_8],'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
% V_best
plot([V_Best_8 V_Best_8],[ROC_max_6_8 ROC_max_1_8],'Color',"blue",'LineWidth',1.5)
% ROC_Best
plot([0 V_Best_8],[ROC_Best_8 ROC_Best_8],'--','Color',"#A020F0",'LineWidth',1.3)
% V_stall lines
plot([V_stall_2_9 V_stall_2_9],[0 ROC_2_8(93)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_3_9 V_stall_3_9],[0 ROC_3_8(110)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_4_9 V_stall_4_9],[0 ROC_4_8(134)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_5_9 V_stall_5_9],[0 ROC_5_8(155)],'-.','Color',"#6600cc",'LineWidth',1.1)
plot([V_stall_6_9 V_stall_6_9],[0 ROC_6_8(161)],'-.','Color',"#6600cc",'LineWidth',1.1)
% M_crit line
plot([Mcrit_2 Mcrit_2],[0 ROC_2_8(270)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_3 Mcrit_3],[0 ROC_3_8(261)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_4 Mcrit_4],[0 ROC_4_8(248)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_5 Mcrit_5],[0 ROC_5_8(242)],'-.','Color',"#008888",'LineWidth',1.3)
plot([Mcrit_6 Mcrit_6],[0 ROC_6_8(240)],'-.','Color',"#008888",'LineWidth',1.3)
text(260,47,'Best Speed for Climb = 293 m/s','Interpreter','latex','FontSize',20)
text(195,45,'Best (R/C) = 44.1 m/s','Interpreter','latex','FontSize',15)
hold off
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',25)
ylabel("Rate of Climb (m/s)",'Interpreter','latex','FontSize',25)
leg1 = legend("0.5 Km","3 Km","5.5 Km","8.5 Km","10.5 Km","11.5 Km","$V_{crit}$","$V_{stall}$","$(R/C)_{max}$","Best Speed For Climb","Best (R/C)",'Interpreter','latex','Location','west','FontSize',20); 
title(leg1,'Legend')
ylim([15 50])
xlim([75 325])
xticks(45:15:325)
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on 
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\3','RC8.pdf');
% exportgraphics(gcf,filename)
% matlab2tikz('RC8.tex'); 
%% %% h v/s R/C Max Calculation
alt = [500 3000 5500 8500 10500 11500];
ROC_max_9 = [ROC_max_1_9 ROC_max_2_9 ROC_max_3_9 ROC_max_4_9 ROC_max_5_9 ROC_max_6_9];
ROC_max_8 = [ROC_max_1_8 ROC_max_2_8 ROC_max_3_8 ROC_max_4_8 ROC_max_5_8 ROC_max_6_8];
x = 0:0.5:50;
m1 = -1*h_abs_9/ROC_max_0_9;
y1 = m1*x + h_abs_9;
m2 = -1*h_abs_8/ROC_max_0_8;
y2 = m2*x + h_abs_8;
%% Service Ceiling 0.9 WTO
rho1 = ((-0.5 +((V_Best_9*t_sl)/(0.9*WTO))) + sqrt(((0.5-(V_Best_9*t_sl)/(0.9*WTO)))^2 - (4*k*V_Best_9^2*CDo)))/(((V_Best_9^3)*S*CDo)/(0.9*WTO));
rho2 = ((-0.5 + ((V_Best_9*t_sl)/(0.9*WTO))) - sqrt(((0.5-(V_Best_9*t_sl)/(0.9*WTO)))^2 - (4*k*V_Best_9^2*CDo)))/(((V_Best_9^3)*S*CDo)/(0.9*WTO));
%% Service Ceiling 0.8 WTO
rho1 = ((-0.5 +((V_Best_9*t_sl)/(0.8*WTO))) + sqrt(((0.5-(V_Best_9*t_sl)/(0.8*WTO)))^2 - (4*k*V_Best_9^2*CDo)))/(((V_Best_9^3)*S*CDo)/(0.8*WTO));
rho2 = ((-0.5 + ((V_Best_9*t_sl)/(0.8*WTO))) - sqrt(((0.5-(V_Best_9*t_sl)/(0.8*WTO)))^2 - (4*k*V_Best_9^2*CDo)))/(((V_Best_9^3)*S*CDo)/(0.8*WTO));
%% h v/s R/C Max Plot 0.9 WTO
hold on
title("\textbf{Rate of Climb Plot $(R/C)_{max}$ for 0.9 $W_{TO}$ and Various Altitudes}","Interpreter","latex",'FontSize',30)
plot(x,y1,'Color',"red",'LineWidth',1.3)
plot([2.5 0],[h_abs_9 h_abs_9],'-.','Color',"#FFA500",'LineWidth',1.3)
plot([0.5 0.5],[0 13707.1],'-.','Color',"blue",'LineWidth',1.3)
plot([42.5 42.5],[0 1000],'-.','Color',"magenta",'LineWidth',1.3)
plot([2.5 0],[13707.1 13707.1],'-.','Color',"blue",'LineWidth',1.3)
text(3,h_abs_9+200,'Absolute Ceiling = 13870 m (Rate of Climb at Absolute Ceiling = 0 m/s)','Interpreter','latex','FontSize',20)
text(3,13700,'Service Ceiling = 13707.1 m','Interpreter','latex','FontSize',20)
text(42.5,1200,'Rate of Climb at SL = 42.58 m/s','Interpreter','latex','FontSize',20,'Rotation',90)
text(1.5,3000,'Rate of Climb at Service Ceiling = 0.5 m/s','Interpreter','latex','FontSize',20,'Rotation',90)
hold off
ylabel("Altitude (m)",'Interpreter','latex','FontSize',25)
xlabel("Rate of Climb (m/s)",'Interpreter','latex','FontSize',25)
xlim([0 45])
ylim([0 15000])
yticks(0:1000:15000)
xticks(2.5:2.5:45)
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\3','C9.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('C9.tex'); 
%% h v/s R/C Max Plot 0.8 WTO
hold on
title("\textbf{Rate of Climb Plot $(R/C)_{max}$ for 0.8 $W_{TO}$ and Various Altitudes}","Interpreter","latex",'FontSize',30)
plot(x,y2,'Color',"red",'LineWidth',1.3)
plot([2.5 0],[h_abs_8 h_abs_8],'-.','Color',"#FFA500",'LineWidth',1.3)
plot([0.5 0.5],[0 14468.7],'-.','Color',"blue",'LineWidth',1.3)
plot([48.3 48.3],[0 1000],'-.','Color',"magenta",'LineWidth',1.3)
plot([2.5 0],[14468.7 14468.7],'-.','Color',"blue",'LineWidth',1.3)
text(4,h_abs_8+200,'Absolute Ceiling = 13870 m (Rate of Climb at Absolute Ceiling = 0 m/s)','Interpreter','latex','FontSize',20)
text(4,14300,'Service Ceiling = 14468.7 m','Interpreter','latex','FontSize',20)
text(48.3,1200,'Rate of Climb at SL = 48.32 m/s','Interpreter','latex','FontSize',20,'Rotation',90)
text(1.5,3000,'Rate of Climb at Service Ceiling = 0.5 m/s','Interpreter','latex','FontSize',20,'Rotation',90)
hold off
ylabel("Altitude (m)",'Interpreter','latex','FontSize',25)
xlabel("Rate of Climb (m/s)",'Interpreter','latex','FontSize',25)
xlim([0 50])
ylim([0 16000])
yticks(0:1000:16000)
xticks(2.5:2.5:50)
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\3','C8.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('C8.tex'); 
%% Variation of Thrust with Altitude for 0.9 WTO
sigma = rho(1:1501)./Rho_SL;
Thrust = Tasl*1000.*sigma;
hold on
title("\textbf{Variation of Thrust with Altitude for 0.9 $W_{TO}$}","Interpreter","latex",'FontSize',30)
plot(height(1:1501),Thrust,'Color',"blue",'LineWidth',1.5)
xlabel("Altitude (m)",'Interpreter','latex','FontSize',20)
ylabel("Thrust (N)",'Interpreter','latex','FontSize',20)
hold off
xlim([0 15000])
xticks(0:1500:15000)
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\3','Thrust.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('Thrust.tex');
%% Variation of TSFC with Altitude for 0.9 WTO
Theta = T./T_SL;
TSFC = 47.5*sqrt(Theta);
hold on
title("\textbf{Variation of Thrust Specific Fuel Consumption (TSFC) with Altitude for 0.9 $W_{TO}$}","Interpreter","latex",'FontSize',30)
plot(height,TSFC,'Color',"blue",'LineWidth',1.5)
xlabel("Altitude (m)",'Interpreter','latex','FontSize',25)
ylabel("Thrust Specific Fuel Consumption (TSFC) ($\frac{kg}{hr kN}$)",'Interpreter','latex','FontSize',25)
hold off
xlim([0 15000])
xticks(0:1500:15000)
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\3','TSFC.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('TSFC.tex');
%% Time to Climb and Fuel to Climb using for loop
h = 11500;
H = 0:10:11500;
del_h = 10;
W = [];
V_crit_9 = 0.895*a(1:1150);
W(1) = 0.9*WTO;
tc=0;
TC = [];
TC(1) = 0;
DEL_W = [];
Del_W = 0;
DEL_W(1) = 0;
Sing =[];
roc =[];
for i = 1:1150
    if V_Best_9 >= V_crit_9(i)
        q_SL = 0.5*1.225*(V_crit_9(i)^2);
    else
        q_SL = 0.5*1.225*(V_Best_9^2);
    end
    hi = (i)*del_h;
    sigma = (1-(hi/44300))^(1/0.235);
    q = sigma*q_SL;
    theta = (288.16 - (0.0065*hi))/288.16;
    TSFC = TSFC_SL*9.81*sqrt(theta)/(3600*1000);
    Cl = W(i)/(q*S);
    Cd = CDo + (k*(Cl^2));
    D = q*S*Cd;
    sing = ((t_sl*sigma)-D)/(W(i));
    if V_Best_9 >= V_crit_9(i)
        ROC = V_crit_9(i)*sing;
    else
        ROC = V_Best_9*sing;
    end
    del_t = del_h/ROC;
    del_W = (t_sl*sigma)*TSFC*del_t;
    W(i+1) = W(i) - del_W;
    tc = tc + del_t;
    TC = [TC tc];
    Del_W = Del_W+del_W;
    DEL_W = [DEL_W Del_W];
    Sing = [Sing sing];
    roc = [roc ROC];
end
tc = tc/60;
TC = TC./60;
%% Time to climb PLOTS
%% SUBPLOT 1
hold on
title("\textbf{Variation of Altitude with Time ($\Sigma\Delta t_i$) for 0.9 $W_{TO}$}","Interpreter","latex",'FontSize',30)
plot(TC,H,'Color',"blue",'LineWidth',1.5)
ylabel("Altitude (m)",'Interpreter','latex','FontSize',25)
xlabel("Time ($\Sigma\Delta t_i$)   (in minutes)",'Interpreter','latex','FontSize',25)
yticks(0:1000:12000)
xticks(1:12)
hold off
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\3','FT1.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('FT1.tex');
%% SUBPLOT 2
hold on
title("\textbf{Variation of Weight ($W_i$ ) with Altitude for 0.9 $W_{TO}$}","Interpreter","latex",'FontSize',30)
plot(H,W,'Color',"blue",'LineWidth',1.5)
xlabel("Altitude (m)",'Interpreter','latex','FontSize',25)
ylabel("Weight ($W_i$ ) (N)",'Interpreter','latex','FontSize',25)
xticks(0:1000:12000)
hold off
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\3','FT2.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('FT2.tex');
%% SUBPLOT 3
hold on
title("\textbf{Variation of Change in Weight ( $\Sigma\Delta W_{fi}$ ) with Altitude for 0.9 $W_{TO}$}","Interpreter","latex",'FontSize',30)
plot(H,DEL_W,'Color',"blue",'LineWidth',1.5)
xlabel("Altitude (m)",'Interpreter','latex','FontSize',25)
ylabel("Change in Weight ( $\Sigma\Delta W_{fi}$ ) (N)",'Interpreter','latex','FontSize',25)
hold off
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\3','FT3.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('FT3.tex');
%% SUBPLOT 4
hold on
title("\textbf{Variation of sin $\gamma_i$ with Altitude for 0.9 $W_{TO}$}","Interpreter","latex",'FontSize',30)
plot(H(1:end-1),Sing,'Color',"blue",'LineWidth',1.5)
xlabel("Altitude (m)",'Interpreter','latex','FontSize',25)
ylabel("sin $\gamma_i$",'Interpreter','latex','FontSize',25)
hold off
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\3','FT4.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('FT4.tex');
%% SUBPLOT 5
hold on
title("\textbf{Variation of R/C with Altitude for 0.9 $W_{TO}$}","Interpreter","latex",'FontSize',30)
plot(H(1:end-1),roc,'Color',"blue",'LineWidth',1.5)
xlabel("Altitude (m)",'Interpreter','latex','FontSize',25)
ylabel("Rate of Climb (R/C)  (m/s)",'Interpreter','latex','FontSize',25)
hold off
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\3','FT5.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('FT5.tex');
%% PLOT 4
sigma_5km = rho(501)/1.225;
%% Omega - V PLOT
% Calculations subplot 1
V = 0:10:700;
n = 0:0.25:2.5;
V_stall_1_9_turn = sqrt(n)*sqrt(0.9*WTO/(0.5*1.225*sigma_1*S*CLmax));
omega_1_9 = [];
Omega_stall_1_9 =[];
R = 0:2.5:100;
vr = [];
for i =1:11
    Omega = ((9.81.*sqrt((n(i).^2)-1))./V)*180/pi;
    omegastall = ((9.81.*sqrt((n(i).^2)-1))./V_stall_1_9_turn(i))*180/pi;
    omega_1_9 = [omega_1_9 Omega];
    Omega_stall_1_9 = [Omega_stall_1_9 omegastall];
end
Omega_R_1_9 = [];
for i = 1:40
    for j = 1:10
    Omega = ((9.81.*sqrt((n(j).^2)-1))./V)*180/pi;
    Omega_R_1_9 =[Omega_R_1_9 Omega];
    v = Omega*R(i);
    vr =[vr v];
    end
end
v1 = sqrt(((t_sl*sigma_1)+sqrt(((t_sl*sigma_1)^2)-(4*A_1*B_1_9*n.^2)))./(2*A_1));
v2 = sqrt(((t_sl*sigma_1)-sqrt(((t_sl*sigma_1)^2)-(4*A_1*B_1_9*n.^2)))./(2*A_1));
om1 = ((9.81*sqrt((n.^2)-1))./v1)*180/pi;
om2 = ((9.81*sqrt((n.^2)-1))./v2)*180/pi;
%% Plot 0.5 Km and O.9 WTO
title("\textbf{Turn Performance for 0.9 $W_{TO}$ and Altitude 0.5 Km}","Interpreter","latex",'FontSize',30)
xlabel("Mach Number (M)",'Interpreter','latex','FontSize',25)
ylabel("Turn Rate ($\omega$)  ($^\circ/s$)",'Interpreter','latex','FontSize',25)
hold on
grid on
% radius of turn lines
plot(vr(711:1420)./a(500),Omega_R_1_9(711:1420),'Color',"cyan",'LineWidth',0.0001)
plot(vr(1421:2130)./a(500),Omega_R_1_9(1421:2130),'Color',"cyan",'LineWidth',0.0001)
plot(vr(2131:2840)./a(500),Omega_R_1_9(2131:2840),'Color',"cyan",'LineWidth',0.0001)
plot(vr(2841:3550)./a(500),Omega_R_1_9(2841:3550),'Color',"cyan",'LineWidth',0.0001)
plot(vr(3551:4260)./a(500),Omega_R_1_9(3551:4260),'Color',"cyan",'LineWidth',0.0001)
plot(vr(4261:4970)./a(500),Omega_R_1_9(4261:4970),'Color',"cyan",'LineWidth',0.0001)
plot(vr(4971:5680)./a(500),Omega_R_1_9(4971:5680),'Color',"cyan",'LineWidth',0.0001)
plot(vr(5681:6390)./a(500),Omega_R_1_9(5681:6390),'Color',"cyan",'LineWidth',0.0001)
plot(vr(6391:7100)./a(500),Omega_R_1_9(6391:7100),'Color',"cyan",'LineWidth',0.0001)
plot(vr(7101:7810)./a(500),Omega_R_1_9(7101:7810),'Color',"cyan",'LineWidth',0.0001)
plot(vr(7811:8522)./a(500),Omega_R_1_9(7811:8522),'Color',"cyan",'LineWidth',0.0001)
% load factor lines
plot(V./a(500),omega_1_9(356:426),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_1_9(427:497),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_1_9(498:568),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_1_9(569:639),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_1_9(640:710),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_1_9(711:781),'Color',"red",'LineWidth',3)
% Stall Boundary
plot(V_stall_1_9_turn(5:end)./a(500),Omega_stall_1_9(5:end),'Color',"blue",'LineWidth',1.3)
% Propulsive Boundary
plot(v1(5:11)./a(500),om1(5:11),'Color',"magenta",'LineWidth',1.3)
plot(v2(5:11)./a(500),om2(5:11),'Color',"magenta",'LineWidth',1.3)
% Text and Markers
plot(0.50839,7.9029,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
text(0.51,8.5,'Corner Speed','Interpreter','latex','FontSize',20,'Rotation',15)
text(0.075,80,'Maximum Load Factor ($n_{max}$) = 2.5','Interpreter','latex','Color',"red",'FontSize',20,'Rotation',-73)
text(0.4,12,'Sustained Turn Rate (STR)','Interpreter','latex','Color',"magenta",'FontSize',20,'Rotation',13)
text(0.38,2,'$C_{L_{max}}$ Limit','Interpreter','latex','Color',"blue",'FontSize',20,'Rotation',0)
% Radius of Turn
text(0.48,65,'Radius of Turn = 2.5 m','Interpreter','latex','Color',"#8282ff",'FontSize',20,'Rotation',45)
text(0.78,52,'Radius of Turn = 5 m','Interpreter','latex','Color',"#8282ff",'FontSize',20,'Rotation',28)
text(0.9,40,'Radius of Turn = 7.5 m','Interpreter','latex','Color',"#8282ff",'FontSize',20,'Rotation',20)
text(0.9,30,'Radius of Turn = 10 m','Interpreter','latex','Color',"#8282ff",'FontSize',20,'Rotation',15)
xlim([0 1.4])
ylim([0 100])
xticks(0.1:0.1:1.4)
hold off
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\4','OV1.pdf');
% exportgraphics(gcf,filename)
% matlab2tikz('OV1.tex');
%% Plot 5 Km and O.9 WTO
% Calculations subplot 2
V = 0:10:700;
n = 0:0.25:2.5;
V_stall_2_9_turn = sqrt(n)*sqrt(0.9*WTO/(0.5*1.225*sigma_5km*S*CLmax));
omega_2_9 = [];
Omega_stall_2_9 =[];
R = 0:2.5:100;
vr = [];
for i =1:11
    Omega = ((9.81.*sqrt((n(i).^2)-1))./V)*180/pi;
    omegastall = ((9.81.*sqrt((n(i).^2)-1))./V_stall_2_9_turn(i))*180/pi;
    omega_2_9 = [omega_2_9 Omega];
    Omega_stall_2_9 = [Omega_stall_2_9 omegastall];
end
Omega_R_2_9 = [];
for i = 1:40
    for j = 1:10
    Omega = ((9.81.*sqrt((n(j).^2)-1))./V)*180/pi;
    Omega_R_2_9 =[Omega_R_2_9 Omega];
    v = Omega*R(i);
    vr =[vr v];
    end
end
v1 = sqrt(((t_sl*sigma_5km)+sqrt(((t_sl*sigma_5km)^2)-(4*A_2*B_2_9*n.^2)))./(2*A_2));
v2 = sqrt(((t_sl*sigma_5km)-sqrt(((t_sl*sigma_5km)^2)-(4*A_2*B_2_9*n.^2)))./(2*A_2));
om1 = ((9.81*sqrt((n.^2)-1))./v1)*180/pi;
om2 = ((9.81*sqrt((n.^2)-1))./v2)*180/pi;
%% Plot 5 Km and O.9 WTO
title("\textbf{Turn Performance for 0.9 $W_{TO}$ and Altitude 5 Km}","Interpreter","latex",'FontSize',30)
xlabel("Mach Number (M)",'Interpreter','latex','FontSize',25)
ylabel("Turn Rate ($\omega$)  ($^\circ/s$)",'Interpreter','latex','FontSize',25)
hold on
grid on
% radius of turn lines
plot(vr(711:1420)./a(500),Omega_R_2_9(711:1420),'Color',"cyan",'LineWidth',0.0001)
plot(vr(1421:2130)./a(500),Omega_R_2_9(1421:2130),'Color',"cyan",'LineWidth',0.0001)
plot(vr(2131:2840)./a(500),Omega_R_2_9(2131:2840),'Color',"cyan",'LineWidth',0.0001)
plot(vr(2841:3550)./a(500),Omega_R_2_9(2841:3550),'Color',"cyan",'LineWidth',0.0001)
plot(vr(3551:4260)./a(500),Omega_R_2_9(3551:4260),'Color',"cyan",'LineWidth',0.0001)
plot(vr(4261:4970)./a(500),Omega_R_2_9(4261:4970),'Color',"cyan",'LineWidth',0.0001)
plot(vr(4971:5680)./a(500),Omega_R_2_9(4971:5680),'Color',"cyan",'LineWidth',0.0001)
plot(vr(5681:6390)./a(500),Omega_R_2_9(5681:6390),'Color',"cyan",'LineWidth',0.0001)
plot(vr(6391:7100)./a(500),Omega_R_2_9(6391:7100),'Color',"cyan",'LineWidth',0.0001)
plot(vr(7101:7810)./a(500),Omega_R_2_9(7101:7810),'Color',"cyan",'LineWidth',0.0001)
plot(vr(7811:8522)./a(500),Omega_R_2_9(7811:8522),'Color',"cyan",'LineWidth',0.0001)
plot(vr(8523:9230)./a(500),Omega_R_2_9(8523:9230),'Color',"cyan",'LineWidth',0.0001)
plot(vr(9231:9940)./a(500),Omega_R_2_9(9231:9940),'Color',"cyan",'LineWidth',0.0001)
% load factor lines
plot(V./a(500),omega_2_9(356:426),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_2_9(427:497),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_2_9(498:568),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_2_9(569:639),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_2_9(640:710),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_2_9(711:781),'Color',"red",'LineWidth',3)
% Stall Boundary
plot(V_stall_2_9_turn(5:end)./a(500),Omega_stall_2_9(5:end),'Color',"blue",'LineWidth',1.3)
% Propulsive Boundary
plot(v1(5:11)./a(500),om1(5:11),'Color',"magenta",'LineWidth',1.3)
plot(v2(5:11)./a(500),om2(5:11),'Color',"magenta",'LineWidth',1.3)
% Text and Markers
plot(0.640189,6.27538,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
text(0.65,7.5,'Corner Speed','Interpreter','latex','FontSize',20,'Rotation',5)
text(0.075,80,'Maximum Load Factor ($n_{max}$) = 2.5','Interpreter','latex','Color',"red",'FontSize',20,'Rotation',-78)
text(0.48,10,'Sustained Turn Rate (STR)','Interpreter','latex','Color',"magenta",'FontSize',20,'Rotation',7)
text(0.28,2,'$C_{L_{max}}$ Limit','Interpreter','latex','Color',"blue",'FontSize',20,'Rotation',0)
% Radius of Turn
text(0.48,65,'Radius of Turn = 2.5 m','Interpreter','latex','Color',"#8282ff",'FontSize',20,'Rotation',45)
text(0.78,52,'Radius of Turn = 5 m','Interpreter','latex','Color',"#8282ff",'FontSize',20,'Rotation',28)
text(0.9,40,'Radius of Turn = 7.5 m','Interpreter','latex','Color',"#8282ff",'FontSize',20,'Rotation',20)
text(0.9,30,'Radius of Turn = 10 m','Interpreter','latex','Color',"#8282ff",'FontSize',20,'Rotation',15)
xlim([0 1.4])
ylim([0 100])
xticks(0.1:0.1:1.4)
hold off
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.FontSize = 20;
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\4','OV2.pdf');
% exportgraphics(gcf,filename)
% matlab2tikz('OV2.tex');
%% Plot 0.5 Km and O.8 WTO
% Calculations subplot 3
V = 0:10:700;
n = 0:0.25:2.5;
V_stall_1_8_turn = sqrt(n)*sqrt(0.8*WTO/(0.5*1.225*sigma_1*S*CLmax));
omega_1_8 = [];
Omega_stall_1_8 =[];
R = 0:2.5:100;
vr = [];
for i =1:11
    Omega = ((9.81.*sqrt((n(i).^2)-1))./V)*180/pi;
    omegastall = ((9.81.*sqrt((n(i).^2)-1))./V_stall_1_8_turn(i))*180/pi;
    omega_1_8 = [omega_1_8 Omega];
    Omega_stall_1_8 = [Omega_stall_1_8 omegastall];
end
Omega_R_1_8 = [];
for i = 1:40
    for j = 1:10
    Omega = ((9.81.*sqrt((n(j).^2)-1))./V)*180/pi;
    Omega_R_1_8 =[Omega_R_1_8 Omega];
    v = Omega*R(i);
    vr =[vr v];
    end
end
v1 = sqrt(((t_sl*sigma_1)+sqrt(((t_sl*sigma_1)^2)-(4*A_1*B_1_8*n.^2)))./(2*A_1));
v2 = sqrt(((t_sl*sigma_1)-sqrt(((t_sl*sigma_1)^2)-(4*A_1*B_1_8*n.^2)))./(2*A_1));
om1 = ((9.81*sqrt((n.^2)-1))./v1)*180/pi;
om2 = ((9.81*sqrt((n.^2)-1))./v2)*180/pi;
%% Plot 0.5 Km and O.8 WTO
title("\textbf{Turn Performance for 0.8 $W_{TO}$ and Altitude 0.5 Km}","Interpreter","latex",'FontSize',30)
xlabel("Mach Number (M)",'Interpreter','latex','FontSize',25)
ylabel("Turn Rate ($\omega$)  ($^\circ/s$)",'Interpreter','latex','FontSize',25)
hold on
grid on
% radius of turn lines
plot(vr(711:1420)./a(500),Omega_R_1_8(711:1420),'Color',"cyan",'LineWidth',0.0001)
plot(vr(1421:2130)./a(500),Omega_R_1_8(1421:2130),'Color',"cyan",'LineWidth',0.0001)
plot(vr(2131:2840)./a(500),Omega_R_1_8(2131:2840),'Color',"cyan",'LineWidth',0.0001)
plot(vr(2841:3550)./a(500),Omega_R_1_8(2841:3550),'Color',"cyan",'LineWidth',0.0001)
plot(vr(3551:4260)./a(500),Omega_R_1_8(3551:4260),'Color',"cyan",'LineWidth',0.0001)
plot(vr(4261:4970)./a(500),Omega_R_1_8(4261:4970),'Color',"cyan",'LineWidth',0.0001)
plot(vr(4971:5680)./a(500),Omega_R_1_8(4971:5680),'Color',"cyan",'LineWidth',0.0001)
plot(vr(5681:6390)./a(500),Omega_R_1_8(5681:6390),'Color',"cyan",'LineWidth',0.0001)
plot(vr(6391:7100)./a(500),Omega_R_1_8(6391:7100),'Color',"cyan",'LineWidth',0.0001)
plot(vr(7101:7810)./a(500),Omega_R_1_8(7101:7810),'Color',"cyan",'LineWidth',0.0001)
plot(vr(7811:8522)./a(500),Omega_R_1_8(7811:8522),'Color',"cyan",'LineWidth',0.0001)
% load factor lines
plot(V./a(500),omega_1_8(356:426),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_1_8(427:497),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_1_8(498:568),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_1_8(569:639),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_1_8(640:710),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_1_8(711:781),'Color',"red",'LineWidth',3)
% Stall Boundary
plot(V_stall_1_8_turn(5:end)./a(500),Omega_stall_1_8(5:end),'Color',"blue",'LineWidth',1.3)
% Propulsive Boundary
plot(v1(5:11)./a(500),om1(5:11),'Color',"magenta",'LineWidth',1.3)
plot(v2(5:11)./a(500),om2(5:11),'Color',"magenta",'LineWidth',1.3)
% Text and Markers
plot(0.47926,8.38229,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
text(0.48,10,'Corner Speed','Interpreter','latex','FontSize',20,'Rotation',5)
text(0.075,80,'Maximum Load Factor ($n_{max}$) = 2.5','Interpreter','latex','Color',"red",'FontSize',20,'Rotation',-78)
text(0.35,13,'Sustained Turn Rate (STR)','Interpreter','latex','Color',"magenta",'FontSize',20,'Rotation',15)
text(0.35,2,'$C_{L_{max}}$ Limit','Interpreter','latex','Color',"blue",'FontSize',20,'Rotation',0)
% Radius of Turn
text(0.48,65,'Radius of Turn = 2.5 m','Interpreter','latex','Color',"#8282ff",'FontSize',20,'Rotation',45)
text(0.78,52,'Radius of Turn = 5 m','Interpreter','latex','Color',"#8282ff",'FontSize',20,'Rotation',28)
text(0.9,40,'Radius of Turn = 7.5 m','Interpreter','latex','Color',"#8282ff",'FontSize',20,'Rotation',20)
text(0.9,30,'Radius of Turn = 10 m','Interpreter','latex','Color',"#8282ff",'FontSize',20,'Rotation',15)
xlim([0 1.4])
ylim([0 100])
xticks(0.1:0.1:1.4)
hold off
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.FontSize = 20;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\4','OV3.pdf');
% exportgraphics(gcf,filename)
% matlab2tikz('OV3.tex');
%% Plot 5 Km and O.8 WTO
% Calculations subplot 2
V = 0:10:700;
n = 0:0.25:2.5;
V_stall_2_8_turn = sqrt(n)*sqrt(0.8*WTO/(0.5*1.225*sigma_5km*S*CLmax));
omega_2_8 = [];
Omega_stall_2_8 =[];
R = 0:2.5:100;
vr = [];
for i =1:11
    Omega = ((9.81.*sqrt((n(i).^2)-1))./V)*180/pi;
    omegastall = ((9.81.*sqrt((n(i).^2)-1))./V_stall_2_8_turn(i))*180/pi;
    omega_2_8 = [omega_2_8 Omega];
    Omega_stall_2_8 = [Omega_stall_2_8 omegastall];
end
Omega_R_2_8 = [];
for i = 1:40
    for j = 1:10
    Omega = ((9.81.*sqrt((n(j).^2)-1))./V)*180/pi;
    Omega_R_2_8 =[Omega_R_2_8 Omega];
    v = Omega*R(i);
    vr =[vr v];
    end
end
v1 = sqrt(((t_sl*sigma_5km)+sqrt(((t_sl*sigma_5km)^2)-(4*A_2*B_2_8*n.^2)))./(2*A_2));
v2 = sqrt(((t_sl*sigma_5km)-sqrt(((t_sl*sigma_5km)^2)-(4*A_2*B_2_8*n.^2)))./(2*A_2));
om1 = ((9.81*sqrt((n.^2)-1))./v1)*180/pi;
om2 = ((9.81*sqrt((n.^2)-1))./v2)*180/pi;
%% Plot 5 Km and O.8 WTO
title("\textbf{Turn Performance for 0.8 $W_{TO}$ and Altitude 5 Km}","Interpreter","latex",'FontSize',30)
xlabel("Mach Number (M)",'Interpreter','latex','FontSize',25)
ylabel("Turn Rate ($\omega$)  ($^\circ/s$)",'Interpreter','latex','FontSize',25)
hold on
grid on
% radius of turn lines
plot(vr(711:1420)./a(500),Omega_R_2_8(711:1420),'Color',"cyan",'LineWidth',0.0001)
plot(vr(1421:2130)./a(500),Omega_R_2_8(1421:2130),'Color',"cyan",'LineWidth',0.0001)
plot(vr(2131:2840)./a(500),Omega_R_2_8(2131:2840),'Color',"cyan",'LineWidth',0.0001)
plot(vr(2841:3550)./a(500),Omega_R_2_8(2841:3550),'Color',"cyan",'LineWidth',0.0001)
plot(vr(3551:4260)./a(500),Omega_R_2_8(3551:4260),'Color',"cyan",'LineWidth',0.0001)
plot(vr(4261:4970)./a(500),Omega_R_2_8(4261:4970),'Color',"cyan",'LineWidth',0.0001)
plot(vr(4971:5680)./a(500),Omega_R_2_8(4971:5680),'Color',"cyan",'LineWidth',0.0001)
plot(vr(5681:6390)./a(500),Omega_R_2_8(5681:6390),'Color',"cyan",'LineWidth',0.0001)
plot(vr(6391:7100)./a(500),Omega_R_2_8(6391:7100),'Color',"cyan",'LineWidth',0.0001)
plot(vr(7101:7810)./a(500),Omega_R_2_8(7101:7810),'Color',"cyan",'LineWidth',0.0001)
plot(vr(7811:8522)./a(500),Omega_R_2_8(7811:8522),'Color',"cyan",'LineWidth',0.0001)
plot(vr(8523:9230)./a(500),Omega_R_2_9(8523:9230),'Color',"cyan",'LineWidth',0.0001)
plot(vr(9231:9940)./a(500),Omega_R_2_9(9231:9940),'Color',"cyan",'LineWidth',0.0001)
% load factor lines
plot(V./a(500),omega_2_8(356:426),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_2_8(427:497),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_2_8(498:568),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_2_8(569:639),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_2_8(640:710),'Color',"red",'LineWidth',0.0001)
plot(V./a(500),omega_2_8(711:781),'Color',"red",'LineWidth',3)
% Stall Boundary
plot(V_stall_2_8_turn(5:end)./a(500),Omega_stall_2_8(5:end),'Color',"blue",'LineWidth',1.3)
% Propulsive Boundary
plot(v1(5:11)./a(500),om1(5:11),'Color',"magenta",'LineWidth',1.3)
plot(v2(5:11)./a(500),om2(5:11),'Color',"magenta",'LineWidth',1.3)
% Text and Markers
plot(0.603576,6.6505,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
text(0.6,8,'Corner Speed','Interpreter','latex','FontSize',20,'Rotation',5)
text(0.075,83,'Maximum Load Factor ($n_{max}$) = 2.5','Interpreter','latex','Color',"red",'FontSize',20,'Rotation',-81)
text(0.48,10,'Sustained Turn Rate (STR)','Interpreter','latex','Color',"magenta",'FontSize',20,'Rotation',7)
text(0.27,2,'$C_{L_{max}}$ Limit','Interpreter','latex','Color',"blue",'FontSize',20,'Rotation',0)
% Radius of Turn
text(0.48,65,'Radius of Turn = 2.5 m','Interpreter','latex','Color',"#8282ff",'FontSize',20,'Rotation',45)
text(0.78,52,'Radius of Turn = 5 m','Interpreter','latex','Color',"#8282ff",'FontSize',20,'Rotation',28)
text(0.9,40,'Radius of Turn = 7.5 m','Interpreter','latex','Color',"#8282ff",'FontSize',20,'Rotation',20)
text(0.9,30,'Radius of Turn = 10 m','Interpreter','latex','Color',"#8282ff",'FontSize',20,'Rotation',15)
xlim([0 1.4])
ylim([0 100])
xticks(0.1:0.1:1.4)
hold off
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.FontSize = 20;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\4','OV4.pdf');
% exportgraphics(gcf,filename)
% matlab2tikz('OV4.tex');
%% n - V PLOT
%% Plot 0.5 Km and O.9 WTO
% Calculations
n_stall =0:0.05:5;
V = 0:10:508;
n = sqrt((0.5*1.225*sigma_1*S.*(V.^2)/(k*(0.9*WTO))).*(((t_sl*sigma_1)/(0.9*WTO))-((0.5*S*1.225*sigma_1.*(V.^2).*CDo)./(0.9*WTO))));
V_stall_1_9_turn = sqrt(n_stall)*sqrt(0.9*WTO/(0.5*1.225*sigma_1*S*CLmax));
n_max = 0.5*1.225*sigma_1*S.*(V.^2).*CLmax./(0.9*WTO); 
phi = atand(sqrt(n.^2-1));
[~,index] = max(n);
title("\textbf{Turn Performance for 0.9 $W_{TO}$ and Altitude 0.5 Km}","Interpreter","latex",'FontSize',30)
xlabel("Velocity ($V_{\infty}$)  (m/s)",'Interpreter','latex','FontSize',25)
yyaxis left
yticks(0:0.5:6)
ylabel("Load Factor (n)",'Interpreter','latex','FontSize',25)
grid on
hold on
plot(V,n,'Color',"blue",'LineWidth',1.3)
plot(V_stall_1_9_turn(1:75),n_stall(1:75),'Color',"red",'LineWidth',1.3,'LineStyle','-')
plot([0 550],[2.5 2.5],'Color',"#FFA500",'LineWidth',1.3,'LineStyle','-')
plot(162.961,2.5,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(V(index),max(n),'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
text(168,2.58,'Corner Speed','Interpreter','latex','FontSize',20,'Rotation',0)
text(250,5.15,'Maximum load factor (from propulsive boundary) = 5.04','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"blue")
text(20,2.6,'Structural limit n = 2.5','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"#FFA500")
text(290,4.6,'Bank Angle Boundary ($\phi_{max}$)','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"green")
text(85,0.8,'Stall Boundary ($C_{L_{max}}$)','Interpreter','latex','FontSize',20,'Rotation',51,'Color',"red")
yyaxis right
plot(V(32:end),phi(32:end),'Color',"green",'LineWidth',1.3)
ylabel("Bank Angle ($^\circ$)",'Interpreter','latex','FontSize',25)
ylim([0 100])
hold off
xlim([0 550])
xticks(50:50:550)
yticks(10:10:100)
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
set(gcf, 'Position', get(0,'ScreenSize'));
ax.FontSize = 20;
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\4','NV1.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('NV1.tex');
%% Plot 5 Km and O.9 WTO
% Calculations
n_stall =0:0.05:5;
V = 0:10:508;
n = sqrt((0.5*1.225*sigma_5km*S.*(V.^2)/(k*(0.9*WTO))).*(((t_sl*sigma_5km)/(0.9*WTO))-((0.5*S*1.225*sigma_5km.*(V.^2).*CDo)./(0.9*WTO))));
V_stall_2_9_turn = sqrt(n_stall)*sqrt(0.9*WTO/(0.5*1.225*sigma_5km*S*CLmax));
n_max = 0.5*1.225*sigma_5km*S.*(V.^2).*CLmax./(0.9*WTO); 
phi = atand(sqrt(n.^2-1));
[~,index] = max(n);
title("\textbf{Turn Performance for 0.9 $W_{TO}$ and Altitude 5 Km}","Interpreter","latex",'FontSize',30)
xlabel("Velocity ($V_{\infty}$)  (m/s)",'Interpreter','latex','FontSize',25)
yyaxis left
yticks(0:0.5:6)
ylabel("Load Factor (n)",'Interpreter','latex','FontSize',25)
grid on
hold on
plot(V,n,'Color',"blue",'LineWidth',1.3)
plot(V_stall_2_9_turn(1:51),n_stall(1:51),'Color',"red",'LineWidth',1.3,'LineStyle','-')
plot([0 550],[2.5 2.5],'Color',"#FFA500",'LineWidth',1.3,'LineStyle','-')
plot(205.225,2.5,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(V(index),max(n),'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
text(160,2.59,'Corner Speed','Interpreter','latex','FontSize',20,'Rotation',0)
text(250,3.25,'Maximum load factor (from propulsive boundary) = 3.18','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"blue")
text(40,2.6,'Structural limit n = 2.5','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"#FFA500")
text(300,2.4,'Bank Angle Boundary ($\phi_{max}$)','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"green")
text(100,0.8,'Stall Boundary ($C_{L_{max}}$)','Interpreter','latex','FontSize',20,'Rotation',55,'Color',"red")
yyaxis right
plot(V(32:end),phi(32:end),'Color',"green",'LineWidth',1.3)
ylabel("Bank Angle ($^\circ$)",'Interpreter','latex','FontSize',25)
ylim([0 100])
hold off
xlim([0 550])
xticks(50:50:550)
yticks(10:10:100)
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
set(gcf, 'Position', get(0,'ScreenSize'))
ax.FontSize = 20;
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\4','NV2.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('NV2.tex');
%% Plot 0.5 Km and O.8 WTO
% Calculations
n_stall =0:0.05:5;
V = 0:10:508;
n = sqrt((0.5*1.225*sigma_1*S.*(V.^2)/(k*(0.8*WTO))).*(((t_sl*sigma_1)/(0.8*WTO))-((0.5*S*1.225*sigma_1.*(V.^2).*CDo)./(0.8*WTO))));
V_stall_1_8_turn = sqrt(n_stall)*sqrt(0.8*WTO/(0.5*1.225*sigma_1*S*CLmax));
n_max = 0.5*1.225*sigma_1*S.*(V.^2).*CLmax./(0.8*WTO); 
phi = atand(sqrt(n.^2-1));
[~,index] = max(n);
title("\textbf{Turn Performance for 0.8 $W_{TO}$ and Altitude 0.5 Km}","Interpreter","latex",'FontSize',30)
xlabel("Velocity ($V_{\infty}$)  (m/s)",'Interpreter','latex','FontSize',25)
yyaxis left
yticks(0:0.5:6)
ylabel("Load Factor (n)",'Interpreter','latex','FontSize',25)
grid on
hold on
plot(V,n,'Color',"blue",'LineWidth',1.3)
plot(V_stall_1_8_turn(1:85),n_stall(1:85),'Color',"red",'LineWidth',1.3,'LineStyle','-')
plot([0 550],[2.5 2.5],'Color',"#FFA500",'LineWidth',1.3,'LineStyle','-')
plot(153.642,2.5,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(V(index),max(n),'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
text(158,2.58,'Corner Speed','Interpreter','latex','FontSize',20,'Rotation',0)
text(250,5.8,'Maximum load factor (from propulsive boundary) = 5.67','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"blue")
text(7,2.6,'Structural limit n = 2.5','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"#FFA500")
text(300,4.6,'Bank Angle Boundary ($\phi_{max}$)','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"green")
text(80,0.8,'Stall Boundary ($C_{L_{max}}$)','Interpreter','latex','FontSize',20,'Rotation',52,'Color',"red")
yyaxis right
plot(V(32:end),phi(32:end),'Color',"green",'LineWidth',1.3)
ylabel("Bank Angle ($^\circ$)",'Interpreter','latex','FontSize',25)
ylim([0 100])
hold off
xlim([0 550])
xticks(50:50:550)
yticks(10:10:100)
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
set(gcf, 'Position', get(0,'ScreenSize'));
ax.FontSize = 20;
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\4','NV3.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('NV3.tex');
%% Plot 5 Km and O.8 WTO
% Calculations
n_stall =0:0.05:5;
V = 0:10:508;
n = sqrt((0.5*1.225*sigma_5km*S.*(V.^2)/(k*(0.8*WTO))).*(((t_sl*sigma_5km)/(0.8*WTO))-((0.5*S*1.225*sigma_5km.*(V.^2).*CDo)./(0.8*WTO))));
V_stall_2_8_turn = sqrt(n_stall)*sqrt(0.8*WTO/(0.5*1.225*sigma_5km*S*CLmax));
n_max = 0.5*1.225*sigma_5km*S.*(V.^2).*CLmax./(0.9*WTO); 
phi = atand(sqrt(n.^2-1));
[~,index] = max(n);
title("\textbf{Turn Performance for 0.8 $W_{TO}$ and Altitude 5 Km}","Interpreter","latex",'FontSize',30)
xlabel("Velocity ($V_{\infty}$)  (m/s)",'Interpreter','latex','FontSize',25)
yyaxis left
yticks(0:0.5:6)
ylabel("Load Factor (n)",'Interpreter','latex','FontSize',25)
grid on
hold on
plot(V,n,'Color',"blue",'LineWidth',1.3)
plot(V_stall_2_8_turn(1:54),n_stall(1:54),'Color',"red",'LineWidth',1.3,'LineStyle','-')
plot([0 550],[2.5 2.5],'Color',"#FFA500",'LineWidth',1.3,'LineStyle','-')
plot(193.488,2.5,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(V(index),max(n),'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
text(200,2.55,'Corner Speed','Interpreter','latex','FontSize',20,'Rotation',0)
text(275,3.7,'Maximum load factor (from propulsive boundary) = 3.57','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"blue")
text(40,2.6,'Structural limit n = 2.5','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"#FFA500")
text(300,2.8,'Bank Angle Boundary ($\phi_{max}$)','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"green")
text(105,0.8,'Stall Boundary ($C_{L_{max}}$)','Interpreter','latex','FontSize',20,'Rotation',57,'Color',"red")
yyaxis right
plot(V(32:end),phi(32:end),'Color',"green",'LineWidth',1.3)
ylabel("Bank Angle ($^\circ$)",'Interpreter','latex','FontSize',25)
ylim([0 100])
hold off
xlim([0 550])
xticks(50:50:550)
yticks(10:10:100)
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
set(gcf, 'Position', get(0,'ScreenSize'));
ax.FontSize = 20;
set(gca,'Box','on');
ax = gca;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\4','NV4.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('NV4.tex');
%% Combined Plot for 0.9 WTO
% Calculations
n_stall =0:0.05:5;
V = 0:10:508;
n = sqrt((0.5*1.225*sigma_1*S.*(V.^2)/(k*(0.9*WTO))).*(((t_sl*sigma_1)/(0.9*WTO))-((0.5*S*1.225*sigma_1.*(V.^2).*CDo)./(0.9*WTO))));
V_stall_1_9_turn = sqrt(n_stall)*sqrt(0.9*WTO/(0.5*1.225*sigma_1*S*CLmax));
n_max = 0.5*1.225*sigma_1*S.*(V.^2).*CLmax./(0.9*WTO); 
phi = atand(sqrt(n.^2-1));
[~,index] = max(n);
hold on
plot(V,n,'Color',"blue",'LineWidth',1.3)
plot(V_stall_1_9_turn(1:75),n_stall(1:75),'Color',"red",'LineWidth',1.3,'LineStyle','-')
plot([0 550],[2.5 2.5],'Color',"#FFA500",'LineWidth',1.3,'LineStyle','-')
plot(V(index),max(n),'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
text(168,2.58,'Corner Speed','Interpreter','latex','FontSize',20,'Rotation',0)
text(200,5.15,'Maximum load factor (from propulsive boundary of Altitude 0.5 Km) = 5.04','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"blue")

% Calculations
n_stall =0:0.05:5;
V = 0:10:508;
n = sqrt((0.5*1.225*sigma_5km*S.*(V.^2)/(k*(0.9*WTO))).*(((t_sl*sigma_5km)/(0.9*WTO))-((0.5*S*1.225*sigma_2.*(V.^2).*CDo)./(0.9*WTO))));
V_stall_2_9_turn = sqrt(n_stall)*sqrt(0.9*WTO/(0.5*1.225*sigma_5km*S*CLmax));
n_max = 0.5*1.225*sigma_5km*S.*(V.^2).*CLmax./(0.9*WTO); 
phi = atand(sqrt(n.^2-1));
[~,index] = max(n);
title("\textbf{Turn Performance for 0.9 $W_{TO}$ and Altitudes 0.5 and 5 Km}","Interpreter","latex",'FontSize',30)
xlabel("Velocity ($V_{\infty}$)  (m/s)",'Interpreter','latex','FontSize',25)
yticks(0:0.5:6)
ylabel("Load Factor (n)",'Interpreter','latex','FontSize',25)
grid on
plot(V,n,'Color',"blue",'LineWidth',1.3)
plot(V_stall_2_9_turn(1:51),n_stall(1:51),'Color',"red",'LineWidth',1.3,'LineStyle','-')
plot([0 550],[2.5 2.5],'Color',"#FFA500",'LineWidth',1.3,'LineStyle','-')
plot(205.225,2.5,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(162.961,2.5,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(V(index),max(n),'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
text(195,3.3,'Maximum load factor (from propulsive boundary of Altitude 5 Km) = 3.18','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"blue")
text(10,2.6,'Structural limit n = 2.5','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"#FFA500")
text(105,0.8,'Stall Boundary ($C_{L_{max}}$)','Interpreter','latex','FontSize',20,'Rotation',40,'Color',"red")
hold off
xlim([0 530])
xticks(50:50:550)
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.FontSize = 20;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\4','CNV1.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('CNV1.tex');
%% Combined Plot for 0.8 WTO
% Calculations
n_stall =0:0.05:5;
V = 0:10:508;
n = sqrt((0.5*1.225*sigma_1*S.*(V.^2)/(k*(0.8*WTO))).*(((t_sl*sigma_1)/(0.8*WTO))-((0.5*S*1.225*sigma_1.*(V.^2).*CDo)./(0.8*WTO))));
V_stall_1_8_turn = sqrt(n_stall)*sqrt(0.8*WTO/(0.5*1.225*sigma_1*S*CLmax));
n_max = 0.5*1.225*sigma_1*S.*(V.^2).*CLmax./(0.8*WTO); 
phi = atand(sqrt(n.^2-1));
[~,index] = max(n);
hold on
plot(V,n,'Color',"blue",'LineWidth',1.3)
plot(V_stall_1_8_turn(1:85),n_stall(1:85),'Color',"red",'LineWidth',1.3,'LineStyle','-')
plot([0 550],[2.5 2.5],'Color',"#FFA500",'LineWidth',1.3,'LineStyle','-')
plot(V(index),max(n),'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
text(275,5.8,'Maximum load factor (from propulsive boundary) = 5.67','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"blue")
% Calculations
n_stall =0:0.05:5;
V = 0:10:508;
n = sqrt((0.5*1.225*sigma_5km*S.*(V.^2)/(k*(0.8*WTO))).*(((t_sl*sigma_5km)/(0.8*WTO))-((0.5*S*1.225*sigma_5km.*(V.^2).*CDo)./(0.8*WTO))));
V_stall_2_8_turn = sqrt(n_stall)*sqrt(0.8*WTO/(0.5*1.225*sigma_5km*S*CLmax));
n_max = 0.5*1.225*sigma_5km*S.*(V.^2).*CLmax./(0.9*WTO); 
phi = atand(sqrt(n.^2-1));
[~,index] = max(n);
title("\textbf{Turn Performance for 0.8 $W_{TO}$ and Altitudes 0.5 and 5 Km}","Interpreter","latex",'FontSize',30)
xlabel("Velocity ($V_{\infty}$)  (m/s)",'Interpreter','latex','FontSize',25)
yticks(0:0.5:6)
ylabel("Load Factor (n)",'Interpreter','latex','FontSize',25)
grid on
plot(V,n,'Color',"blue",'LineWidth',1.3)
plot(V_stall_2_8_turn(1:54),n_stall(1:54),'Color',"red",'LineWidth',1.3,'LineStyle','-')
plot([0 550],[2.5 2.5],'Color',"#FFA500",'LineWidth',1.3,'LineStyle','-')
plot(193.488,2.5,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(153.642,2.5,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(V(index),max(n),'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
text(200,2.6,'Corner Speed','Interpreter','latex','FontSize',20,'Rotation',0)
text(210,3.7,'Maximum load factor (from propulsive boundary) = 3.57','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"blue")
text(10,2.6,'Structural limit n = 2.5','Interpreter','latex','FontSize',20,'Rotation',0,'Color',"#FFA500")
text(105,0.8,'Stall Boundary ($C_{L_{max}}$)','Interpreter','latex','FontSize',20,'Rotation',45,'Color',"red")
hold off
xlim([0 530])
xticks(50:50:550)
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.FontSize = 20;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\4','CNV2.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('CNV2.tex');
%% PLOT 5
% Calculation
T = t_sl*sigma_1;
V_stall_1_9 = ((2*0.9*WTO)/(1.225*sigma_1*S*(1.15+1.15)))^0.5; 
V_stall_1_8 = ((2*0.8*WTO)/(1.225*sigma_1*S*(1.15+1.15)))^0.5; 
V_lo_9 = 1.2*V_stall_1_9;
V_lo_8 = 1.2*V_stall_1_8;
CDp = CDo+CDo_Flap + CDo_Land_Gear;
Cl_gr = CLmax + CLmax_HLD_part;
Cl_climb = 0.9*Cl_gr;
Cl_ge = 0.12;
Cdi = k*Cl_ge^2;
Cdi_c = k*Cl_ge^2;
CD_TO = CDp+Cdi;
CD_climb = CDp+Cdi_c;
D_9 = 0.5*1.225*sigma_1*V_lo_9^2*S*CD_TO;
D_9_c = 0.5*1.225*sigma_1*(V_lo_9^2)*S*CD_climb;
D_8 = 0.5*1.225*sigma_1*V_lo_8^2*S*CD_TO;
D_8_c = 0.5*1.225*sigma_1*V_lo_8^2*S*CD_climb;
% Distance for Rotation
sr_9 = 3*V_lo_9;
sr_8 = 3*V_lo_8;
% Calculation
sing_9 = (T-D_9_c)/(0.9*WTO);
g_9 = asind(sing_9);
sing_8 = (T-D_8_c)/(0.8*WTO);
g_8 = asind(sing_8);
% Distance to Climb
s_c_9 = 10.7/tand(g_9);
s_c_8 = 10.7/tand(g_8);
% Time for Rotation
t_r = 3;
% Time to Climb
t_c_9 = 10.7/(V_lo_9*tand(g_9));
t_c_8 = 10.7/(V_lo_8*tand(g_8));
%% AEO for 0.9 WTO
T = t_sl*sigma_1;
Vstall = ((2*0.9*WTO)/(1.225*sigma_1*S*(1.15+1.15)))^0.5; 
Vr = 1.2*Vstall;
v = zeros([500 1]);
a = zeros([500 1]);
s = zeros([500 1]);
t = zeros([500 1]);
del_v = zeros([500 1]);
del_s = zeros([500 1]);
q = zeros([500 1]);
D = zeros([500 1]);
L = zeros([500 1]);
i = 1;
while v(i) <= Vr                   % loop to find T/O parameters
    q(i) = 0.5*1.225*v(i)^2;
    L(i) = q(i)*S*0.12;
    D(i) = q(i)*S*CD_TO;
    a(i) = ((T - D(i) - mu*((0.9*WTO)-L(i)))*g)/(0.9*WTO);
    del_v(i) = a(i)*0.25;
    del_s(i) = v(i)*0.25 + 0.5*a(i)*0.25^2;
    v(i+1) = v(i) +  del_v(i);
    s(i+1) = s(i) + del_s(i);
    t(i+1) = t(i) + 0.25;
    i = i+1;
end
S_9 = s(182)+sr_9+s_c_9;
T_9 = t_r + t_c_9 + t(182);
%% AEO for 0.8 WTO
T = t_sl*sigma_1;
Vstall = ((2*0.8*WTO)/(1.225*sigma_1*S*(1.15+1.15)))^0.5; 
Vr = 1.2*Vstall;
v = zeros([500 1]);
a = zeros([500 1]);
s = zeros([500 1]);
t = zeros([500 1]);
del_v = zeros([500 1]);
del_s = zeros([500 1]);
q = zeros([500 1]);
D = zeros([500 1]);
L = zeros([500 1]);
i = 1;
while v(i) <= Vr                   % loop to find T/O parameters
    q(i) = 0.5*1.225*v(i)^2;
    L(i) = q(i)*S*0.12;
    D(i) = q(i)*S*CD_TO;
    a(i) = ((T - D(i) - mu*((0.8*WTO)-L(i)))*g)/(0.8*WTO);
    del_v(i) = a(i)*0.25;
    del_s(i) = v(i)*0.25 + 0.5*a(i)*0.25^2;
    v(i+1) = v(i) +  del_v(i);
    s(i+1) = s(i) + del_s(i);
    t(i+1) = t(i) + 0.25;
    i = i+1;
end
S_8 = s(151)+sr_8+s_c_8;
T_8 = t_r + t_c_8 + t(151);
%% OEI for 0.9 WTO
%% ASDR for 0.9 WTO and 0.5 km
T = t_sl*sigma_1;
Vstall = ((2*0.9*WTO)/(1.225*sigma_1*S*(1.15+1.15)))^0.5;
Vr = 1.2*Vstall;
v_asdr_9 = zeros([400 8]);
a = zeros([400 8]);
s_asdr_9 = zeros([400 8]);
t_asdr_9 = zeros([400 8]);
del_v = zeros([400 8]);
del_s = zeros([400 8]);
q = zeros([400 8]);
D = zeros([400 8]);
L = zeros([400 8]);
x = 0.65;
z = 1;
condition = true;
% loop
while condition == true
    i = 1;
    while v_asdr_9(i,z) <= x*Vr           % loop to find T/O parameters till failure
        q(i,z) = 0.5*1.225*sigma_1*v_asdr_9(i,z)^2;
        L(i,z) = q(i,z)*S*0.12;
        D(i,z) = q(i,z)*S*CD_TO;
        a(i,z) = ((T - D(i,z) - mu*((0.9*WTO)-L(i,z)))*g)/(0.9*WTO);
        del_v(i,z) = a(i,z)*0.25;
        del_s(i,z) = v_asdr_9(i,z)*0.25 + 0.5*a(i,z)*0.25^2;
        v_asdr_9(i+1,z) = v_asdr_9(i,z) +  del_v(i,z);
        s_asdr_9(i+1,z) = s_asdr_9(i,z) + del_s(i,z);
        t_asdr_9(i+1,z) = t_asdr_9(i,z) + 0.25;
        i = i+1;
    end
    j = i;
    v_asdr_9(j) = x*Vr;
    s_asdr_9(j) = s_asdr_9(i);
    q(j) = q(i);
    L(j) = L(i);
    D(j) = D(i);
    t_asdr_9(j) = t_asdr_9(i);
    while j < i + 12                  % loop to find T/O paramters during decision phase
        q(j,z) = 0.5*1.225*v_asdr_9(j,z)^2;
        L(j,z) = q(j,z)*S*0.12;
        D(j,z) = q(j,z)*S*CD_TO;
        a(j,z) = ((0.75*T - D(i,z) - mu*((0.9*WTO)-L(i,z)))*g)/(0.9*WTO);
        del_v(j,z) = a(j,z)*0.25;
        del_s(j,z) = v_asdr_9(j,z)*0.25 + 0.5*a(j,z)*0.25^2;
        v_asdr_9(j+1,z) = v_asdr_9(j,z) + del_v(j,z);
        s_asdr_9(j+1,z) = s_asdr_9(j) + del_s(j,z);
        t_asdr_9(j+1,z) = t_asdr_9(j,z) + 0.25;
        j = j+1;
    end
    k = j;
    v_asdr_9(k) = x*Vr;
    s_asdr_9(k) = s_asdr_9(j);
    q(k) = q(j);
    L(k) = L(j);
    D(k) = D(j);
    t_asdr_9(k) = t_asdr_9(j);
    while v_asdr_9(k,z) >= 0              % loop to find T/O parameters during deceleration phase
        q(k,z) = 0.5*1.225*sigma_1*v_asdr_9(k,z)^2;
        L(k,z) = q(k,z)*S*0.12;
        D(k,z) = q(k,z)*S*CD_TO;
        a(k,z) = -2.4525;
        del_v(k,z) = a(k,z)*0.25;
        del_s(k,z) = v_asdr_9(k,z)*0.25 + 0.5*a(k,z)*0.25^2;
        v_asdr_9(k+1,z) = v_asdr_9(k,z) + del_v(k,z);
        s_asdr_9(k+1,z) = s_asdr_9(k,z) + del_s(k,z);
        t_asdr_9(k+1,z) = t_asdr_9(k,z) + 0.25;
        k = k+1;
    end
    if x<1
        x = x + 0.05;
    else
        condition = false;
    end
    z = z + 1;
end
%% TODR for 0.9 WTO and 0.5 km
% Initialisation
T = t_sl*sigma_1;
Vstall = ((2*WTO*0.9)/(1.225*sigma_1*S*(1.15+1.15)))^0.5;
Vr = 1.2*Vstall;
a = zeros([400 8]);
s_todr_9 = zeros([400 8]);
v_todr_9 = zeros([400 8]);
t_todr_9 = zeros([400 8]);
del_v = zeros([400 8]);
del_s = zeros([400 8]);
q = zeros([400 8]);
D = zeros([400 8]);
L = zeros([400 8]);
x = 0.65;
z = 1;
condition = true;
% Loop
while condition == true
    i = 1;
    while v_todr_9(i,z) <= x*Vr            % loop to find T/O parameters till failure
        q(i,z) = 0.5*1.225*sigma_1*v_todr_9(i,z)^2;
        L(i,z) = q(i,z)*S*0.12;
        D(i,z) = q(i,z)*S*CD_TO;
        a(i,z) = ((T - D(i,z) - mu*((0.9*WTO)-L(i,z)))*g)/(0.9*WTO);
        del_v(i,z) = a(i,z)*0.25;
        del_s(i,z) = v_todr_9(i,z)*0.25 + 0.5*a(i,z)*0.25^2;
        v_todr_9(i+1,z) = v_todr_9(i,z) +  del_v(i,z);
        s_todr_9(i+1,z) = s_todr_9(i,z) + del_s(i,z);
        t_todr_9(i+1,z) = t_todr_9(i,z) + 0.25;
        i = i+1;
    end
    j = i;
    v_todr_9(j,z) = x*Vr;
    s_todr_9(j,z) = s_todr_9(i,z);
    q(j,z) = q(i,z);
    L(j,z) = L(i,z);
    D(j,z) = D(i,z);
    t_todr_9(j,z) = t_todr_9(i,z);
    while v_todr_9(j,z) <= Vr              % loop to find T/O parameters after failure
        q(j,z) = 0.5*1.225*sigma_1*v_todr_9(j,z)^2;
        L(j,z) = q(j,z)*S*0.12;
        D(j,z) = q(j,z)*S*CD_TO;
        a(j,z) = ((0.75*T - D(j,z) - mu*((0.9*WTO)-L(j,z)))*g)/(0.9*WTO);
        del_v(j,z) = a(j,z)*0.25;
        del_s(j,z) = v_todr_9(j,z)*0.25 + 0.5*a(j,z)*0.25^2;
        v_todr_9(j+1,z) = v_todr_9(j,z) +  del_v(j,z);
        s_todr_9(j+1,z) = s_todr_9(j,z) + del_s(j,z);
        t_todr_9(j+1,z) = t_todr_9(j,z) + 0.25;
        j = j+1;
    end
    if x < 1
        x = x + 0.05;
    else
        condition = false;
    end
    z = z + 1;
end
%% BFL for 0.5 Km
V_f = [0.65*Vr 0.70*Vr 0.75*Vr 0.80*Vr 0.85*Vr 0.90*Vr 0.95*Vr Vr];
S_TODR_9 = [2.4541e03 2.4143e03 2.3654e03 2.2973e03 2.2472e03 2.1709e03 2.0903e03 2.0050e03];
S_ASDR_9 = [1.6634e+03 2.0008e03 2.2562e03 2.4803e03 2.6988e03 2.9116e03 3.1185e03 3.3414e03];
hold on
title("\textbf{Balanced Field Length for a Take-Off Altitude of 0.5 km and 0.9 $W_{TO}$}","Interpreter","latex",'FontSize',30)
P = InterX([V_f;S_ASDR_9],[V_f;S_TODR_9]);
plot(V_f,S_ASDR_9,'Color',"blue",'LineWidth',1.3,'LineStyle','-')
plot(V_f,S_TODR_9,'Color',"magenta",'LineWidth',1.3,'LineStyle','-')
plot([P(1) P(1)],[1400 P(2)],'Color',"green",'LineWidth',1.3,'LineStyle','--')
plot([0 P(1)],[P(2) P(2)],'Color',"green",'LineWidth',1.3,'LineStyle','--')
plot(P(1),P(2),'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
text(P(1)+0.5,1500,'Decision Speed = 67.23 m/s','Interpreter','latex','FontSize',20,'Rotation',90)
text(56,P(2)-50,'BFL = 2339.95 m','Interpreter','latex','FontSize',20,'Rotation',0)
hold off
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
leg1 = legend("ASDR","TODR",'Interpreter','latex','Location','northwest','FontSize',20); 
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',25)
ylabel("Distance (m)",'Interpreter','latex','FontSize',25)
title(leg1,'Legend')
set(gca,'Box','on');
ax = gca;
xticks(55:2.5:95)
ylim([1400 3400])
xlim([55 95])
ax.FontSize = 20;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\5','0pt5km.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('CNV2.tex');
%% ASDR for 1.5 km
sigma_15 = sigma(151);
T = t_sl*sigma_15;
Vstall = ((2*0.9*WTO)/(1.225*sigma_15*S*(1.15+1.15)))^0.5;
Vr = 1.2*Vstall;
v_asdr_9 = zeros([400 8]);
a = zeros([400 8]);
s_asdr_9 = zeros([400 8]);
t_asdr_9 = zeros([400 8]);
del_v = zeros([400 8]);
del_s = zeros([400 8]);
q = zeros([400 8]);
D = zeros([400 8]);
L = zeros([400 8]);
x = 0.65;
z = 1;
condition = true;
% loop
while condition == true
    i = 1;
    while v_asdr_9(i,z) <= x*Vr           % loop to find T/O parameters till failure
        q(i,z) = 0.5*1.225*sigma_15*v_asdr_9(i,z)^2;
        L(i,z) = q(i,z)*S*0.12;
        D(i,z) = q(i,z)*S*CD_TO;
        a(i,z) = ((T - D(i,z) - mu*((0.9*WTO)-L(i,z)))*g)/(0.9*WTO);
        del_v(i,z) = a(i,z)*0.25;
        del_s(i,z) = v_asdr_9(i,z)*0.25 + 0.5*a(i,z)*0.25^2;
        v_asdr_9(i+1,z) = v_asdr_9(i,z) +  del_v(i,z);
        s_asdr_9(i+1,z) = s_asdr_9(i,z) + del_s(i,z);
        t_asdr_9(i+1,z) = t_asdr_9(i,z) + 0.25;
        i = i+1;
    end
    j = i;
    v_asdr_9(j) = x*Vr;
    s_asdr_9(j) = s_asdr_9(i);
    q(j) = q(i);
    L(j) = L(i);
    D(j) = D(i);
    t_asdr_9(j) = t_asdr_9(i);
    while j < i + 12                  % loop to find T/O paramters during decision phase
        q(j,z) = 0.5*1.225*sigma_15*v_asdr_9(j,z)^2;
        L(j,z) = q(j,z)*S*0.12;
        D(j,z) = q(j,z)*S*CD_TO;
        a(j,z) = ((0.75*T - D(i,z) - mu*((0.9*WTO)-L(i,z)))*g)/(0.9*WTO);
        del_v(j,z) = a(j,z)*0.25;
        del_s(j,z) = v_asdr_9(j,z)*0.25 + 0.5*a(j,z)*0.25^2;
        v_asdr_9(j+1,z) = v_asdr_9(j,z) + del_v(j,z);
        s_asdr_9(j+1,z) = s_asdr_9(j) + del_s(j,z);
        t_asdr_9(j+1,z) = t_asdr_9(j,z) + 0.25;
        j = j+1;
    end
    k = j;
    v_asdr_9(k) = x*Vr;
    s_asdr_9(k) = s_asdr_9(j);
    q(k) = q(j);
    L(k) = L(j);
    D(k) = D(j);
    t_asdr_9(k) = t_asdr_9(j);
    while v_asdr_9(k,z) >= 0              % loop to find T/O parameters during deceleration phase
        q(k,z) = 0.5*1.225*sigma_15*v_asdr_9(k,z)^2;
        L(k,z) = q(k,z)*S*0.12;
        D(k,z) = q(k,z)*S*CD_TO;
        a(k,z) = -2.4525;
        del_v(k,z) = a(k,z)*0.25;
        del_s(k,z) = v_asdr_9(k,z)*0.25 + 0.5*a(k,z)*0.25^2;
        v_asdr_9(k+1,z) = v_asdr_9(k,z) + del_v(k,z);
        s_asdr_9(k+1,z) = s_asdr_9(k,z) + del_s(k,z);
        t_asdr_9(k+1,z) = t_asdr_9(k,z) + 0.25;
        k = k+1;
    end
    if x<1
        x = x + 0.05;
    else
        condition = false;
    end
    z = z + 1;
end
%% TODR for 0.9 WTO and 1.5 km
% Initialisation
% Initialisation
T = t_sl*sigma_15;
Vstall = ((2*WTO*0.9)/(1.225*sigma_15*S*(1.15+1.15)))^0.5;
Vr = 1.2*Vstall;
a = zeros([400 8]);
s_todr_9 = zeros([400 8]);
v_todr_9 = zeros([400 8]);
t_todr_9 = zeros([400 8]);
del_v = zeros([400 8]);
del_s = zeros([400 8]);
q = zeros([400 8]);
D = zeros([400 8]);
L = zeros([400 8]);
x = 0.65;
z = 1;
condition = true;
% Loop
while condition == true
    i = 1;
    while v_todr_9(i,z) <= x*Vr            % loop to find T/O parameters till failure
        q(i,z) = 0.5*1.225*sigma_15*v_todr_9(i,z)^2;
        L(i,z) = q(i,z)*S*0.12;
        D(i,z) = q(i,z)*S*CD_TO;
        a(i,z) = ((T - D(i,z) - mu*((0.9*WTO)-L(i,z)))*g)/(0.9*WTO);
        del_v(i,z) = a(i,z)*0.25;
        del_s(i,z) = v_todr_9(i,z)*0.25 + 0.5*a(i,z)*0.25^2;
        v_todr_9(i+1,z) = v_todr_9(i,z) +  del_v(i,z);
        s_todr_9(i+1,z) = s_todr_9(i,z) + del_s(i,z);
        t_todr_9(i+1,z) = t_todr_9(i,z) + 0.25;
        i = i+1;
    end
    j = i;
    v_todr_9(j,z) = x*Vr;
    s_todr_9(j,z) = s_todr_9(i,z);
    q(j,z) = q(i,z);
    L(j,z) = L(i,z);
    D(j,z) = D(i,z);
    t_todr_9(j,z) = t_todr_9(i,z);
    while v_todr_9(j,z) <= Vr              % loop to find T/O parameters after failure
        q(j,z) = 0.5*1.225*sigma_15*v_todr_9(j,z)^2;
        L(j,z) = q(j,z)*S*0.12;
        D(j,z) = q(j,z)*S*CD_TO;
        a(j,z) = ((0.75*T - D(j,z) - mu*((0.9*WTO)-L(j,z)))*g)/(0.9*WTO);
        del_v(j,z) = a(j,z)*0.25;
        del_s(j,z) = v_todr_9(j,z)*0.25 + 0.5*a(j,z)*0.25^2;
        v_todr_9(j+1,z) = v_todr_9(j,z) +  del_v(j,z);
        s_todr_9(j+1,z) = s_todr_9(j,z) + del_s(j,z);
        t_todr_9(j+1,z) = t_todr_9(j,z) + 0.25;
        j = j+1;
    end
    if x < 1
        x = x + 0.05;
    else
        condition = false;
    end
    z = z + 1;
end
%% AEO for 0.9 WTO and 1.5 km
% Initialisation
T = t_sl*sigma_15;
Vstall = ((2*0.9*WTO)/(1.225*sigma_15*S*(1.15+1.15)))^0.5; 
Vr = 1.2*Vstall;
D_9 = 0.5*1.225*sigma_15*Vr^2*S*CD_TO;
D_9_c = 0.5*1.225*sigma_15*(Vr^2)*S*CD_climb;
% Distance for Rotation
sr_9_15 = 3*Vr;
% Calculation
sing_9_15 = (T-D_9_c)/(0.9*WTO);
g_9_15 = asind(sing_9_15);
% Distance to Climb
s_c_9_15 = 10.7/tand(g_9_15);
% Time for Rotation
t_r = 3;
% Time to Climb
t_c_9_15 = 10.7/(Vr*tand(g_9));
T = t_sl*sigma_1;
v = zeros([500 1]);
a = zeros([500 1]);
s = zeros([500 1]);
t = zeros([500 1]);
del_v = zeros([500 1]);
del_s = zeros([500 1]);
q = zeros([500 1]);
D = zeros([500 1]);
L = zeros([500 1]);
i = 1;
while v(i) <= Vr                   % loop to find T/O parameters
    q(i) = 0.5*1.225*v(i)^2;
    L(i) = q(i)*S*0.12;
    D(i) = q(i)*S*CD_TO;
    a(i) = ((T - D(i) - mu*((0.8*WTO)-L(i)))*g)/(0.8*WTO);
    del_v(i) = a(i)*0.25;
    del_s(i) = v(i)*0.25 + 0.5*a(i)*0.25^2;
    v(i+1) = v(i) +  del_v(i);
    s(i+1) = s(i) + del_s(i);
    t(i+1) = t(i) + 0.25;
    i = i+1;
end
S_9_15 = s(151)+sr_9_15+s_c_9_15;
T_9_15 = t(151)+t_r+t_c_9_15;
%% BFL for 1.5 Km
V_f = [0.65*Vr 0.70*Vr 0.75*Vr 0.80*Vr 0.85*Vr 0.90*Vr 0.95*Vr Vr];
S_TODR_9 = [3.0536e03 2.9912e03 2.9253e03 2.8372e03 2.7623e03 2.6602e03 2.5674e03 2.4648e03];
S_ASDR_9 = [1.9319e+03 2.3120e03 2.5865e03 2.8272e03 3.0819e03 3.3260e03 3.5592e03 3.7814e03];
hold on
title("\textbf{Balanced Field Length for a Take-Off Altitude of 1.5 km and 0.9 $W_{TO}$}","Interpreter","latex",'FontSize',30)
P = InterX([V_f;S_ASDR_9],[V_f;S_TODR_9]);
plot(V_f,S_ASDR_9,'Color',"blue",'LineWidth',1.3,'LineStyle','-')
plot(V_f,S_TODR_9,'Color',"magenta",'LineWidth',1.3,'LineStyle','-')
plot([P(1) P(1)],[1400 P(2)],'Color',"green",'LineWidth',1.3,'LineStyle','--')
plot([0 P(1)],[P(2) P(2)],'Color',"green",'LineWidth',1.3,'LineStyle','--')
plot(P(1),P(2),'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
text(P(1)+0.5,1900,'Decision Speed = 73.63 m/s','Interpreter','latex','FontSize',20,'Rotation',90)
text(56,P(2)-50,'BFL = 2834.93 m','Interpreter','latex','FontSize',20,'Rotation',0)
hold off
grid on
set(gcf, 'Position', get(0,'ScreenSize'));
leg1 = legend("ASDR","TODR",'Interpreter','latex','Location','northwest','FontSize',20); 
xlabel("Velocity (m/s)",'Interpreter','latex','FontSize',25)
ylabel("Distance (m)",'Interpreter','latex','FontSize',25)
title(leg1,'Legend')
set(gca,'Box','on');
ax = gca;
xticks(57.5:2.5:95)
ylim([1800 4000])
xlim([55 95])
ax.FontSize = 20;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\5','1pt5km.pdf');
exportgraphics(gcf,filename)
% matlab2tikz('CNV2.tex');
%% Landing Distance
V_stall_8 = sqrt(2*0.8*WTO/((CLmax+CLmax_HLD_full)*S*rho_1));
V_stall_6 = sqrt(2*0.6*WTO/((CLmax+CLmax_HLD_full)*S*rho_1));
V_a_8 = 1.3*V_stall_8;
V_a_6 = 1.3*V_stall_6;
gamma = 3*pi/180;
s_1_8 = 15.2/tan(gamma);
s_1_6 = 15.2/tan(gamma);
s_2_8 = 0.1248*(V_stall_8^2)*gamma;
s_2_6 = 0.1248*(V_stall_6^2)*gamma;
s_3_8 = 3*V_a_8;
s_3_6 = 3*V_a_6;
s_4_8 = V_a_8^2/(2*2.5);
s_4_6 = V_a_6^2/(2*2.5);
s_8 = s_1_8 + s_2_8 + s_3_8 + s_4_8;
s_6 = s_1_6 + s_2_6 + s_3_6 + s_4_6;
%% PLOT 6 Payload v/s Range
MTOW = (WEmpty*1000)+(0.95*WFuel*1000)+(0.95*WPayLoad*1000);
TSFC = (47.5*9.81*(Theta(1201)^0.5))/(3600*1000);
% Weights
WA = MTOW - (0.05*WFuel*1000);
WB = MTOW - (0.93*WFuel*1000);
MTOW = (WEmpty*1000)+(1.3*0.95*WFuel*1000)+(0.95*WPayLoad*1000);
WE = MTOW - (0.05*WFuel*1000);
WC = MTOW - (1.23*WFuel*1000);
WF = (MTOW - ((1/3)*(0.95*WPayLoad*1000))) - (0.05*WFuel*1000);
WG= (MTOW - ((1/3)*(0.95*WPayLoad*1000))) - (1.23*WFuel*1000);
WH= (MTOW - ((2/3)*(0.95*WPayLoad*1000))) - (0.05*WFuel*1000);
WI= (MTOW - ((2/3)*(0.95*WPayLoad*1000))) - (1.23*WFuel*1000);
WO = (MTOW - ((0.95*WPayLoad*1000))) - (0.05*WFuel*1000);
WD = (MTOW - ((0.95*WPayLoad*1000))) - (1.23*WFuel*1000);

WPLA = 0.95*WPayLoad*1000;
WPLE = (0.95*WPayLoad*1000) - (0.3*0.95*WFuel*1000);
WPLF = (2/3)*WPLE;
WPLH = (1/3)*WPLE;
WPLO = 0;
% Cruise Calculation
CL_Cruise = sqrt(CDo/k);
% V_Cruise = sqrt(((2*MTOW)/(rho(1201)*S))*(1/CL_Cruise));
CD_Cruise = 2*CDo;
V_crit = a(1201)*Mcrit_orig;
V_Cruise = V_crit;
% Ranges
R_1 = ((2/TSFC)*sqrt(2/(rho(1201)*S))*(3/4)*(1/(3*k*(CDo^3)))^(1/4)*(sqrt(WA) - sqrt(WB)))/1000;
R_2 = ((2/TSFC)*sqrt(2/(rho(1201)*S))*(3/4)*(1/(3*k*(CDo^3)))^(1/4)*(sqrt(WE) - sqrt(WC)))/1000;
R_3 = ((2/TSFC)*sqrt(2/(rho(1201)*S))*(3/4)*(1/(3*k*(CDo^3)))^(1/4)*(sqrt(WF) - sqrt(WG)))/1000;
R_4 = ((2/TSFC)*sqrt(2/(rho(1201)*S))*(3/4)*(1/(3*k*(CDo^3)))^(1/4)*(sqrt(WH) - sqrt(WI)))/1000;
R_5 = ((2/TSFC)*sqrt(2/(rho(1201)*S))*(3/4)*(1/(3*k*(CDo^3)))^(1/4)*(sqrt(WO) - sqrt(WD)))/1000;
% Breguet Ranges
R_1_B = ((V_Cruise/TSFC)*(CL_Cruise/CD_Cruise)*log(WA/WB))/1000;
R_2_B = ((V_Cruise/TSFC)*(CL_Cruise/CD_Cruise)*log(WE/WC))/1000;
R_3_B = ((V_Cruise/TSFC)*(CL_Cruise/CD_Cruise)*log(WF/WG))/1000;
R_4_B = ((V_Cruise/TSFC)*(CL_Cruise/CD_Cruise)*log(WH/WI))/1000;
R_5_B = ((V_Cruise/TSFC)*(CL_Cruise/CD_Cruise)*log(WO/WD))/1000;

%% Plotting Payload v/s Range
hold on
title("\textbf{Payload v/s Range Diagram for a Cruise Altitude of 12 km}","Interpreter","latex",'FontSize',30)
xlim([0 4.5e4])
ylim([0 16e5])
xlabel("Range (km)",'Interpreter','latex','FontSize',25)
ylabel("Payload (N)",'Interpreter','latex','FontSize',25)
% Lines
plot([0 R_1],[WPLA WPLA],'Color',"blue",'LineWidth',1.3,'LineStyle','-')
plot([0 R_2],[WPLE WPLE],'Color',"magenta",'LineWidth',1.3,'LineStyle','--')
plot([0 R_3],[WPLF WPLF],'Color',"magenta",'LineWidth',1.3,'LineStyle','--')
plot([0 R_4],[WPLH WPLH],'Color',"magenta",'LineWidth',1.3,'LineStyle','--')
plot([0 R_5],[WPLO WPLO],'Color',"magenta",'LineWidth',1.3,'LineStyle','--')
plot([R_1 R_2],[WPLA WPLE],'Color',"blue",'LineWidth',1.3,'LineStyle','-')
plot([R_2 R_3],[WPLE WPLF],'Color',"blue",'LineWidth',1.3,'LineStyle','-')
plot([R_3 R_4],[WPLF WPLH],'Color',"blue",'LineWidth',1.3,'LineStyle','-')
plot([R_4 R_5],[WPLH WPLO],'Color',"blue",'LineWidth',1.3,'LineStyle','-')
% Text
text(R_1+1000,WPLA+100,'B','Interpreter','latex','FontSize',20)
text(R_2+1000,WPLE+100,'C','Interpreter','latex','FontSize',20)
text(R_3+1000,WPLF+100,'G','Interpreter','latex','FontSize',20)
text(R_4+1000,WPLH+100,'I','Interpreter','latex','FontSize',20)
text(R_5+100,WPLO+50000,'D','Interpreter','latex','FontSize',20)
text(1000,WPLA+50000,'A','Interpreter','latex','FontSize',20)
text(1000,WPLE+50000,'E','Interpreter','latex','FontSize',20)
text(1000,WPLF+50000,'F','Interpreter','latex','FontSize',20)
text(1000,WPLH+50000,'H','Interpreter','latex','FontSize',20)
text(1000,WPLO+50000,'O','Interpreter','latex','FontSize',20)
xticks(0.5e4:0.5e4:6e4)
% Markers
plot(R_1,WPLA,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(R_2,WPLE,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(R_3,WPLF,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(R_4,WPLH,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(R_5,WPLO,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLA,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLE,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLF,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLH,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLO,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
grid on
hold off
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.FontSize = 20;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\6','PR1.pdf');
% exportgraphics(gcf,filename)
%% Plotting Payload v/s Breguet Range
hold on
title("\textbf{Payload v/s Breguet Range Diagram for a Cruise Altitude of 12 km}","Interpreter","latex",'FontSize',30)
xlim([0 4.5e4])
ylim([0 16e5])
xlabel("Range (km)",'Interpreter','latex','FontSize',25)
ylabel("Payload (N)",'Interpreter','latex','FontSize',25)
% Lines
plot([0 R_1_B],[WPLA WPLA],'Color',"blue",'LineWidth',1.3,'LineStyle','-')
plot([0 R_2_B],[WPLE WPLE],'Color',"magenta",'LineWidth',1.3,'LineStyle','--')
plot([0 R_3_B],[WPLF WPLF],'Color',"magenta",'LineWidth',1.3,'LineStyle','--')
plot([0 R_4_B],[WPLH WPLH],'Color',"magenta",'LineWidth',1.3,'LineStyle','--')
plot([0 R_5_B],[WPLO WPLO],'Color',"magenta",'LineWidth',1.3,'LineStyle','--')
plot([R_1_B R_2_B],[WPLA WPLE],'Color',"blue",'LineWidth',1.3,'LineStyle','-')
plot([R_2_B R_3_B],[WPLE WPLF],'Color',"blue",'LineWidth',1.3,'LineStyle','-')
plot([R_3_B R_4_B],[WPLF WPLH],'Color',"blue",'LineWidth',1.3,'LineStyle','-')
plot([R_4_B R_5_B],[WPLH WPLO],'Color',"blue",'LineWidth',1.3,'LineStyle','-')
% Text
text(R_1_B+1000,WPLA+100,'B','Interpreter','latex','FontSize',20)
text(R_2_B+1000,WPLE+100,'C','Interpreter','latex','FontSize',20)
text(R_3_B+1000,WPLF+100,'G','Interpreter','latex','FontSize',20)
text(R_4_B+1000,WPLH+100,'I','Interpreter','latex','FontSize',20)
text(R_5_B+100,WPLO+50000,'D','Interpreter','latex','FontSize',20)
text(1000,WPLA+50000,'A','Interpreter','latex','FontSize',20)
text(1000,WPLE+50000,'E','Interpreter','latex','FontSize',20)
text(1000,WPLF+50000,'F','Interpreter','latex','FontSize',20)
text(1000,WPLH+50000,'H','Interpreter','latex','FontSize',20)
text(1000,WPLO+50000,'O','Interpreter','latex','FontSize',20)
xticks(0.5e4:0.5e4:8e4)
% Markers
plot(R_1_B,WPLA,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(R_2_B,WPLE,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(R_3_B,WPLF,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(R_4_B,WPLH,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(R_5_B,WPLO,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLA,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLE,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLF,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLH,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLO,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
grid on
hold off
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.FontSize = 20;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\6','PR2.pdf');
% exportgraphics(gcf,filename)
%% Combined Plot
hold on
title("\textbf{Combined Payload v/s Range Diagram for a Cruise Altitude of 12 km}","Interpreter","latex",'FontSize',30)
xlim([0 4.5e4])
ylim([0 16e5])
xlabel("Range (km)",'Interpreter','latex','FontSize',25)
ylabel("Payload (N)",'Interpreter','latex','FontSize',25)
% Lines
plot([0 R_1],[WPLA WPLA],'Color',"blue",'LineWidth',1.3,'LineStyle','-')
plot([R_1_B R_2_B],[WPLA WPLE],'Color',"magenta",'LineWidth',1.3,'LineStyle','-')
plot([R_1 R_2],[WPLA WPLE],'Color',"blue",'LineWidth',1.3,'LineStyle','-')
plot([R_2 R_3],[WPLE WPLF],'Color',"blue",'LineWidth',1.3,'LineStyle','-')
plot([R_3 R_4],[WPLF WPLH],'Color',"blue",'LineWidth',1.3,'LineStyle','-')
plot([R_4 R_5],[WPLH WPLO],'Color',"blue",'LineWidth',1.3,'LineStyle','-')
plot([0 R_2],[WPLE WPLE],'Color',"green",'LineWidth',1.3,'LineStyle','--')
plot([0 R_3],[WPLF WPLF],'Color',"green",'LineWidth',1.3,'LineStyle','--')
plot([0 R_4],[WPLH WPLH],'Color',"green",'LineWidth',1.3,'LineStyle','--')
plot([0 R_5],[WPLO WPLO],'Color',"green",'LineWidth',1.3,'LineStyle','--')
% Markers
plot(R_1,WPLA,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(R_2,WPLE,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(R_3,WPLF,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(R_4,WPLH,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(R_5,WPLO,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLA,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLE,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLF,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLH,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLO,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
grid on
% Text
text(R_1+1000,WPLA+50000,'$B_1$','Interpreter','latex','FontSize',20)
text(R_2+1000,WPLE+50000,'$C_1$','Interpreter','latex','FontSize',20)
text(R_3+1000,WPLF+50000,'$G_1$','Interpreter','latex','FontSize',20)
text(R_4+1000,WPLH+50000,'$I_1$','Interpreter','latex','FontSize',20)
text(R_5+100,WPLO+50000,'$D_1$','Interpreter','latex','FontSize',20)

text(1000,WPLA+50000,'A','Interpreter','latex','FontSize',20)
text(1000,WPLE+50000,'E','Interpreter','latex','FontSize',20)
text(1000,WPLF+50000,'F','Interpreter','latex','FontSize',20)
text(1000,WPLH+50000,'H','Interpreter','latex','FontSize',20)
text(1000,WPLO+50000,'O','Interpreter','latex','FontSize',20)

text(R_1_B+1000,WPLA+50000,'$B_2$','Interpreter','latex','FontSize',20)
text(R_2_B+1000,WPLE+50000,'$C_2$','Interpreter','latex','FontSize',20)
text(R_3_B+1000,WPLF+50000,'$G_2$','Interpreter','latex','FontSize',20)
text(R_4_B+1000,WPLH+50000,'$I_2$','Interpreter','latex','FontSize',20)
text(R_5_B+100,WPLO+50000,'$D_2$','Interpreter','latex','FontSize',20)
% Plotting Payload v/s Breguet Range
hold on
% Lines
plot([0 R_1_B],[WPLA WPLA],'Color',"magenta",'LineWidth',1.3,'LineStyle','-')
plot([R_2_B R_3_B],[WPLE WPLF],'Color',"magenta",'LineWidth',1.3,'LineStyle','-')
plot([R_3_B R_4_B],[WPLF WPLH],'Color',"magenta",'LineWidth',1.3,'LineStyle','-')
plot([R_4_B R_5_B],[WPLH WPLO],'Color',"magenta",'LineWidth',1.3,'LineStyle','-')
% Markers
plot(R_1_B,WPLA,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(R_2_B,WPLE,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(R_3_B,WPLF,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(R_4_B,WPLH,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(R_5_B,WPLO,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLA,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLE,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLF,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLH,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
plot(0,WPLO,'Color',"black",'LineWidth',1.5,'LineStyle','-.','Marker','o','MarkerSize',3.5,'MarkerFaceColor','r')
grid on
hold off
xticks(0.5e4:0.5e4:8e4)
set(gcf, 'Position', get(0,'ScreenSize'));
set(gca,'Box','on');
ax = gca;
ax.FontSize = 20;
ax.TickDir = 'out';
ax.TickLength = [0.005 0.005];
leg1 = legend("Range","Breguet Range",'Interpreter','latex','Location','northeast','FontSize',20); 
title(leg1,'Legend')
filename = fullfile('D:\ENGINEERING\2_Second Year\IV SEM\Flight Mechanics\PROJECT\Report\6','CPR.pdf');
% exportgraphics(gcf,filename)