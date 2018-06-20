% M-file: trans_vr.m
% M-file to calculate and plot the voltage regulation 
% of a transformer as a function of load for power 
% factors of 0.8 lagging, 1.0, and 0.8 leading.
VS = 230;                   % Secondary voltage (V)
amps = 0:6.52:65.2;         % Current values (A)
Req = 0.0445;               % Equivalent R (ohms)
Xeq = 0.0645;               % Equivalent X (ohms)

% Calculate the current values for the three
% power factors.  The first row of I contains
% the lagging currents, the second row contains
% the unity currents, and the third row contains
% the leading currents.
I(1,:) = amps .* ( 0.8 - j*0.6);  % Lagging
I(2,:) = amps .* ( 1.0        );  % Unity
I(3,:) = amps .* ( 0.8 + j*0.6);  % Leading

% Calculate VP/a.
VPa = VS + Req.*I + j.*Xeq.*I;

% Calculate voltage regulation
VR = (abs(VPa) - VS) ./ VS .* 100;

% Plot the voltage regulation
plot(amps,VR(1,:),'b-','LineWidth',2.0);
hold on;
plot(amps,VR(2,:),'k--','LineWidth',2.0);
plot(amps,VR(3,:),'r-.','LineWidth',2.0);
title ('\bfVoltage Regulation Versus Load');
xlabel ('\bfLoad (A)');
ylabel ('\bfVoltage Regulation (%)');
legend('0.8 PF lagging','1.0 PF','0.8 PF leading');
grid on;
hold off;

