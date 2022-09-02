%constante de prop. onda TEM que se propaga por un conductor libremente 
%% NO ALPHA C,pero si el calculo de la profundidad de penetracion del conductor 
f = 16E9; % Hz
w = 2*pi*f; %rad/s
mu0 = pi*4E-7; %H/m
eps0 = 1E-9/(36*pi); %F/m
sigma = 5.8E7; %Siemens/m
epsr = 1;
eps_prima = eps0*epsr; % F/m
eps_prima_prima = sigma/w; %Siemens*s/m*rad = F*rad/s => F/m
eps = eps0 - 1j*sigma/w;

gamma=sqrt(-w^2*mu0*eps);

alpha=real(gamma); %  
beta=imag(gamma);
delta_p=1/alpha;

delta_p_aprox=1/sqrt(pi*mu0*f*sigma);
%%  autovalor del modo TE10
epsr = 2.08; tand = 0.0004;
f = 3E9;
w = 2*pi*f;

autovalor = -(pi/a)^2;
gamma_0_2 = -w^2*mu0*eps0*epsr*(1-1j*tand);
gamma = sqrt(gamma_0_2 - autovalor);

alpha = real(gamma);
beta = imag(gamma);
%%
gamma_0_2_a = -w^2*mu0*eps0*epsr;
gamma = sqrt(gamma_0_2_a - autovalor);

alpha_a = real(gamma);

beta_a = imag(gamma);












