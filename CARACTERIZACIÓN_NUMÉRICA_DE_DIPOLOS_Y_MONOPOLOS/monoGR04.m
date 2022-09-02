%% Alumnos:
%{
Juan José Martínez Cámara
Manuel Villar Campo
%}
%%                                  Declaración de parametros iniciales:
%(proporcionados en la practica)                    monopolo
altura_monopolo = 0.25;
radio_monopolo = 1e-3;
with_monopolo = cylinder2strip(radio_monopolo);
longitud_plano_masa = Inf;
ancho_plano_masa = Inf
monopolo =  monopole('Height', altura_monopolo,'Width', with_monopolo, 'GroundPlaneLength', longitud_plano_masa, 'GroundPlaneWidth', ancho_plano_masa)
%%                                              Apartado 9
% Visualice la geometría de la antena monopolo que se va a simular
% empleando el método show.
show(monopolo);
%%                                             Apartado 10
% Empleando el método impedance, muestre en una gráfica como varía
% la impedancia del monopolo diseñado con la frecuencia. Para el eje de
% frecuencias, realice un barrido de frecuencia desde los 150 MHz hasta los
% 900 MHz. ¿A qué frecuencias en el rango de 150 MHz – 900 MHz el dipolo
% se comporta como una antena resonante?

f = 150e6:1e6:900e6;
impedance(monopolo,f);
title('Impedancia monopolo');

%%                                                      Apartado 11
% Empleando el método pattern, dibuje el diagrama de radiación polar 3D del monopolo a 
% Empleando el método pattern, dibuje el diagrama de radiación polar
% 3D del monopolo a la frecuencia de 300 MHz. ¿Cuál es la directividad de
% del monopolo (en unidades naturales) a 300 MHz?

pattern(monopolo,300e6);

%%                                                      Apartado 12
% Muestre en una gráfica como varía la directividad de la antena
% monopolo(expresada en unidades naturales) con la frecuencia. Para el
% eje de frecuencias, realice un barrido de frecuencia desde los 150 MHz
% hasta los 900 MHz.
y = [];
t1=clock;%empieza el reloj
for i = 150:900 
   diagrama = patternElevation(monopolo,i*10^6);
   directividad = max(diagrama);
   D0 = 10^(directividad/10);
   y = [y D0];
end
t2=clock;%termina el reloj
ttof=etime(t2,t1);
disp("tiempo computacional necesario : "+ttof+"s");
%tiempo computacional necesario : 275.226s       triste por mi ordenador
%                                                         :(
figure;
plot(150:900,y);
title('Directividad maxima Monopolo');
%%
%%
%representacion en longitud dipolo/lamda
f = 150e6:1e6:900e6;
lamda = (3e8)./(f);
lamda=altura_monopolo./lamda;

figure;
subplot(211);
plot(150:900,y);ylabel('D_0 (und.naturales)');xlabel('Frecuencia (MHz)');title('Directividad max');
subplot(212);
plot(lamda,y,'red');ylabel('D_0 (und.naturales)');xlabel('altura_m_o_n_p_o_l_o/λ');


%%                                                             Apartado 13
% Si el monopolo se ha diseñado para operar a la frecuencia de 300 MHz y
% se considera que el funcionamiento de la antena es aceptable si la
% directividad (en unidades naturales) varía un máximo de un 0.5% ¿Cuál
% es el ancho de banda del monopolo?

%CREO QUE SE PUEDE QUEDAR ASI , ni tan mal:
[D_a,D_b,BW,F_a,F_b]=anchodebanda(y);
disp("La directividad por debajo es "+num2str(D_a)+" y su frecuencia es: "+num2str(F_a)+" (MHz)");
disp("La directividad por encima es "+num2str(D_b)+" y su frecuencia es: "+num2str(F_b)+" (MHz)");
disp("Tenemos un ancho de banda de : "+num2str(BW)+" (MHz)");


%%                                                           Apartado 14
% )Para el monopolo a 300 MHz y empleando el método
% patternElevation, dibuje el diagrama de radiación polar (2D) que se
% tiene particularizando un acimut Az = 0º. ¿Cuál es el ángulo de elevación
% El (en grados) correspondiente a la máxima radiación?

patternElevation(monopolo, 300e6)

%%                                                          Apartado 15
% )¿Qué efecto tiene sobre el diagrama de radiación del monopolo un plano
% de masa perfecto de dimensión finita? Justifique su respuesta realizando
% las simulaciones correspondientes a planos de masa de 2 m x 2 m , 1 m
% x 1 m y 0.5 m x 0.5 m. 
%%                                                  2*2
longitud_plano_masa = 2;
ancho_plano_masa = 2;
monopolo_2 =  monopole('Height', altura_monopolo,'Width', with_monopolo, 'GroundPlaneLength', longitud_plano_masa, 'GroundPlaneWidth', ancho_plano_masa)

figure;show(monopolo_2);

figure;pattern(monopolo_2,300e6);

figure;patternElevation(monopolo_2, 300e6);

%%                                                  1*1
longitud_plano_masa = 1;
ancho_plano_masa = 1;
monopolo_1 =  monopole('Height', altura_monopolo,'Width', with_monopolo, 'GroundPlaneLength', longitud_plano_masa, 'GroundPlaneWidth', ancho_plano_masa)

figure;show(monopolo_1);

figure;pattern(monopolo_1,300e6);

figure;patternElevation(monopolo_1, 300e6);



%%                                                          0.5*0.5
altura_monopolo = 0.25; % m altura del monopolo
radio_monopolo = 1e-3; %m radio del cilindro con que se construye el monopolo
width_monopolo = cylinder2strip(radio_monopolo); %m ancho de tira equivalente a cilindro
longitud_planomasa = 0.5;
ancho_planomasa = 0.5;
monopolo_0_5 = monopole('Height', altura_monopolo, 'Width', width_monopolo, ...
 'GroundPlaneLength', longitud_planomasa, ...
 'GroundPlaneWidth', ancho_planomasa); %Construye el monopolo 

figure;
show(monopolo_0_5);title("monopolo 0.5");

figure;
pattern(monopolo_0_5,300e6);

figure;
patternElevation(monopolo_0_5,300e6);
