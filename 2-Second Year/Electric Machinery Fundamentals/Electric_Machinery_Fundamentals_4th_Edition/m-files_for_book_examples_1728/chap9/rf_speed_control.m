% M-file: rf_speed_control.m
% M-file create a plot of the speed of a shunt dc
%   motor as a function of field resistance, assuming
%   a constant armature current (Example 9-3). 

% Get the magnetization curve.  This file contains the
% three variables if_value, ea_value, and n_0.
load fig9_9.mat

% First, initialize the values needed in this program.
v_t = 250;              % Terminal voltage (V)
r_f = 40:1:70;          % Field resistance (ohms)
r_a = 0.03;             % Armature resistance (ohms)
i_a = 120;              % Armature currents (A)

% The approach here is to calculate the e_a0 at the 
% reference field current, and then to calculate the
% e_a0 for every field current.  The reference speed is
% 1103 r/min, so by knowing the the e_a0 and reference
% speed, we will be able to calculate the speed at the
% other field current. 

% Calculate the internal generated voltage at 1200 r/min
% for the reference field current (5 A) by interpolating 
% the motor's magnetization curve.  The reference speed
% corresponding to this field current is 1103 r/min.
e_a0_ref = interp1(if_values,ea_values,5,'spline');
n_ref = 1103;           

% Calculate the field current for each value of field 
% resistance.
i_f = v_t ./ r_f;

% Calculate the E_a0 for each field current by 
% interpolating the motor's magnetization curve.
e_a0 = interp1(if_values,ea_values,i_f,'spline');

% Calculate the resulting speed from Equation (9-17):
% n2 = (phi1 / phi2) * n1 = (e_a0_1 / e_a0_2 ) * n1
n2 = ( e_a0_ref ./ e_a0 ) * n_ref;

% Plot the speed versus r_f curve.
plot(r_f,n2,'Color','k','LineWidth',2.0);
hold on;
xlabel('Field resistance, \Omega','Fontweight','Bold');
ylabel('\itn_{m} \rm\bf(r/min)','Fontweight','Bold');
title ('Speed vs \itR_{F} \rm\bf for a Shunt DC Motor', ...
       'Fontweight','Bold');
axis([40 70 0 1400]);
grid on;
hold off;
