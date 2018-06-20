% M-file: test_halfwave.m
% M-file to calculate the ripple on the output of a half-wave
% rectifier.

% First, generate the output of a half-wave rectifier
waveform = zeros(1,128);
for ii = 1:128
   waveform(ii) = halfwave(ii*pi/64);
end

% Now calculate the ripple factor
r = ripple(waveform);

% Print out the result
string = ['The ripple is ' num2str(r) '%.'];
disp(string);
