clc; clear all; close all;
%% Set Parameters
F = 0.2239; 
omega = (2*pi)/10;

%% Solve and Plot for epsilon [1,5]
for epsilon = 1:0.01:5
    fun = @(t,x) [x(2);(epsilon./omega).*(1-(x(1).^2)).*x(2) - x(1) + epsilon.*F.*cos(omega.*t)];
    [t1,x1] = ode45(fun,0:5:300,[-2,2]);
    eps = epsilon*ones(length(x1),1);
    plot(eps,x1(:,1),".","markersize",2)
    hold on
end
title(' \epsilon = [1, 5] ')
xlabel('\epsilon')
ylabel('x')
hold off

% Solve and Plot for epsilon [4.65,4.95]
figure(2)
for v = 4.65:0.0005:4.95
    fun2 = @(s,y) [y(2);(v./omega).*(1-(y(1).^2)).*y(2) - y(1) + v.*F.*cos(omega.*s)];
    [t2,x2] = ode45(fun2,0:5:300,[1,0]);
    eps2 = v*ones(length(x2),1);
    plot(eps2,x2(:,1),".","markersize",2)
   hold on
end
title(' \epsilon = [4.65, 4.95] ')
xlabel('\epsilon')
ylabel('x')