clear all;
clc;
close all;
f=3000; %signal frequency fm
t=0:0.000001:5/f;
org=cos(2 * pi * f * t); %original signal
subplot(411);plot(t,org);
xlabel('time');ylabel('amplitude');
grid;
title('input signal');
fs1 = 2*f;%following nyquist rate fs=2*fm
Ts1=1/fs1; % time period for fs1
t1=0:Ts1:5/f;
und = cos(2*pi*f*t1);
subplot(412)
stem(t1,und,'k');
title('sampled signal');
xr1=zeros(length(t));
N=length(t1);
for x=1:length(t)
    for n=0:N-1
        xr1(x)=xr1(x)+und(n+1)*sin(pi*(t(x)-n*Ts1)/Ts1)./(pi*(t(x)-n*Ts1)/Ts1);
    end
end
subplot(413)
plot(t,xr1,'r');
xlabel('time');ylabel('amplitude');
title('sampled and reconstructed signal');
subplot(414);
plot(t,xr1,t,org);
title('orginal and reconstructed signal(for camprison)');




