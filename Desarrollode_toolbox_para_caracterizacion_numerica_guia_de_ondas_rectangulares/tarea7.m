%%                          TAREA 7
sigma = 5.8*10^7;
epsr = 2.08;
tand = 0.0004;
a = 1.07/100;b = 0.43/100;
f = 16*10^9;
%% apartado a
%a) Encontrar las frecuencias de corte de los 5 primeros modos en propagarse.

m = [1,2,0,1,1];
n = [0,0,1,1,1];
tipo = ["TE","TE","TE","TE","TM"];
for i=1:5
    fc = WRFrecCorte(tipo(i), m(i), n(i), a, b, epsr)/10^9;
    disp("El modo: "+num2str(i)+".-"+tipo(i)+"_"+num2str(m(i))+num2str(n(i))+" tiene una frecuencia de "+ num2str(fc)+" (GHz)" );
end

%% apartado b
%b) Encontrar el ancho de banda monomodo de la estructura

[BW, finf, fsup, modsup] = WRAnchoBanda(a,b,epsr);
disp("El ancho de banda monomodo es "+num2str(BW/10^9)+" (GHz)");

%% apartado c
%c) A 16 GHz determine la longitud de onda del modo fundamental
[alpha,beta,lambda] = WRAtenuaDielectrico(f,a,b,epsr,tand);
[lambda_1] = WRLongOnda(tipo(1), m(1), n(1), f, a, b, epsr);
disp("la longitud de onda vale : "+num2str(lambda*100)+" (cm)"+ num2str(lambda_1*100)+"(cm)");

%%  apartado d
%d) A 16 GHz determine la atenuación (en dB/m) del modo fundamental
[alphad] = WRAtenuaDielectrico(f,a,b,epsr,tand);
[alphac] = WRAtenuaConductor(f, a, b, sigma, epsr);
alpha = alphac+alphad;
disp("la atenuación en dB/m para el modo fundamental TE_10, es : "+num2str(alpha*8.686)+" (dB/m)");

%% apartado e
% e) A 16 GHz determine la atenuación (en dB/m) del primer modo superior
[alpha] = WRAtenuaCorte("TE", 2, 0, f, a, b, epsr);
disp("la atenuación en dB/m para el modo fundamental TE_20, es : "+num2str(alpha*8.6868)+" (dB/m)");
