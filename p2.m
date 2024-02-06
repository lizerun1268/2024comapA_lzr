clear;clc
a=0.17;b=0.02;hy=0.1;
KR1=180;c=0.85;
f=0.001;g=0.0022;hm=0.18;
hf=0.2;
I=0.4;KF=120;
m=0.04;
L=0.85-0.46;
k=0.1;
s=0.003;
f=@(t,y,z) [-a*y(1)+b*y(1)*y(2)+hy*y(4);
            c*y(2)*(1-(y(2)/KR1))-b*y(1)*y(2);
            (0.85-((L)/(1+exp(-k*(y(2)-20)))))*y(1)-0.01*y(6)*y(3)-hm*y(3)-0.003*(y(3)+y(4))*y(3);
            (1-(0.85-((L)/(1+exp(-k*(y(2)-20))))))*y(1)-0.032*y(6)*y(4)-hf*y(4)-0.003*(y(3)+y(4))*y(4);
            I*y(5)*(1-(y(5)/KF))-g*y(5)*(y(3)+y(4));
            -m*y(6)+f*y(6)*(y(3)+y(4))*(1-(y(6)/(y(3)+y(4))))
            ];

sol = dde23(f,48,[20,80,1,1,50,10],[0,5000]);
sol.x=sol.x/6;

figure(1)
hold on
plot(sol.x,sol.y(1,:), 'DisplayName', 'Larva population',LineWidth=1.5);
plot(sol.x,sol.y(2,:), 'DisplayName', 'Amount of organic plankton',LineWidth=1.5);
plot(sol.x,sol.y(3,:), 'DisplayName', 'Adult male population',LineWidth=1.5);
plot(sol.x,sol.y(4,:), 'DisplayName', 'Adult female population',LineWidth=1.5);
plot(sol.x,sol.y(5,:), 'DisplayName', 'Lake trout population',LineWidth=1.5);
plot(sol.x,sol.y(6,:), 'DisplayName', 'Arctic pike population',LineWidth=1.5);
legend('show');
hold off

figure(2)
plot(sol.y(3,:),sol.y(4,:));title('phase of male and female');xlabel('male');ylabel('female');
figure(3)
plot(sol.x,sol.y(3,:)./sol.y(4,:));title('male:female');