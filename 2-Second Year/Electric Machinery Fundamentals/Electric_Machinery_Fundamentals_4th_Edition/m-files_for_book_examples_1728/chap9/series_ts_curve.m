% M-file: series_ts_curve.m
% M-file create a plot of the torque-speed curve of the 
%   the series dc motor with armature reaction in
%   Example 9-5. 

% Get the magnetization curve.  This file contains the
% three variables mmf_value, ea_value, and n_0.
load fig9_22.mat

% First, initialize the values needed in this program.
v_t = 250;              % Terminal voltage (V)
r_a = 0.08;             % Armature + field resistance (ohms)
i_a = 10:10:300;        % Armature (line) currents (A)
n_s = 25;               % Number of series turns on field 

% Calculate the MMF for each load
f = n_s * i_a;

% Calculate the internal generated voltage e_a.
e_a = v_t - i_a * r_a;

% Calculate the resulting internal generated voltage at
% 1200 r/min by interpolating the motor's magnetization
% curve.
e_a0 = interp1(mmf_values,ea_values,f,'spline');

% Calculate the motor's speed from Equation (9-13).
n = (e_a ./ e_a0) * n_0;

% Calculate the induced torque corresponding to each
% speed from Equations (8-55) and (8-56).
t_ind = e_a .* i_a ./ (n * 2 * pi / 60);

% Plot the torque-speed curve
plot(t_ind,n,'Color','k','LineWidth',2.0);
hold on;
xlabel('\tau_{ind} (N-m)','Fontweight','Bold');
ylabel('\itn_{m} \rm\bf(r/min)','Fontweight','Bold');
title ('Series DC Motor Torque-Speed Characteristic', ...
       'Fontweight','Bold');
axis([ 0 700 0 5000]);
grid on;
hold off;
