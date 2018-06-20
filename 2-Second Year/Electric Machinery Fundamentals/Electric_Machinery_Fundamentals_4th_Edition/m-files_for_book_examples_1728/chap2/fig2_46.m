load fig2_46.mag
mmf=fig2_46(:,1);
phi=fig2_46(:,2);
clear fig2_46;
Hndl=plot(mmf,phi,'LineWidth',2.0);
grid on;
title('\bfMagnetization curve for 230-115-V transformer');
xlabel ('\bfMMF, A-turns');
ylabel ('\bfFlux, Wb');
