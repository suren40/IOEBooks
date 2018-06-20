% M-file: mag_current.m
% M-file to calculate and plot the magnetization 
% current of a 230/115 transformer operating at 
% 230 volts and 50/60 Hz.  This program also 
% calculates the rms value of the mag. current.

% Load the magnetization curve.  It is in two 
% columns, with the first column being mmf and
% the second column being flux. 
load mag_curve_1.dat;
mmf_data = mag_curve_1(:,1);
flux_data = mag_curve_1(:,2);

% Initialize values
VM = 325;                   % Maximum voltage (V)
NP = 850;                   % Primary turns
VM = 230;                   % Maximum voltage (V)
NP = 600;                   % Primary turns

% Calculate angular velocity for 60 Hz
freq = 60;                  % Freq (Hz)
w = 2 * pi * freq;

% Calculate flux versus time
time = 0:1/3000:1/30;       % 0 to 1/30 sec
flux = -VM/(w*NP) * cos(w .* time);

% Calculate the mmf corresponding to a given flux
% using the 's interpolation function.
mmf = interp1(flux_data,mmf_data,flux);

% Calculate the magnetization current
im = mmf / NP;

% Calculate the rms value of the current
irms = sqrt(sum(im.^2)/length(im));
disp(['The rms current at 60 Hz is ', num2str(irms)]);

% Plot the magnetization current.
figure(1)
subplot(2,1,1);
plot(time,im);
title ('\bfMagnetization current at 60 Hz');
xlabel ('\bfTime (s)');
ylabel ('\bf\itI_{m} \rm(A)');
axis([0 0.04 -2 2]);
grid on;

% Calculate angular velocity for 50 Hz
freq = 50;                  % Freq (Hz)
w = 2 * pi * freq;

% Calculate flux versus time
time = 0:1/2500:1/25;       % 0 to 1/25 sec
flux = -VM/(w*NP) * cos(w .* time);

% Calculate the mmf corresponding to a given flux
% using the 's interpolation function.
mmf = interp1(flux_data,mmf_data,flux);

% Calculate the magnetization current
im = mmf / NP;

% Calculate the rms value of the current
irms = sqrt(sum(im.^2)/length(im));
disp(['The rms current at 50 Hz is ', num2str(irms)]);

% Plot the magnetization current.
subplot(2,1,2);
plot(time,im);
title ('\bfMagnetization current at 50 Hz');
xlabel ('\bfTime (s)');
ylabel ('\bf\itI_{m} \rm(A)');
axis([0 0.04 -2 2]);
grid on;

