function [alpha,beta,lambda]=WRAtenuaDielectrico(f,a,b,epsr,tand)
%WRATENUADIELECTRICO proprociona la atenuación (Np/m) que sufre
%el modo fundamental (TE10) de una guía rectangular de geometría
%conocida a cierta frecuencia a causa de las pérdidas en el
%dieléctrico
%
% Uso:
% alpha = WRAtenuaDielectrico(f, a, b, epsr, tand)
% [alpha, beta] = WRAtenuaDielectrico(f, a, b, epsr, tand)
% [alpha, beta, lambda] = WRAtenuaDielectrico(f, a, b, epsr, tand)
%
% Parámetros de entrada:
% f = frecuencia de operación (en Hz)
% a = cara ancha (situada sobre el eje x) de la guía (en m)
% b = cara estrecha de la guía (en m)
% epsr = permitividad relativa del dieléctrico de la guía
% tand = tangente de pérdidas dieléctrica
%
% Parámetros de salida:
% alpha = constante de atenuación (dieléctrica) (en Nep/m)
% beta = constante de fase (en rad/m)
% lambda = longitud de onda (en m).
%
% Autores: Villar Campos, Manuel / Martínez Cámara, Juan José
% Fecha: xx/xx/14 ver x.x
if exist('epsr')==0
    epsr = 1;
end
m=1 ;n = 0;
fc = WRFrecCorte("TE", m, n, a, b, epsr);
c = 3*10^8;
mu0 = 4*pi*10^-7;
e0 = 1/(mu0*c^2);
gamma0_2 = -((2*pi*f)^2)*mu0*e0*epsr*(1-tand*1i);
gammac_2 = -((m*pi/a)^2 + (n*pi/b)^2);
gamma = sqrt(gamma0_2-gammac_2);
alpha = real(gamma);
beta = imag(gamma);
lambda = 2*pi/beta;
if f<fc
    % alpha baja y beta inf 
    warning("la frecuencia de operacion es inferior  ala de corte, con lo cual nos encontramos con atenuacion total y no hay propagación");
else
    warning("Nos encontramos en propagación");
end
    
end
    