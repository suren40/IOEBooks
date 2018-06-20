% M-file: term_char_a.m
% M-file to plot the terminal characteristics of the 
%   generator of Example 5-4 with an 0.8 PF leading load.

% First, initialize the current amplitudes (21 values 
% in the range 0-60 A)
i_a = (0:1:20) * 3;

% Now initialize all other values
v_phase = zeros(1,21);
e_a = 277.0;
x_s = 1.0;
theta = 36.87 * (pi/180);   % Converted to radians

% Now calculate v_phase for each current level
for ii = 1:21
   v_phase(ii) = sqrt(e_a^2 - (x_s * i_a(ii) * cos(theta))^2) ...
                            + (x_s * i_a(ii) * sin(theta));
end

% Calculate terminal voltage from the phase voltage
v_t = v_phase * sqrt(3);

% Plot the terminal characteristic, remembering the 
% the line current is the same as i_a
plot(i_a,v_t,'Color','k','Linewidth',3.0);
xlabel('\bfLine Current (A)');
ylabel('\bfTerminal voltage (V)');
title ('\bfTerminal characteristic for 0.8 PF lagging load');
grid on;
axis([0 60 400 550]);
