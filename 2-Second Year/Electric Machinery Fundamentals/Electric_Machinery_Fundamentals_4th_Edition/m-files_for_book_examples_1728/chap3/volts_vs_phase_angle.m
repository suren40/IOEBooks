% M-file: volts_vs_phase_angle.m
% M-file to calculate the rms voltage applied to a load as
% a function of the phase angle firing circuit, and to
% plot the resulting relationship.

% Loop over all firing angles (1 to 179 degrees)
deg = zeros(1,179);
rms = zeros(1,179);
for ii = 1:179

   % Save firing angle
   deg(ii) = ii;

   % First, generate the waveform to analyze.
   waveform = zeros(1,180);
   for jj = 1:180
      waveform(jj) = ac_phase_controller(jj*pi/180,ii);
   end

   % Now calculate the rms voltage of the waveform
   temp = sum(waveform.^2);
   rms(ii) = sqrt(temp/180);

end

% Plot rms voltage of the load as a function of firing angle
plot(deg,rms,'LineWidth',2);
title('\bfLoad Voltage vs. Firing Angle');
xlabel('\bfFiring angle (deg)');
ylabel('\bfRMS voltage (V)');
grid on;

