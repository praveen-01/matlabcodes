clear all
close all
clc
 fs=100;
 T=2;
 w = 2*pi/T;
 k=0:1/fs:10;
 y=square(w*k,50);
 subplot(311)
 plot(k,y)
 %We use the formulae for fourier synthesis which is the additio of cos and
 %sine terms.
 %for that we need to find the values of an,bn,ao which are coefficents of
 %the terms.
 syms t
 N=100;
 n=1:N;
 ao=(2/T)*(int(1,t,0,1)+int(-1,t,1,2));%int() integral command int 
%int(x,y,a,b) where x= function,y=variable to which we integrate
%a,b are integral limits.
an=(2/T)*(int(1*cos(n*w*t),t,0,1)+int(-1*cos(n*w*t),t,1,2));
bn=(2/T)*(int(1*sin(n*w*t),t,0,1)+int(-1*sin(n*w*t),t,1,2));
F=ao/2;
for i=1:N
    F=F+an(i)*cos(i*w*k)+bn(i)*sin(i*w*k);
end
subplot(312)
plot(k,F)
subplot(313)
plot(k,F,k,y)
    