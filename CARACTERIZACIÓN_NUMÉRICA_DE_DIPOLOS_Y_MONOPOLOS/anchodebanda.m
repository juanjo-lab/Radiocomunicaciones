%% Alumnos:
%{
Juan José Martínez Cámara
Manuel Villar Campo
%}
function [f1,f2,ancho_banda,aux_a_punto,aux_b_punto]=anchodebanda(directividad)
    porcentaje=input("¿Que porcentaje se considera aceptable si la directividad variase? (0-100 %)");
    porcentaje=porcentaje/100;
    f_work=input("Sobre que frecuencia tomariamos como central(expresado en MHz)= ");
    f_min=input("¿Cual es la frecuencia minima en la que actua la antena?(expresado en MHz) = ");
    aux =  directividad(f_work - f_min)*porcentaje;%calculo de diferencia de porcentaje
    D_a = directividad(f_work-f_min) - aux;%valores de directividad
    D_b = directividad(f_work-f_min) + aux;
    
    %punto anterior de nuestra frecuencia
    aux_a=abs(directividad-D_a);
    aux_a_punto=min(aux_a);
    aux_a_punto=find(aux_a_punto==aux_a);
    f1=directividad(aux_a_punto);%directividad eq a nuestro muestreo
    aux_a_punto=aux_a_punto+f_min;%frecuencia eq 
    
    %punto siguiente de nuestra frecuencia
    aux_b=abs(directividad-D_b);
    aux_b_punto=min(aux_b);
    aux_b_punto=find(aux_b_punto==aux_b);
    f2=directividad(aux_b_punto);%directividad eq a nuestro muestreo
    aux_b_punto=aux_b_punto+f_min;%freq eq
    if f_min==(aux_a_punto-1)
        ancho_banda=(aux_b_punto);%calculo ancho de banda
    else
        ancho_banda=(aux_b_punto-aux_a_punto);%
    end
    
    end