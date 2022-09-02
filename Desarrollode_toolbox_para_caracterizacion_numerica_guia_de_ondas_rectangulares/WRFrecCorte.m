function fc = WRFrecCorte(tipo, m, n, a, b, epsr)
%WRFRECCORTE Proporciona la frecuencia de corte de un modo dado en una
%guía rectangular ideal.
%
% Uso:
% fc = WRFrecCorte(tipo, m, n, a, b, epsr)
% fc = WRFrecCorte(tipo, m, n, a, b)
%
% Variables de entrada:
% tipo = puede ser 'TE' ó 'TM'
% m = índice del modo para la variable x
% n = índice del modo para la variable y
% a = cara ancha (situada sobre el eje x) de la guía (en m)
% b = cara estrecha de la guía (en m)
% epsr = permitividad relativa del dieléctrico de la guía (se tomará
% 1.0 si no se indica nada)
%
% Variables de salida:
% fc = frecuencia de corte del modo indicado (en Hz).
%
% Ejemplos de uso:
% fc = WRFrecCorte('TE', 1, 0, 3e-3, 1.5e-3, 1.20)
% fc = WRFrecCorte('TM', 1, 1, 2e-2, 1.5e-2)
%
% Autores: Villar Campos, Manuel / Martínez Cámara, Juan José
% Fecha: 20/02/21 ver 19.26

c=3*10^8;

if exist('epsr')==0
    epsr = 1;
end
if strcmp(tipo,'TM') || strcmp(tipo,'TE') == 1%strcmp compara el primer con el segundo string, devuelve 1 si es true
else 
    error("no se han introducido los modos disponibles");  
end
gammac_2 = -((m*pi/a)^2 + (n*pi/b)^2);

c = 3*10^8;

fc = (c/(2*pi*sqrt(epsr)))*sqrt(-gammac_2);
end