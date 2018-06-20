function r = ripple(waveform)
% Function to calculate the ripple on an input waveform.

% Calculate the average value of the waveform
nvals = size(waveform,2);
temp = 0;
for ii = 1:nvals
   temp = temp + waveform(ii);
end
average = temp/nvals;

% Calculate rms value of waveform
temp = 0;
for ii = 1:nvals
   temp = temp + waveform(ii)^2;
end
rms = sqrt(temp/nvals);

% Calculate ripple factor
r = sqrt((rms / average)^2 - 1) * 100;

