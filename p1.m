clc;clear

a=0.17;b=0.02;hy=0.1;
KR1=180;c=0.85;
f=0.001;g=0.0022;hm=0.18;
hf=0.2;
I=0.4;KF=120;
m=0.14;
L=0.85-0.46;
k=0.1;
f=@(t,x)[-a*x(1)-b*x(1)+hy*x(4);
        c*x(2)*(1-(x(2)/KR1))-b*x(1)*x(2);
        (0.85-((0.85-0.46)/(1+exp(-k*(x(2)-20)))))*x(1)-f*x(6)*x(3)-hm*x(3);
        (1-(0.85-((0.85-0.46)/(1+exp(-k*(x(2)-20))))))*x(1)-f*x(4)-hf*x(4);
        I*x(5)*(1-(x(5)/KF))-g*x(5)*(x(3)+x(4));
        -m*x(6)+f*x(6)*(x(3)+x(4))
        ];
% [t,x]=ode45(f,[0,1000],[20,50,1,1,50,1]);
N=1000;
[t,x]=rk_4(f,[0,400],[20,80,1,1,50,10],N);%N:分辨率,把时间长度划分成N+1份。
t=t/6;
figure(1)
hold on
% plot(t, x(:,1), 'DisplayName', 'Larva population',LineWidth=1.5);
% plot(t, x(:,2), 'DisplayName', 'Phytoplankton quantity',LineWidth=1.5);
plot(t, x(:,3), 'DisplayName', 'Adult male population',LineWidth=1.5);
plot(t, x(:,4), 'DisplayName', 'Adult female population',LineWidth=1.5);
plot(t, x(:,5), 'DisplayName', 'Fish Lice population',LineWidth=1.5);
plot(t, x(:,6), 'DisplayName', 'nematode population',LineWidth=1.5);
legend('show');
hold off
figure(2)
plot(x(:,3),x(:,4));title('phase of male and female');xlabel('male');ylabel('female');
figure(3)
plot(t,x(:,3)./x(:,4));title('male:female',LineWidth=1.5);