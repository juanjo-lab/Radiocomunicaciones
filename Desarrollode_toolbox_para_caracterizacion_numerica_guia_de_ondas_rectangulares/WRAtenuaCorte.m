function alpha = WRAtenuaCorte(tipo, m, n, f, a, b, epsr)
%WRATENUACORTE Determina la constante de atenuación para un modo
%en corte y a una determinada frecuencia, conocida la geometría
%de la guía rectangular
%
% Uso:
% alpha = WRAtenuaCorte(tipo, m, n, f, a, b, epsr)
% alpha = WRAtenuaCorte(tipo, m, n, f, a, b)
%
% Parámetros de entrada:
% tipo = puede ser 'TE' ó 'TM'
% m = índice del modo para la variable x
% n = índice del modo para la variable y
% f = frecuencia de operación (en Hz)
% a = cara ancha (situada sobre el eje x) de la guía (en m)
% b = cara estrecha de la guía (en m)
% epsr = permitividad relativa del dieléctrico de la guía (se tomará
% 1.0 si no se indica nada)
%
% Parámetros de salida:
% alpha = constante de atenuación (en Nep/m).
%
% Autores: Villar Campos, Manuel / Martínez Cámara, Juan José
% Fecha: xx/xx/14 ver x.x
if exist('epsr')==0
    epsr = 1;
end
fc = WRFrecCorte(tipo, m, n, a, b, epsr);
c = 3*10^8;
gammac_2 = -((m*pi/a)^2 + (n*pi/b)^2);
if f<fc
    alpha = sqrt(-gammac_2)*sqrt(1-(f/fc)^2);
else
    warning("la frecuencia de operacion es mayor a la de corte, trabaja en modo propagacion");
    alpha = 0;
end    