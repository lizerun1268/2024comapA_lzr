%% ly
tao1=16;
by=0.1;dy=0.5;hy=0.5;e=0.5;hf=0.5;
w=[-10:0.01:10];
w=w';
y1=atan( ( w-sin(w*tao1) )./( dy+by-hy*e*hf*cos(w*tao1) ) );
figure(1)
plot(w,y1);
%% lm
tao2=12;
w=[-15:0.01:15];
w=w';
omegam=0.78;
pm=0.5;
y2=atan( ( 0.5*pm*by*sin(w*tao2)+w )./( omegam-0.5*pm*by*cos(w*tao2) ) );
figure(2)
plot(w,y2);
%% lf
tao3=10;
w=[-15:0.01:15];
w=w';
omegaf=1.26;
pf=0.3;
y3=atan( ( 0.5*pf*by*sin(w*tao3)+w )./( omegaf-0.5*pf*by*cos(w*tao3) ) );
figure(3)
plot(w,y3);