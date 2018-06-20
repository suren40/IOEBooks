% M-file: shunt_ts_curve.m
% M-file create a plot of the torque-speed curve of the 
%   the shunt dc motor with armature reaction in
%   Example 9-2. 

% Get the magnetization curve.  This file contains the
% three variables if_value, ea_value, and n_0.
load fig9_9.mat

% First, initialize the values needed in this program.
v_t = 250;              % Terminal voltage (V)
r_f = 50;               % Field resistance (ohms)
r_a = 0.06;             % Armature resistance (ohms)
i_l = 10:10:300;        % Line currents (A)
n_f = 1200;             % Number of turns on field 
f_ar0 = 840;            % Armature reaction @ 200 A (A-t/m)

% Calculate the armature current for each load.
i_a = i_l - v_t / r_f;

% Now calculate the internal generated voltage for
% each armature current.
e_a = v_t - i_a * r_a;

% Calculate the armature reaction MMF for each armature
% current.
f_ar = (i_a / 200) * f_ar0;

% Calculate the effective field current.
i_f = v_t / r_f - f_ar / n_f;

% Calculate the resulting internal generated voltage at
% 1200 r/min by interpolating the motor's magnetization
% curve.
e_a0 = interp1(if_values,ea_values,i_f,'spline');

% Calculate the resulting speed from Equation (9-13).
n = ( e_a ./ e_a0 ) * n_0;

% Calculate the induced torque corresponding to each
% speed from Equations (8-55) and (8-56).
t_ind = e_a .* i_a ./ (n * 2 * pi / 60);

% Plot the torque-speed curve
plot(t_ind,n,'Color','k','LineWidth',2.0);
hold on;
xlabel('\tau_{ind} (N-m)');
ylabel('\itn_{m} \rm\bf(r/min)');
title ('\bfShunt DC motor torque-speed characteristic');
axis([ 0 600 1100 1300]);
grid on;
hold off;
