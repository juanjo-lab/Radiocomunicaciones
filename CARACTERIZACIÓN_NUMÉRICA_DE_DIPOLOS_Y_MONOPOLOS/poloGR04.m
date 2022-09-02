%% Alumnos:
%{
Juan José Martínez Cámara
Manuel Villar Campo
%}
%%                                  Declaración de parametros iniciales:
%(proporcionados en la practica)                    dipolo
longitud_dipolo = 0.5;
radio_dipolo = 1e-3;
with_dipolo = cylinder2strip(radio_dipolo);
mi_dipolo =  dipole('Length', longitud_dipolo,'Width', with_dipolo);


%% Visualizar la geometria de la antena dipolo.         Apartado 1

show(mi_dipolo);xlabel('Radio cilindro');ylabel('Ancho de tira'); zlabel('Longitud (mm)');
axis([-10 10 -10 10 -300 300]);
title('Dipolo elemental');

%%                                                     Apartado 2
%Empleando el método impedance, muestre en una gráfica como varía
% la impedancia del dipolo diseñado con la frecuencia. Para el eje de
% frecuencias, realice un barrido de frecuencia desde los 150 MHz hasta los
% 900 MHz. 
f = 150e6:1e6:900e6;
impedance(mi_dipolo,f);
title('Impedancia dipolo elemental');

%%                                                    Apartado 3
% Empleando el método pattern, dibuje el diagrama de radiación polar
% 3D del dipolo a la frecuencia de 300 MHz.

pattern(mi_dipolo, 300e6);
title('Diagrama de radiacion')

%%                                                    Apartado 4
% Muestre en una gráfica como varía la directividad del dipolo (expresada
% en unidades naturales) con la frecuencia. Para el eje de frecuencias,
% realice un barrido de frecuencia desde los 150 MHz hasta los 900 MHz.
y = [];
for i = 150:900
   diagrama = patternElevation(mi_dipolo,i*10^6);
   directividad = max(diagrama);
   D0 = 10^(directividad/10);
   y = [y D0];
end

figure;
plot(150:900,y);

%%
%representacion en longitud dipolo/lamda 
f = 150e6:1e6:900e6;
lamda = (3e8)./(f);
lamda=longitud_dipolo./lamda;

figure;
subplot(211);
plot(150:900,y);ylabel('D_0');xlabel('Frecuencia (MHz)');title('Directividad max');
subplot(212);
plot(lamda,y,'red');ylabel('D_0');xlabel('Logitud_d_i_p_o_l_o/λ');

%%                                                  APARTADO 5
% Si el dipolo se ha diseñado para operar a la frecuencia de 300 MHz y se
% considera que el funcionamiento de la antena es aceptable si la
% directividad (en unidades naturales) varía un máximo de un 5% ¿Cuál es
% el ancho de banda del dipolo?

[D_a,D_b,BW,f_a,f_b]=anchodebanda(y);
disp("La directividad un 5% menor es "+num2str(D_a)+" con una frecuencia situada en "+num2str(f_a)+" (Mhz)");
disp("La directividad un 5% superior es "+num2str(D_b)+" con una frecuencia situada en "+num2str(f_b)+" (MHz)");
disp("Nuestro ancho de banda total es : "+num2str(BW)+" MHz");

%%                                                  Apartado 6
% Para la antena dipolo bajo estudio a 300 MHz y empleando el método
% patternElevation, dibuje el diagrama de radiación polar (2D) que se
% tiene particularizando un acimut Az = 0º. ¿Cuál es el ángulo de elevación
% El (en grados) correspondiente a la máxima radiación?

patternElevation(mi_dipolo, 300e6);

%%                                                  Apartado 7
% Para la antena dipolo bajo estudio a 300 MHz y empleando el método
% patternAzimuth, dibuje el diagrama de radiación polar (2D) que se
% obtiene en el plano XY ( El = 0º ) y justifique que se trata de una antena
% omnidireccional.

patternAzimuth(mi_dipolo, 300e6);

%%                                                  Apartado 8
% Para la antena dipolo bajo estudio a la frecuencia de 300 MHz y
% empleando el método beamwidth, determine el ancho de haz a -3 dB,
% ∆θ −3dB .

beamwidth(mi_dipolo,300e6,0,0:1:360);













