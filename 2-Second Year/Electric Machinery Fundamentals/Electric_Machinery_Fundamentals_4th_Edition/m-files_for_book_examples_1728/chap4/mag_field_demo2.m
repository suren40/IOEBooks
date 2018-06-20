% M-file: mag_field_demo2.m
% M-file to calculate the net magetic field produced 
% by a three-phase stator after the current in two
% phases has been reversed.

% Set up the basic conditions
bmax = 1;                % Normalize bmax to 1
freq = 60;               % 60 Hz
w = 2*pi*freq;           % angluar velocity (rad/s)

% First, generate the three component magnetic fields
t = 0:1/12000:1/15;
Baa = sin(w*t) .* (cos(0) + j*sin(0));
Bbb = sin(w*t+2*pi/3) .* (cos(2*pi/3) + j*sin(2*pi/3));
Bcc = sin(w*t-2*pi/3) .* (cos(-2*pi/3) + j*sin(-2*pi/3));

% Calculate Bnet
Bnet = Baa + Bbb + Bcc;

% Calculate a circle representing the expected maximum 
% value of Bnet
circle = 1.5 * (cos(w*t) + j*sin(w*t));

% Plot the reference circle
plot(circle,'k','LineWidth',2.0);
figure(1);
hold on;

% Plot the reference vectors for the B-field components
Baa_ref = 1.5 .* (cos(0) + j*sin(0));
Bbb_ref = 1.5 .* (cos(2*pi/3) + j*sin(2*pi/3));
Bcc_ref = 1.5 .* (cos(-2*pi/3) + j*sin(-2*pi/3));

line('XData',[0 real(Baa_ref)], ...
     'YData',[0 imag(Baa_ref)], ...
     'Color','k','LineStyle',':','EraseMode','xor');
line('XData',[0 real(Bbb_ref)], ...
     'YData',[0 imag(Bbb_ref)], ...
     'Color','k','LineStyle',':','EraseMode','xor');
line('XData',[0 real(Bcc_ref)], ...
     'YData',[0 imag(Bcc_ref)], ...
     'Color','k','LineStyle',':','EraseMode','xor');

% Add magnetic field annotations
text (1.6 * cos(0),             1.6 * sin(0),            '\bfB_{aa}');
text (1.6 * cos(2*pi/3)  - 0.2, 1.6 * sin(2*pi/3) + 0.1, '\bfB_{bb}');
text (1.6 * cos(-2*pi/3) - 0.2, 1.6 * sin(-2*pi/3),      '\bfB_{cc}');

% Plot the initial positions of the magnetic vector lines.  
% Note that Baa is black, Bbb is blue, Bcc is magneta, 
% and Bnet is red.
ii = 1;
h1=line('XData',[0 real(Baa(ii))], ...
        'YData',[0 imag(Baa(ii))], ...
        'Color','k','EraseMode','xor', ...
        'Linewidth',2.0);
hold on;
h2=line('XData',[0 real(Bbb(ii))], ...
        'YData',[0 imag(Bbb(ii))], ...
        'Color','b','EraseMode','xor', ...
        'Linewidth',2.0);
h3=line('XData',[0 real(Bcc(ii))], ...
        'YData',[0 imag(Bcc(ii))], ...
        'Color','m','EraseMode','xor', ...
        'Linewidth',2.0);
h4=line('XData',[0 real(Bnet(ii))], ...
        'YData',[0 imag(Bnet(ii))], ...
        'Color','r','EraseMode','xor', ...
        'Linewidth',2.0);

   
% Labels and annotations
title ('\bfRotating Magnetic Field with Phase B & C Currents Swapped');
xlabel('\bfFlux Density (T)');
ylabel('\bfFlux Density (T)');
axis square;
axis([-2 2 -2 2]);

% Now update the lines as a function of time.
for ii = 1:length(t)

   set(h1,'XData',[0 real(Baa(ii))]);
   set(h1,'YData',[0 imag(Baa(ii))]);
   set(h2,'XData',[0 real(Bbb(ii))]);
   set(h2,'YData',[0 imag(Bbb(ii))]);
   set(h3,'XData',[0 real(Bcc(ii))]);
   set(h3,'YData',[0 imag(Bcc(ii))]);
   set(h4,'XData',[0 real(Bnet(ii))]);
   set(h4,'YData',[0 imag(Bnet(ii))]);
   drawnow;

end
hold off;