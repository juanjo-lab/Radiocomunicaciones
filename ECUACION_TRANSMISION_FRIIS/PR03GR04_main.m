%% Alumnos:
%{
Juan José Martínez Cámara
Manuel Villar Campo
%}
%%                                                  MENU
%%  preguntamos la frecuencia de operacion

fop=input("¿Cual es la frecuencia de operacion? (Hz)? = ");

%% preguntamos los parametro conocidos entre la antena 1 y 2

d12=input("La distancia entre antenas 1 y 2 = ");
pottx_12=input("La potencia transmitida (en dBm) para el enlace 1 y 2 = ");
potrx_12=input("La potencia recibida (dBm) entre 1 y 2 = ");

%% preguntamos los parametro conocidos entre el enlace 2 y 3

d23=input("La distancia entre antenas 2 y 3 = ");
pottx_23=input("La potencia transmitida (en dBm) desde la antena 2 = ");
potrx_23=input("La potencia recibida en la antena 3(dBm) = ");

%% preguntamos los parametro conocidos entre el enlace 3 y 1

d13=input("La distancia entre antenas 1 y 3 = ");
pottx_13=input("La potencia transmitida (en dBm) para el enlace 1 y 3 = ");
potrx_13=input("La potencia recibida (dBm) entre 1 y 3 = ");

%% CALCULO DE GANANCIAS 

[G1,G2,G3]=PR03GR04_Ganancia(fop,d12,d23,d13,pottx_12,potrx_12,pottx_23,potrx_23,pottx_13,potrx_13);

disp("La ganancia de la antena 1 es "+num2str(G1)+"(dBi), la ganancia de la antena 2 es "+ num2str(G2)+"(dBi) la de la antena 3 es "+num2str(G3)+"(dBi)");

%% CALCULO DE AREA EFECTIVA

[Aef1,Aef2,Aef3]=PR03GR04_aef(G1,G2,G3,fop);

disp("El area efectiva de la antena 1 es = "+num2str(Aef1)+" (cm^2), el de la antena 2 es = "+num2str(Aef2)+"(cm^2) y el de la antena 3 es = "+num2str(Aef3)+"(cm^2)");

%% CALCULO DE EFICIENCIA DE ANTENA
%pedimos las dimensiones de las antenas para calcular el Area fisica

a_1=input("Introduzca la altura de la antena 1 (cm) ");
b_1=input("Introduzca la base de la antena 1 (cm) ");
A1=a_1*b_1;

a_2=input("Introduzca la altura de la antena 2 (cm) ");
b_2=input("Introduzca la base de la antena 2 (cm) ");
A2=a_2*b_2;

a_3=input("Introduzca la altura de la antena 3 (cm) ");
b_3=input("Introduzca la base de la antena 3 (cm) ");
A3=a_3*b_3;

%introducimos nuestros valores calculados en nuestra funcion diseñada

[EF1,EF2,EF3]=PR03GR04_eficienciaap(Aef1,Aef2,Aef3,A1,A2,A3);

disp("La eficiencia en apertura de la antena 1 es  = "+num2str(EF1)+"(%), la de la antena 2 es = "+num2str(EF2)+"(%) y la propia de la antena 3 es ="+num2str(EF3)+"(%)");