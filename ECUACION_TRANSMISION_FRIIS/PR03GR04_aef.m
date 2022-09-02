%% Alumnos:
%{
Juan José Martínez Cámara
Manuel Villar Campo
%}
function [Aef1,Aef2,Aef3]=PR03GR04_aef(G1,G2,G3,f)
%% Conversion de dBi a escalar
D1=10^(G1/10);
D2=10^(G2/10);
D3=10^(G3/10);

%% Calculo de lamda
c=3*10^8;
lamba=(c/f);

%% Cálculo del Área efectiva

Aef1=(((lamba^2)*D1)/(4*pi))*10^4;
Aef2=(((lamba^2)*D2)/(4*pi))*10^4;
Aef3=(((lamba^2)*D3)/(4*pi))*10^4;

end