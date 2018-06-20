function volts = pulse(wt)
% Function to simulate the output of a half-wave rectifier.
%   wt = Phase in radians (=omega x time)

% Convert input to the range 0 <= wt < 2*pi
while wt >= 2*pi
   wt = wt - 2*pi;
end
while wt < 0
   wt = wt + 2*pi;
end

% Simulate the output of the line
if wt >= pi/4 & wt <= 3*pi/4
   volts = sin(2*(wt-pi/4));
elseif wt >= 5*pi/4 & wt <= 7*pi/4
   volts = -sin(2*(wt-5*pi/4));
else
   volts = 0;
end
