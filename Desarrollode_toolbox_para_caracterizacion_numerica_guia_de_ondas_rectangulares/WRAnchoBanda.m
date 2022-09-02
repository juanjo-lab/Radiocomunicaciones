function [BW, finf, fsup, modsup] = WRAnchoBanda(a,b,epsr)
%WRANCHOBANDA determina el ancho de banda monomodo (modo fundamental)
%de una guía de onda rectangular ideal conocida la geometría.
%
% Usos:
% [BW, finf, fsup, modsup ] = WRAnchoBanda(a,b,epsr)
% [BW, finf, fsup, modsup ] = WRAnchoBanda(a,b)
%
%
% Parámetros de entrada:
% a = cara ancha (situada sobre el eje x) de la guía (en m)
% b = cara estrecha de la guía (en m)
% epsr = permitividad relativa del dieléctrico de la guía (se tomará
% 1.0 si no se indica nada)
%
% Parámetros de salida:
% BW = Ancho de banda monomodo (Hz) (para el modo fundamental
% TE m=1,n=0)
% finf = frecuencia inferior de la banda de propagación monomodo
% (Hz)
% fsup = frecuencia superior de la banda de propagación monomodo
% (Hz)
% modsup = string (o cell de string) especificando el primer modo
% superior
%
%
% Ejemplos de uso:
% [BW, finf, fsup, modsup] = WRAnchoBanda(3e-3,2e-3,1.5)
% BW = WRAnchoBanda(3e-3,1.5e-3)
%
% Autores: Villar Campos, Manuel / Martínez Cámara, Juan José
% Fecha: xx/xx/14 ver x.x
if exist('epsr')==0
    epsr = 1;
end
finf = WRFrecCorte("TE", 1, 0, a, b, epsr);

f_20 = WRFrecCorte("TE", 2, 0, a, b, epsr);
f_01 = WRFrecCorte("TE", 0, 1, a, b, epsr);

if f_20<f_01
    fsup = f_20;
    modsup = "TE_20";
elseif f_01<f_20
    fsup = f_01;
    modsup = "TE_01";
elseif f_01 == f_20
    fsup = f_01;
    modsup = "TE_01=TE_20";
end
BW = fsup-finf;
end
