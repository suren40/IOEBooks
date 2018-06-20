% M-file: test_pulse.m
% M-file to calculate the neutral current and harmonic 
% content of a three-phase pulsed current. 

% First, generate the pulsed current in each phase 
% and the neutral as a function of time
phase1 = zeros(1,4096);
phase2 = zeros(1,4096);
phase3 = zeros(1,4096);
phasen = zeros(1,4096);
for ii = 1:4096
   phase1(ii) = 20*pulse(ii*pi/128);
   phase2(ii) = 20*pulse(ii*pi/128-2*pi/3);
   phase3(ii) = 20*pulse(ii*pi/128+2*pi/3);
   phasen(ii) = phase1(ii) + phase2(ii) + phase3(ii);
end

% Here there are 256 samples per 60-Hz cycle, or in other
% words, the dt is 1/(256*60).
time = (1:1:4096)/(256*60);

% Plot the current in Phase A
figure(1)
plot(time,phase1,'Color','k','Linewidth',2.0);
xlabel('\bfTime');
ylabel('\bfCurrent');
title ('\bfCurrent in Phase A');
axis([0 2/60 -21 21])
grid on;

% Plot the current in Phase B
figure(2)
plot(time,phase2,'Color','k','Linewidth',2.0);
xlabel('\bfTime');
ylabel('\bfCurrent');
title ('\bfCurrent in Phase B');
axis([0 2/60 -21 21])
grid on;

% Plot the current in Phase C
figure(3)
plot(time,phase3,'Color','k','Linewidth',2.0);
xlabel('\bfTime');
ylabel('\bfCurrent');
title ('\bfCurrent in Phase C');
axis([0 2/60 -21 21])
grid on;

% Plot the current in the neutral
figure(4)
plot(time,phasen,'Color','k','Linewidth',2.0);
xlabel('\bfTime');
ylabel('\bfCurrent');
title ('\bfCurrent in Neutral');
axis([0 2/60 -21 21])
grid on;

% Calculate rms amplitudes of the currents in the 
% phases and neutral
temp1 = 0;
temp2 = 0;
temp3 = 0;
tempn = 0;
for ii = 1:4096
   temp1 = temp1 + phase1(ii)^2;
   temp2 = temp2 + phase2(ii)^2;
   temp3 = temp3 + phase3(ii)^2;
   tempn = tempn + phasen(ii)^2;
end
rms1 = sqrt(temp1/4096);
rms2 = sqrt(temp2/4096);
rms3 = sqrt(temp3/4096);
rmsn = sqrt(tempn/4096);


% Print out the resulting rms currents
string = ['The rms current in phase a is ' num2str(rms1) '.'];
disp(string);
string = ['The rms current in phase b is ' num2str(rms2) '.'];
disp(string);
string = ['The rms current in phase c is ' num2str(rms3) '.'];
disp(string);
string = ['The rms current in the neutral is ' num2str(rmsn) '.'];
disp(string);

% Now calculate the spectra of the waveform phase and neutral 
% weaveforms
spectrum1 = fft(phase1);
spectrumn = fft(phasen);

% Plot the spectrum of the phase current
scale = (0:1:4095)/16;
figure(5)
plot (scale(1:250),abs(spectrum1(1:250)),'k','LineWidth',2);
xlabel('\bfHarmonic Number');
ylabel('\bfAmplitude');
title ('\bfSpectrum of Current in Phases');

% Plot the spectrum of the neutral current
figure(6)
plot (scale(1:250),abs(spectrumn(1:250)),'k','LineWidth',2);
xlabel('\bfHarmonic Number');
ylabel('\bfAmplitude');
title ('\bfSpectrum of Current in Neutral');
