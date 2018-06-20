load p22.mag
mmf=p22(:,1);
phi=p22(:,2)/1000.;
clear p22;
plot(mmf,phi,'LineWidth',2.0);
grid on;
title('\bfMagnetization curve for 120/240-V transformer');
xlabel ('\bfMMF, A-turns');
ylabel ('\bfFlux, Wb');