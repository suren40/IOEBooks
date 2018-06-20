function volts = halfwave(wt)
% Function to simulate the output of a half-wave rectifier.
%   wt = Phase in radians (=omega x time)

% Convert input to the range 0 <= wt < 2*pi
while wt >= 2*pi
   wt = wt - 2*pi;
end
while wt < 0
   wt = wt + 2*pi;
end

% Simulate the output of the half-wave rectifier
if wt >= 0 & wt <= pi
   volts = sin(wt);
else
   volts = 0;
end
