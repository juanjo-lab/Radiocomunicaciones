function [lambda, beta] = WRLongOnda(tipo, m, n, f, a, b, epsr)
%WRLONGONDA Determina la longitud de onda y la constante de fase a una
%determinada y frecuencia y para un modo dado, conocida la geometría
%de la guía rectangular
%
% Uso:
% [lambda, beta] = WRLongOnda(tipo, m, n, f, a, b, epsr)
% [lambda, beta] = WRLongOnda(tipo, m, n, f, a, b)
% lambda = WRLongOnda(tipo, m, n, f, a, b, epsr)
% lambda = WRLongOnda(tipo, m, n, f, a, b)
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
% lambda = longitud de onda (en m).
% beta = constante de fase (en rad/m).
%
%  Autores: Villar Campos, Manuel / Martínez Cámara, Juan José
%  Fecha: 20/02/21 ver 19.26
if exist('epsr')==0
    epsr = 1;
%    warning("la permitividad relativa del dieléctrico se ha cogido por defecto 1 de la guía");
end
fc = WRFrecCorte(tipo, m, n, a, b, epsr);
if f<fc
    warning("la frecuencia de operacion es menor a la de corte");
    beta = 0;
    lambda = Nan;
else
c = 3*10^8;
fc = WRFrecCorte(tipo, m, n, a, b, epsr);
c = c/sqrt(epsr);
lambdaTEM = c/f;
lambda = lambdaTEM/sqrt(1-(fc/f)^2);
beta = 2*pi/lambda;
end