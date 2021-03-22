clear all;
clc;
close all;
f=3000; %signal frequency fm
t=0:0.000001:5/f;
org=cos(2 * pi * f * t);
subplot(411);plot(t,org);
xlabel('time');ylabel('amplitude');
grid;
title('input signal');
fs1 = 8*f;%for an over sampled signal the fs>2*fm
Ts1=1/fs1; % time period for fs1(oversampled)
t1=0:Ts1:5/f;
over = cos(2*pi*f*t1);
subplot(412)
stem(t1,over);
xlabel('time');ylabel('amplitude');
title('over sampled signal');
xr1=zeros(length(t));
N=length(t1);
for x=1:length(t)
    for n=0:N-1
        xr1(x)=xr1(x)+over(n+1)*sin(pi*(t(x)-n*Ts1)/Ts1)./(pi*(t(x)-n*Ts1)/Ts1);
    end
end
subplot(413)
plot(t,xr1);
xlabel('time');ylabel('amplitude');
title('reconstructed signal');
subplot(414);
plot(t,xr1,t,org);
title('comparsion');


