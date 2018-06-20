% M-file: torque_speed_curve.m
% M-file create a plot of the torque-speed curve of the 
%   induction motor of Example 7-5. 

% First, initialize the values needed in this program.
r1 = 0.641;                 % Stator resistance
x1 = 1.106;                 % Stator reactance
r2 = 0.332;                 % Rotor resistance
x2 = 0.464;                 % Rotor reactance
xm = 26.3;                  % Magnetization branch reactance
v_phase = 460 / sqrt(3);    % Phase voltage
n_sync = 1800;              % Synchronous speed (r/min)
w_sync = 188.5;             % Synchronous speed (rad/s)

% Calculate the Thevenin voltage and impedance from Equations
% 7-41a and 7-43.
v_th = v_phase * ( xm / sqrt(r1^2 + (x1 + xm)^2) );
z_th = ((j*xm) * (r1 + j*x1)) / (r1 + j*(x1 + xm));
r_th = real(z_th);
x_th = imag(z_th);

% Now calculate the torque-speed characteristic for many
% slips between 0 and 1.  Note that the first slip value 
% is set to 0.001 instead of exactly 0 to avoid divide-
% by-zero problems.
s = (0:1:50) / 50;           % Slip
s(1) = 0.001;
nm = (1 - s) * n_sync;       % Mechanical speed

% Calculate torque for original rotor resistance
for ii = 1:51
   t_ind1(ii) = (3 * v_th^2 * r2 / s(ii)) / ...
            (w_sync * ((r_th + r2/s(ii))^2 + (x_th + x2)^2) );
end

% Calculate torque for doubled rotor resistance
for ii = 1:51
   t_ind2(ii) = (3 * v_th^2 * (2*r2) / s(ii)) / ...
            (w_sync * ((r_th + (2*r2)/s(ii))^2 + (x_th + x2)^2) );
end

% Plot the torque-speed curve
plot(nm,t_ind1,'Color','k','LineWidth',3.0);
hold on;
plot(nm,t_ind2,'Color','k','LineWidth',3.0,'LineStyle','-.');
xlabel('\itn_{m}','FontSize',12);
ylabel('\tau_{ind}','FontSize',12);
title ('Induction motor torque-speed characteristic','FontSize',12);
legend ('Original R_{2}','Doubled R_{2}');
grid on;
hold off;