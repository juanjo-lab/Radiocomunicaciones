%{
Alumno:Juan Jose Martinez Camara
DNI: 77393908N
%}
%% %%%%%PERDIDAS DE PROPAGACION EN ESPACIO LIBRE %%%%%%%%%%%%
% PARAMETROS
%Mhz
%Km
%Función

%L_bf=32,45+20*log10(f)+20*log10(d);

%{
Represente gráficamente las pérdidas de propagación, 
en función de la distancia, para estas tres frecuencias:
 300 MHz, 800 MHz y 2 GHz. Considere que la distancia 
varía desde 10 metros a 10 Kms. Superponga las tres 
gráficas sobre una misma figura, asignándoles valores 
diferentes.
%}
freq=[300;800;2000];%Vector de frecuencias en Mhz
d=10:10:10000;%Distancia en m
figure(1);hold on;       %figura 1
for i=1:3
    for j=1:length(d)
         L_bf(j)=32.45+20*log10(freq(i)*d(j)/1000);%Perdidas de propagacion
    end
     plot(d,L_bf);
     
end
legend([num2str(freq(1)) 'Mhz'],[num2str(freq(2)) 'Mhz'],[num2str(freq(i)) 'Mhz']);title('Perdidas de propagacion en espacio libre (L_b)');
xlabel('distancia (m)');ylabel('dB');
hold off;

%% %%%%%%%%%%%%%%%%%%%%MODELO DE TIERRA PLANA%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
•	Figura 2.- Represente gráficamente, en función de
 la distancia, las pérdidas de propagación para una 
altura del transmisor de 30 metros y una altura del
 receptor de 1.5 metros. Considere que la distancia
 varía desde 10 metros a 10 Kms.
%}

%%
% FIGURA  2,3 Y 4
h_r=1.5;
h_t=[10;30;60];
d=10:10:10000;
[a,b]=size(d);
for i=1:size(h_t)
    for j=1:b
    %funcion
        L(j)=120-20*log10(h_t(i)*h_r)+40*log10(d(j)/1000);
    end 
    figure(i+1);plot(d,L);xlabel('distancia (m)');ylabel('dB');title('Perdidas de propagacion en tierra plana (L)');legend(['Altura de transmisor : ' num2str(h_t(i))]);
end

%% figura 5
h_r=1.5;
h_t=[10;30;60];
d=10:10:10000;
figure;hold on;
for i=1:3
    for j=1:b
    %funcion
        L(j)=120-20*log10(h_t(i)*h_r)+40*log10(d(j)/1000);
    end
    plot(d,L);xlabel('distancia(m)');ylabel('dB');title('Altura de transmisor');legend('h_t=10m','h_t=30m','h_t=60m');
end
hold off;

%% %%%%%%%%%%%%%%%%%%%%%%%Modelo UIT-R P.526%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figura 6 y 7

d=5;%km
h=25;
freq=100:1:1500;%Mhz
d_1=[d/2;d/4;d/8;d/16];%km   TX
d_2=[d/2;3*d/4;7*d/8;15*d/16];%km   RX

%funciones:
figure(7);hold on;
for i=1:size(d_1)
    for j=1:length(freq)
        aux=sqrt((d_1(i)*d_2(i))/(freq(j)*d));
        v(j)=(2.58*10^-3)*h/aux;
    end
    plot(freq,v);title('Para valores de v');legend(['D_1' num2str(d_1(1)) ' km'],['D_1' num2str(d_1(2)) ' km'],['D_1' num2str(d_1(3)) ' km'],['D_1' num2str(d_1(i)) ' km'])
    xlabel('Frecuencia(Mhz)');ylabel('Parametro adimensional');
end
hold off;
figure(6);hold on;
for i=1:size(d_1)
    for j=1:length(freq)
        aux=sqrt((d_1(i)*d_2(i))/(freq(j)*d));
        R_1(j)=548*aux;
    end
    plot(freq,R_1);title('Para valores de R_1');legend(['D_1' num2str(d_1(1)) ' km'],['D_1' num2str(d_1(2)) ' km'],['D_1' num2str(d_1(3)) ' km'],['D_1' num2str(d_1(i)) ' km'])
    xlabel('Frecuencia(Mhz)');ylabel('Rango fresnel(m)');
end
hold off;

%% Figure 8          
figure;hold on;
v=0.78:0.01:3;
for i=1:length(v)
       L_D(i)=6.9+20*log10(sqrt((v(i)-0.1)^2 +1) + v(i) -0.1);
end
            plot(v,L_D);title('Para valores de L_d en función de V'); xlabel('v');ylabel('Perdidas por Difraccion (dB)');

hold off;

%% %%%%%%%%%%%%%%%%%%%%%OKUMURA-HATA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%La frecuencia debe ser enrte 150 y 1500
% h_t debe estar entre 30 y 200
%hm esta entre 1 y 20
%d entre 1 y 20
% a para hm =1.5 =0
%urbano
%L_b=69.55+26.26*log10(freq)-13.82*log10(h_t)-a+log10(d)*(44.9-6.55*log10(ht));

%suburbano
%L_bs=L_b-2*(log10(f/28))^2 -5.4;
%zona rural
%L_br=L_b-4.78*(log10(f))^2+18.33*log10(f)-40.94;

%%Figura 9
freq=[300;800;1500];
h_t=30;
h_m=1.5;
d=1:0.1:20;
[~,b]=size(d);
if h_m==1.5
    a=0;
end
figure;hold on;
for i=1:size(freq)
    for j=1:length(d)
    L_b(j)=69.55+26.26*log10(freq(i))-13.82*log10(h_t)-a+log10(d(j))*(44.9-6.55*log10(h_t));
    end
    plot(d,L_b);xlabel('Distancia(km)');ylabel('Perdidas de propagacion (dB)');legend([num2str(freq(1)) ' Mhz'],[num2str(freq(2)) ' Mhz'],[num2str(freq(i)) ' Mhz']);
    title('Perdidas por propagación L_b');

end
hold off;

%% figura 10 y 11
freq=[300;800;1500];
h_t=[60;200];
h_m=1.5;
d=1:0.1:20;
if h_m==1.5
    a=0;
end

for k=1:size(h_t)
    figure(9+k);hold on;
    for i=1:size(freq)
        for j=1:length(d)
        L_b(j)=69.55+26.26*log10(freq(i))-13.82*log10(h_t(k))-a+log10(d(j))*(44.9-6.55*log10(h_t(k)));
        end
        plot(d,L_b);legend('300Mhz','800Mhz','1500Mhz');title(['La altura del transmisor es de =',num2str(h_t(k)),'m']);
        ylabel('dB');
    end
    hold off;
end

%% figure 12 , 13 y 14

freq=[300;800;1500];
h_t=[30;60;200];
h_m=1.5;
d=1:0.1:20;
if h_m==1.5
    a=0;
end

for i=1:size(freq)
    figure(i+11); hold on;
    for k=1:3
        for j=1:length(d)
        L_b(j)=69.55+26.26*log10(freq(i))-13.82*log10(h_t(k))-a+log10(d(j))*(44.9-6.55*log10(h_t(k)));
        end
        plot(d,L_b);title(['La frecuencia es ' num2str(freq(i)) 'Mhz']);legend(['h_t= ' num2str(h_t(1)) 'm'],['h_t= ' num2str(h_t(2)) 'm'],['h_t= ' num2str(h_t(k)) 'm']);
        xlabel('distancia(km)');ylabel('dB')
    end
    hold off;
end

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Modelo de Hata-COST-231%%%%%%%%%%%%%%%%
%figura 15,16,17
freq=[1500;2000];
h_t=[30;60;200];
h_m=1.5;
d=1:0.1:20;

cm=0;


if h_m==1.5
    a=0;
end
for k=1:size(h_t)
    figure(14+k); hold on;
    for i=1:size(freq)
        for j=1:length(d)
        L_b(j)=69.55+26.26*log10(freq(i))-13.82*log10(h_t(k))-a+log10(d(j))*(44.9-6.55*log10(h_t(k)))+cm;
        end
        plot(d,L_b);title(['La altura del transmisor es ' num2str(h_t(k)) 'm']);legend([ num2str(freq(1)) 'Mhz'],[num2str(freq(i)) 'Mhz']);
         xlabel('Distancia (km)');ylabel('dB');
    end
    hold off;
end
%figura 18 y 19
for i=1:size(freq)
    figure(17+i); hold on;
    for k=1:size(h_t)
        for j=1:length(d)
        L_b(j)=69.55+26.26*log10(freq(i))-13.82*log10(h_t(k))-a+log10(d(j))*(44.9-6.55*log10(h_t(k)))+cm;
        end
        plot(d,L_b);title(['La frecuencia es ' num2str(freq(i)/1000) 'Ghz']);legend([ num2str(h_t(1)) 'm'],[num2str(h_t(2)) 'm'],[num2str(h_t(k)) 'm']);
        xlabel('Distancia (km)');ylabel('dB');
    end
    hold off;
end
%% 7.	Comparación del modelo de espacio libre, tierra plana y Okumura-Hata
%Figura 20,21,22,23          
h_m=1.5;
freq=[300;800;1500;2000];
h_t=30;
d=10/1000:10/1000:20;
h_r=h_m;
if h_m==1.5
    a=0;
end
cm=0;
for j=1:size(freq)
    for i=1:length(d)
        %espacio libre
        L_bf(i)=32.45+20*log10(freq(j))+20*log10(d(i));
        %plana
        L(i)=120-20*log10(h_t*h_r)+40*log10(d(i));
        if freq(j)<=1500
            L_b_1(i)=69.55+26.26*log10(freq(j))-13.82*log10(h_t)-a+log10(d(i))*(44.9-6.55*log10(h_t));
        else
            %L_b_1(i)=46.3+33.9*log10(freq(j))-13.82*log10(h_t)-a+log10(d(i))*(44.9-6.55*log10(h_t))+cm;
        end
    end
    figure(19+j);hold on;plot(d,L_bf);title(['Frecuencia : ' num2str(freq(j)) 'MHz']); xlabel('distancia (km)');ylabel('dB');
    plot(d,L);
    if freq(j)<=1500
    plot(d,L_b_1);
    end
    hold off;
end
figure(20);hold on;legend('Espacio libre','Tierra plana','Okumura-Hata');hold off;
figure(21);hold on;legend('Espacio libre','Tierra plana','Okumura-Hata');hold off;
figure(22);hold on;legend('Espacio libre','Tierra plana','Okumura-Hata');hold off;
figure(23);hold on;legend('Espacio libre','Tierra plana');hold off;
%% figura 24, 25 y 26
h_t=[30;60;200];
if h_m==1.5
    a=0;
end
for k=1:size(h_t)
    for j=1:size(freq)
        for i=1:length(d)
            %espacio libre
            L_bf(i)=32.45+20*log10(freq(j))+20*log10(d(i));
            %plana
            L(i)=120-20*log10(h_t(k)*h_r)+40*log10(d(i));

            if freq(j)>150&&freq(j)<=1500
                L_b_1(i)=69.55+26.26*log10(freq(j))-13.82*log10(h_t(k))-a+log10(d(i))*(44.9-6.55*log10(h_t(k)));
            else
                %L_b_1(i)=46.3+33.9*log10(freq(j))-13.82*log10(h_t(k))-a+log10(d(i))*(44.9-6.55*log10(h_t(k)))+cm;

            end
        end
        figure(23+k);hold on;plot(d,L_bf);title(['Altura transmisor : ' num2str(h_t(k)) 'm']); xlabel('distancia (km)');ylabel('dB');
        plot(d,L); plot(d,L_b_1);hold off;
    end
end
figure(24);hold on;legend('Espacio libre(300Mhz)','Tierra plana(300Mhz)','Okumura-Hata(300Mhz)','Espacio libre(800Mhz)','Tierra plana(800Mhz)','Okumura-Hata(800Mhz)','Espacio libre(1500Mhz)','Tierra plana(1500Mhz)','Okumura-Hata(1500Mhz)','Espacio libre(2000Mhz)','Tierra plana(2000Mhz)');hold off;
figure(25);hold on;legend('Espacio libre(300Mhz)','Tierra plana(300Mhz)','Okumura-Hata(300Mhz)','Espacio libre(800Mhz)','Tierra plana(800Mhz)','Okumura-Hata(800Mhz)','Espacio libre(1500Mhz)','Tierra plana(1500Mhz)','Okumura-Hata(1500Mhz)','Espacio libre(2000Mhz)','Tierra plana(2000Mhz)');hold off;
figure(26);hold on;legend('Espacio libre(300Mhz)','Tierra plana(300Mhz)','Okumura-Hata(300Mhz)','Espacio libre(800Mhz)','Tierra plana(800Mhz)','Okumura-Hata(800Mhz)','Espacio libre(1500Mhz)','Tierra plana(1500Mhz)','Okumura-Hata(1500Mhz)','Espacio libre(2000Mhz)','Tierra plana(2000Mhz)');hold off;

%% %%%%%%%%%%%%%%%%%%Modelo COST-231 Walfish-Ikegami%%%%%%%%%%%%%%%%%%%%%%%%%
%ha -> 4<ha<50 hm-> 1<hm<3   d->0.002<= d<=5km f->800<=f<=2000Mhz
%b->20<=b<=50 %anchura w, angulo 0º<=º<=90º

%datos
h_b=30; h_m=1.5; d=0.02:0.001:5; f=[800;1500;2000];
b=25; w=15; h_r=20; phi=[0;45;90];
for i=1:size(f)
    %LOS(vision directa)
    for j=1:length(d)
    L_b_LOS(j)=42.6+26*log10(d(j))+20*log10(f(i));
    end
    figure(26+i);hold on;
    plot(d,L_b_LOS);xlabel('Distancia (km)');ylabel('dB');
     title(['Frecuencia->' num2str(f(i)) 'Mhz']);
    hold off;
end
for i=1:size(f)
    %Nlos, SI NO HAY LINEA DIRECTA difraccion y dispersion tejado-calle
    %L_o
    L_o=32.45+20*log10(f(i))+20*log10(d);
    %L_ori
    for k=1:size(phi)
        
        for j=1:length(d)
            
        
        if phi(k)<=35
            L_ori=-10+0.3571*phi(k);
        elseif phi(k)>35 && phi(k)<55
            L_ori=2.5+0.075*(phi(k)-35);
        else
            L_ori=4-0.114*(phi(k)-55);
        end

        L_rts=-8.2-10*log10(w)+10*log10(f(i))+20*log10(h_r-h_m)+L_ori;


        %L_msd
        L_bsh=-18*log10(1+abs(h_b-h_r));

        if h_b-h_r>=0%Ka
            K_a=54;
        elseif h_b-h_r<0 && d(j)>=0.5
            K_a=54-0.8*abs(h_b-h_r);
        elseif h_b-h_r<0 && d(j)<0.5
            K_a=54-1.6*abs(h_b-h_r)*d(j);
        end

        if h_b-h_r>=0%Kd
            K_d=18;
        elseif h_b-h_r<0
            K_d=18-15*abs(h_b-h_r)/h_r;
        end

        zona=1;%suburbana-> 1  metropolitanos->0
        if zona==1%Kf
            K_f=-4+0.7*(f(i)/925-1);
        elseif zona==0
            K_f=-4+1.5*(f(i)/925-1);
        end

        L_msd=L_bsh+K_a+K_d*log10(d(j))+K_f*log10(f(i))-9*log10(b);

        L_b_NLOS=L_o+L_rts+L_msd;
        
        end
 
    figure(26+i);hold on;
    plot(d,L_b_NLOS);
    
    hold off;
    end

end
figure(27);hold on;legend('LOS','NLOS (Phi = 0º )','NLOS (Phi =45 º )','NLOS (Phi =90 º )');hold off;
figure(28);hold on;legend('LOS','NLOS (Phi = 0º )','NLOS (Phi =45 º )','NLOS (Phi =90 º )');hold off;
figure(29);hold on;legend('LOS','NLOS (Phi = 0º )','NLOS (Phi =45 º )','NLOS (Phi =90 º )');hold off;


%% Figure 30 y 31
%datos
h_b=30; h_m=1.5; d=0.02:0.001:5; f=[800;1500;2000];
b=25; w=15; h_r=20; phi=[0;45;90];
[~,aux]=size(d);

vision=0;%1-> vision ; 0-> sin vision
for i=1:size(f)
    %Nlos, SI NO HAY LINEA DIRECTA difraccion y dispersion tejado-calle
    %L_o
       for j=1:aux
        L_o(j)=32.45+20*log10(f(i))+20*log10(d(j));
        %L_msd
        L_bsh=-18*log10(1+abs(h_b-h_r));

        if h_b-h_r>=0%Ka
            K_a=54;
        elseif h_b-h_r<0 && d(j)>=0.5
            K_a=54-0.8*abs(h_b-h_r);
        elseif h_b-h_r<0 && d(j)<0.5
            K_a=54-1.6*abs(h_b-h_r)*d(j);
        end

        if h_b-h_r>=0%Kd
            K_d=18;
        elseif h_b-h_r<0
            K_d=18-15*abs(h_b-h_r)/h_r;
        end

        zona=1;%suburbana-> 1  metropolitanos->0
        if zona==1%Kf
            K_f=-4+0.7*(f(i)/925-1);
        elseif zona==0
            K_f=-4+1.5*(f(i)/925-1);
        end

        L_msd(j)=L_bsh+K_a+K_d*log10(d(j))+K_f*log10(f(i))-9*log10(b);

        m=0;
       end
    figure(30);hold on;
    plot(d,L_msd);legend('L_M_S_D f=800','L_M_S_D f=1500','L_M_S_D f=2000');
    title('L_M_S_D');xlabel('Distancia (km)');ylabel('Perdidas dB');
    figure(31);hold on;
    plot(d,L_o);legend('L_o f=800','L_o f=1500','L_o f=2000');
    title('L_o');xlabel('Distancia (km)');ylabel('Perdidas dB');
end
%% figura 32
phi=0:0.1:90;
for i=1:length(phi)
        if phi(i)<=35
            L_ori(i)=-10+0.3571*phi(i);
        elseif phi(i)>35 && phi(i)<55
            L_ori(i)=2.5+0.075*(phi(i)-35);
        else
            L_ori(i)=4-0.114*(phi(i)-55);
        end
end
figure(32);plot(phi,L_ori,'black');title('Perdidas por orientación en la calle');ylabel('atenuación dB');xlabel('angulo en º');

%% figura 33
%datos
h_m=1.5; f=800:1:2000; w=15; h_r=20; phi=[0;30;45;60;75;90];
vision=0;%1-> vision ; 0-> sin vision
figure(33);hold on;
for k=1:size(phi)
        if phi(k)<=35
            L_ori(k)=-10+0.3571*phi(k);
        elseif phi(k)>35 && phi(k)<55
            L_ori(k)=2.5+0.075*(phi(k)-35);
        else
            L_ori(k)=4-0.114*(phi(k)-55);
        end
        L_rts=-8.2-10*log10(w)+10*log10(f)+20*log10(h_r-h_m)+L_ori(k); 
    plot(f,L_rts);xlabel('Frecuencia (Mhz)');ylabel('dB');
    legend(['L_R_T_S (Phi =' num2str(phi(1)) ')'],['L_R_T_S (Phi =' num2str(phi(2)) ')'],['L_R_T_S (Phi =' num2str(phi(3)) ')'],['L_R_T_S (Phi =' num2str(phi(4)) ')'],['L_R_T_S (Phi =' num2str(phi(5)) ')'],['L_R_T_S (Phi =' num2str(phi(6)) ')']);
    title('L_R_T_S');
end
 hold off;
 
 %% Figura 34,35,36
 h_m=1.5;
 d=0.02:0.001:5;
 f=[800;1500;2000];
 b=30;
 w=15;
 h_r=20;
h_b=[25;35;50];
[~,aux]=size(d);

for k=1:size(f)
    figure(33+k);hold on;
    for j=1:size(h_b)
        for i=1:aux
           [~,L_msd(i),~]=XIA(f(k),d(i),h_b(j),h_r,h_m,w,b,15);
        end
        plot(d,L_msd);legend('h_b=25m','h_b=35m','h_b=50m');
        title(['Las perdidas L_M_S_D para la frecuencia =' num2str(f(k)) 'Mhz']);xlabel('Distancia km');ylabel('dB');
    end
    hold off;
end
%% figura 37
%no importa la freq
h_m=1.5;
d=0.02:0.001:5;
f=[800;1500;2000];
b=30;
w=15;
h_r=20;
h_b=h_r;
figure(37);hold on;
[~,L_msd(:),~]=XIA(f(1),d(:),h_b,h_r,h_m,w,b,15);
plot(d,L_msd);
title('Las perdidas para el caso 2 son h_b=h_r');xlabel('Distancia km');ylabel('dB'); 
hold off;

%% figura 38,39,40
 %datos
h_m=1.5;
d=0.02:0.001:5;
f=[800;1500;2000];
b=30;
w=15;
h_r=20;
h_b=[1;5;10;15;19.5];

for j=1:size(f)
    figure(37+j);hold on;
    for i=1:size(h_b)
        for k=1:length(d)
        [~,L_msd(k),~]=XIA(f(j),d(k),h_b(i),h_r,h_m,w,b,15);
        end
        hold on;
        plot(d,L_msd); title(['Las perdidas para el caso 3 son h_b<h_r para la frecuencia = ' num2str(f(j)) 'Mhz']);xlabel('Distancia km');ylabel('dB'); 
        hold off;
    end
    hold on;
    legend('h_b = 1 m','h_b = 5 m','h_n = 10 m','h_b = 15 m','h_b = 19.5 m');
        title(['Las perdidas para el caso 3 son h_b<h_r para la frecuencia = ' num2str(f(j)) 'Mhz']);xlabel('Distancia km');ylabel('dB'); 
    
    hold off;
end

hold off;


%% figura 41
%turning point

h_b=6; h_m=1.5; n1=2.25; n2=4.25;f=300:1:3000;
for i=1:length(f)
lambda(i)=300/f(i);
dtp(i)=4*h_b*h_m/lambda(i);
end
figure(41);plot(f,dtp);legend('Punto de ruptura');title('Punto de ruptura en función de la frecuencia');
xlabel('frecuencia (Mhz)');ylabel('Distancia (m)');

%% figura 42
d=1:0.5:500;
f=[800;1500;2000];
%cost 231
h_b=6; h_m=1.5; n1=2.25; n2=4.25;
figure(42);hold on
for j=1:length(f)
    lambda=300/f(j);
    dtp=(4*h_b*h_m)/(lambda);
    L_o=20*log10(f(j))-27.6;
    for i=1:length(d)
        if d(i)<=dtp
            L_1(i)=L_o+10*n1*log10(d(i));
        else
            L_1(i)=L_o+10*n1*log10(dtp)+10*n2*log10((d(i))/(dtp));
        end
    end
    plot(d,L_1);legend('800 Mhz', '1500Mhz','2000Mhz');title('Perdidas de propagación ');xlabel('distancia m');ylabel('dB'); 
end
hold off;



%% figura 43
d=1:0.5:500; f=[800;1500;2000]; h_b=6; h_m=1.5; n1=2.25; n2=4.25;
figure(43);hold on
for i=1:length(f)
    lambda=300/f(i);
    L_o=20*log10(f(i))-27.6;
    [L_b(i,:),dtp]=LUNG(f(i),d(:),h_b,h_m,n1,n2);
    
    plot(d,L_b(i,:));legend('800 Mhz', '1500Mhz','2000Mhz');title('Perdidas de propagación');xlabel('distancia m');ylabel('dB'); 
end
hold off;
%% figure 44

phi = 0:0.01:pi/2;
w =1;
for i=1:length(phi)
        [~,~,~,n_1(i)]=MicrocelNlos(0,0,0,0,0,w,phi(i),0,0);
end
phi_2=0:0.0001:0.2;
for i=1:length(phi_2)
    [~,~,~,n_2(i)]=MicrocelNlos(0,0,0,0,0,w,phi_2(i),0,0);
end
figure(44);subplot(211);plot(phi,n_1);xlabel('Angulo de vision BS desde la esquina E');title('n: 0 -> pi/2 radianes');ylabel('adimensional');
subplot(212);plot(phi_2,n_2);xlabel('Angulo de vision BS desde la esquina E');title('n: 0 -> 0,2 radianes');ylabel('adimensional');

%% figure 45
phi=[0 pi/6 pi/4 pi/3 pi/2];
w=[1 3 10];

for i=1:length(phi)
    %1 m
    figure(45);hold on;
    %y_1= 10.7*phi(i) + 0.22*w(1)+2.99;
    y_1m = 1:0.01:100;
    L_y_1 = zeros(1,length(y_1m));
    for j=1:length(y_1m)
    [~,~,L_y_1(j),~]=MicrocelNlos(0,0,0,0,0,w(1),phi(i),0,y_1m(j)); 
    end
    plot(y_1m,L_y_1);
    title(['W = ' num2str(w(1)) 'm']);xlabel('Ubicación');ylabel('Perdidas dB');
    hold off;
    
    %3 m
    figure(46);hold on;
    %y_1= 10.7*phi(i) + 0.22*w(2)+2.99;
    y_3m = 1:0.01:100;
    L_y_3 = zeros(1,length(y_3m));
    for j=1:length(y_3m)
    [~,~,L_y_3(j),~]=MicrocelNlos(0,0,0,0,0,w(2),phi(i),0,y_3m(j)); 
    end
    plot(y_3m,L_y_3);
    title(['W = ' num2str(w(2)) 'm']);xlabel('Ubicación');ylabel('Perdidas dB');
    hold off;
     
     
    figure(47);hold on; 
    %10 m
    %y_1= 10.7*phi(i) + 0.22*w(3)+2.99;
    y_10m = 1:0.01:100;
    L_y_10 = zeros(1,length(y_10m));
    for j=1:length(y_10m)
    [~,~,L_y_10(j),~]=MicrocelNlos(0,0,0,0,0,w(3),phi(i),0,y_10m(j)); 
    end
    plot(y_10m,L_y_10);
    title(['W = ' num2str(w(3)) 'm']);xlabel('Ubicación');ylabel('Perdidas dB');
    hold off;
end
figure(45);hold on;legend('0', 'pi/6','pi/4', 'pi/3','pi/2');hold off;
figure(46);hold on;legend('0', 'pi/6','pi/4', 'pi/3','pi/2');hold off;
figure(47);hold on;legend('0', 'pi/6','pi/4', 'pi/3','pi/2');hold off;
%% tabla
%tabla 1
 h_m=1.5;
 d=0.02:0.001:5;
 f=[800;1500;2000];
 b=30;
 w=15;
 h_r=20;
[~,aux]=size(d);
x=[0.5;2;5;10;15];
for j=1:length(f)
 
    for i=1:size(x)
        [~,~,L_rts(i,j)]=XIA(f(j),d(:),0,h_r,h_m,w,b,x(i));
   end
    
end
%% 
%tabla 2
phi=[0 pi/6 pi/4 pi/3 pi/2];
wd=[1 3 10];
for i=1:length(phi)
    for j=1:length(wd)
        y0(j,i) = 8.92*phi(i) + 1.7;   				
        y1(j,i) = 10.7*phi(i) + 0.22*wd(j) + 2.99;		 	
        y2(j,i) = 0.62*wd(j) + 4.9;			
        n(j,i) = 2.75 - 1.13*exp(-23.4*phi(i));
    end
end


%%   FUNCIONES
function [L_b,dtp]=LUNG(f,d,h_b,h_m,n1,n2)
k = (4*pi*f/300)^2;
dtp = 4*h_b*h_m*f/300;
l_1 = d.^n1;
l_2 = (dtp^(n1-n2))*d.^n2;
l = k*(l_1.^4 + l_2.^4).^(1/4);
L_b = 10*log10(l);
end

function [L_1,L_msd,L_rts]=XIA(f,d,h_b,h_r,h_m,w,b,x)
    I_hb=h_b-h_r;
    R=sqrt(w^2+I_hb^2);
    Beta=atan(abs(I_hb)/w);
        if h_b>h_r
            L_1=32.45+20*log10(f)+20*log10(d);
            L_msd=68.87-18*log10(I_hb)-9*log10(b)-9*log10(f)+18*log10(d);
        elseif h_b==h_r
            L_1=29.45+20*log10(f)+20*log10(d);
            L_msd=60-20*log10(b)+20*log10(d);
        elseif h_b<h_r
            L_1=29.45+20*log10(f)+20*log10(d);
            L_msd=35.23+10*log10(f)+10*log10(R)+20*log10(Beta*(2*pi+Beta))-20*log10(b)+20*log10(d);
        end
    
    I_hm=h_r-h_m;
    r_r=sqrt(x^2+I_hm^2);
    Gamma=atan(abs(I_hm)/x);
    L_rts=-27.78+10*log10(f)+10*log10(r_r)+20*log10(Gamma*(2*pi+Gamma));
end

function [L_b,dtp]=MicrocelLos(f,d,h_b,h_m,n1,n2)
dtp = 4*h_b*h_m*f/300; 
L0 = 20*log10(f) -27.6; 
if d <= dtp 
    L_b = L0 + 10*n1*log10(d); 
else
   
    L_b = L0 + 10*n1*log10(d) + 10*n2*log10(d/dtp);
end
end

function [L_b,L_x,L_y,n]=MicrocelNlos(f,h_b,h_m,n1,n2,w,phi,x,y)
y_0 = 8.98*phi + 1.7;
y_1 = 10.7*phi + 0.22*w + 2.99;
y_2 = 0.62*w + 4.9;
n = 2.75 - 1.13*exp(-23.4*phi);
L_y = (heaviside(y - y_1) - heaviside(y - y_2))*10*n*log10(y_2/y_0)*log10(y/y_1)/log10(y_2/y_1) + heaviside(y - y_2)*10*n*log10(y/y_0);
if f==0
    L_x=0;
else
    [L_x,~] = MicrocelLos(h_b,h_m,f,x,n1,n2); 
end
 L_b = L_x + L_y;
end




%{
Altura de la 
antena (hb)
10 20 30 60 100 200
(44.9-6.55 log hb) 
n 
Variación al 
duplicar la 
distancia d (dB)


h_t=[10;20;30;60;100;200];
for i=1:size(h_t)
    primera_fila(i)=44.9-6.55*log10(h_t(i));
    n(i)=fig_1(i)/10;
    distanciaduplicada(i)=10*log10(2^n(i));
end

Atendiendo a los resultados se estableces que las pérdidas en función de la distancia decrecen 
al aumentar la altura de la estación base
%}