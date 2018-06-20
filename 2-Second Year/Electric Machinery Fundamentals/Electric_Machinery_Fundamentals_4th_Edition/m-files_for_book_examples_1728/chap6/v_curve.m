% M-file: v_curve.m
% M-file create a plot of armature current versus field 
%   current for the synchronous motor of Example 6-2.

% First, initialize the field current values (21 values
% in the range 3.8-5.8 A)
i_f = (38:1:58) / 10;

% Now initialize all other values
i_a = zeros(1,21);                % Pre-allocate i_a array
x_s = 2.5;                        % Synchronous reactance
v_phase = 208;                    % Phase voltage at 0 degrees
delta1 = -17.5 * pi/180;          % delta 1 in radians
e_a1 = 182 * (cos(delta1) + j * sin(delta1));

% Calculate the armature current for each value
for ii = 1:21
   % Calculate magnitude of e_a2
   e_a2 = 45.5 * i_f(ii); 
   
   % Calculate delta2
   delta2 = asin ( abs(e_a1) / abs(e_a2) * sin(delta1) ); 

   % Calculate the phasor e_a2
   e_a2 = e_a2 * (cos(delta2) + j * sin(delta2));

   % Calculate i_a
   i_a(ii) = ( v_phase - e_a2 ) / ( j * x_s);
end

% Plot the v-curve
figure(1)
plot(i_f,abs(i_a),'Color','k','Linewidth',2.0);
xlabel('Field current (A)','FontSize',12);
ylabel('Armature current (A)','FontSize',12);
title ('Synchronous motor V-curve','Fontweight','Bold','FontSize',14);
grid on;