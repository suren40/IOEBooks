% M-file: torque_speed_2.m
% M-file create and plot of the torque-speed curve of an 
%   induction motor with a double-cage rotor design. 

% First, initialize the values needed in this program.
r1 = 0.641;                 % Stator resistance
x1 = 0.750;                 % Stator reactance
r2 = 0.300;                 % Rotor resistance for single-
                            %   cage motor
r2i = 0.400;                % Rotor resistance for inner 
                            %   cage of double-cage motor
r2o = 3.200;                % Rotor resistance for outer 
                            %   cage of double-cage motor
x2 = 0.500;                 % Rotor reactance for single-
                            %   cage motor
x2i = 3.300;                % Rotor reactance for inner 
                            %   cage of double-cage motor
x2o = 0.500;                % Rotor reactance for outer 
                            %   cage of double-cage motor
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

% Now calculate the motor speed for many slips between
% 0 and 1.  Note that the first slip value is set to
% 0.001 instead of exactly 0 to avoid divide-by-zero
% problems.
s = (0:1:50) / 50;           % Slip
s(1) = 0.001;                % Aviod division-by-zero
nm = (1 - s) * n_sync;       % Mechanical speed

% Calculate torque for the single-cage rotor. 
for ii = 1:51
   t_ind1(ii) = (3 * v_th^2 * r2 / s(ii)) / ...
            (w_sync * ((r_th + r2/s(ii))^2 + (x_th + x2)^2) );
end

% Calculate resistance and reactance of the double-cage 
% rotor at this slip, and then use those values to 
% calculate the induced torque.  
for ii = 1:51
   y_r = 1/(r2i + j*s(ii)*x2i) + 1/(r2o + j*s(ii)*x2o);
   z_r = 1/y_r;            % Effective rotor impedance
   r2eff = real(z_r);      % Effective rotor resistance
   x2eff = imag(z_r);      % Effective rotor reactance

   % Calculate induced torque for double-cage rotor.
   t_ind2(ii) = (3 * v_th^2 * r2eff / s(ii)) / ...
            (w_sync * ((r_th + r2eff/s(ii))^2 + (x_th + x2eff)^2) );
end

% Plot the torque-speed curves
plot(nm,t_ind1,'Color','k','LineWidth',2.0);
hold on;
plot(nm,t_ind2,'Color','k','LineWidth',2.0,'LineStyle','-.');
xlabel('\itn_{m}','FontSize',12);
ylabel('\tau_{ind}','FontSize',12);
title ('Induction motor torque-speed characteristics','FontSize',12);
legend ('Single-cage design','Double-cage design');
grid on;
hold off;