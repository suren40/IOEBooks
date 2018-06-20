% M-file: ex1_10.m
% M-file to calculate and plot the velocity of 
% a linear motor as a function of load.
VB = 120;                   % Battery voltage (V)
r = 0.3;                    % Resistance (ohms)
l = 1;                      % Bar length (m)
B = 0.6;                    % Flux density (T)

% Select the forces to apply to the bar
F = 0:10:50;                % Force (N)

% Calculate the currents flowing in the motor.
i = F ./ (l * B);           % Current (A)

% Calculate the induced voltages on the bar.
eind = VB - i .* r;         % Induced voltage (V)

% Calculate the velocities of the bar.
v_bar = eind ./ (l * B);    % Velocity (m/s)

% Plot the velocity of the bar versus force.
plot(F,v_bar,'LineWidth',2.0);
title ('\bfPlot of velocity versus applied force');
xlabel ('\bfForce (N)');
ylabel ('\bfVelocity (m/s)');
axis ([0 50 0 200]);
grid on;