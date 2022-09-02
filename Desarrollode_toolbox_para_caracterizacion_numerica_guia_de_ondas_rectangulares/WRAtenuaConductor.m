function alpha = WRAtenuaConductor(f, a, b, sigma, epsr)
%WRATENUACONDUCTOR proprociona la atenuación (Np/m) que sufre
%el modo fundamental (TE10) de una guía rectangular de geometría
%conocida a cierta frecuencia a causa de la conductividad finita
%de las paredes metálicas de la guía.
%
% Uso:
% alpha = WRAtenuaConductor(f, a, b, sigma,epsr)
% alpha = WRAtenuaConductor(f, a, b, sigma)
%
% Parámetros de entrada:
% f = frecuencia de operación (en Hz)
% a = cara ancha (situada sobre el eje x) de la guía (en m)
% b = cara estrecha de la guía (en m)
% sigma = conductividad del conductor (en S/m)
% epsr = permitividad relativa del dieléctrico de la guía (se
% tomará 1.0 si no se indica nada)
%
% Parámetros de salida:
% alpha = constante de atenuación debida al conductor (en Nep/m).
%
% Autores: Villar Campos, Manuel / Martínez Cámara, Juan José
% Fecha: xx/xx/14 ver x.x
if exist('epsr')==0
    epsr = 1;
end
fc = WRFrecCorte("TE", 1, 0, a, b, epsr);
if f >fc
    mu0 = 4*pi*10^-7;
    eta0 = 120*pi;
    delta_p = 1/sqrt(pi*mu0*f*sigma);
    alpha = (1/(eta0*sigma*delta_p)) * (((fc/f)^2 + a/(2*b)) / ((a/2)*sqrt(1-(fc/f)^2)));
else 
    error("la frec es inferior a la de corte");
end
end
