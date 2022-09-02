%% Alumnos:
%{
Juan José Martínez Cámara
Manuel Villar Campo
%}
function [G1,G2,G3]=PR03GR04_Ganancia(f,d12,d32,d31,Ptx_12,Prx_12,Ptx_23,Prx_23,Ptx_13,Prx_13)

%% Cálculo de perdidas de transmision entre los enlaces

L12=10*log10(10^(Ptx_12/10)/10^(Prx_12/10));
L23=10*log10(10^(Ptx_23/10)/10^(Prx_23/10));
L13=10*log10(10^(Ptx_13/10)/10^(Prx_13/10));%dBm->dB

%% Cálculo de perdidas básicas de propagación 

c=3*10^8;
lamda=c/f;
Lb012=20*log10(4*pi*d12/lamda);
Lb023=20*log10(4*pi*d32/lamda);
Lb013=20*log10(4*pi*d31/lamda);
disp("Las perdidas basicas de propagacion en el enlace 1-2 son= "+num2str(Lb012)+"(dB), del enlace 2-3 son = "+num2str(Lb023)+"(dB) y del enlace 1-3 son="+num2str(Lb013)+"(dB)");
%% Cálculo de Ganancias 

G1=(Lb012-Lb023+Lb013-L12+L23-L13)/2;
G2=(Lb012+Lb023-Lb013-L12-L23+L13)/2;
G3=(-Lb012+Lb023+Lb013+L12-L23-L13)/2;
end