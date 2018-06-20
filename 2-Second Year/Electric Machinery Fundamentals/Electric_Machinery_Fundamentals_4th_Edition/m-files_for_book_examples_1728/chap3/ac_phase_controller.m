function volts = ac_phase_controller(wt,deg)
% Function to simulate the output of the positive half 
% cycle of an ac phase angle controller with a peak 
% voltage of 120 * SQRT(2) = 170 V.
%   wt  = Phase in radians (=omega x time)
%   deg = Firing angle in degrees

% Degrees to radians conversion factor
deg2rad = pi / 180;

% Simulate the output of the phase angle controller.
if wt > deg * deg2rad;
   volts = 170 * sin(wt);
else
   volts = 0;
end
