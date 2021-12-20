%% Set Parameters for differential equation
F = 0.2239; 
omega = (2*pi)/10;
epsilon = 1.8*pi;

%% Solve Differential Equation
fun = @(t,x) [x(2);(epsilon./omega).*(1-(x(1).^2)).*x(2) - x(1) + epsilon.*F.*cos(omega.*t)];
[t1,x1] = ode45(fun,[0,300],[1,0]);

%% Plot Phase Plane 
plot(x1(:,1),x1(:,2))
title("Phase Plane Plot of a Particular Solution")
xlabel("x")
ylabel("dx/dt")
grid on
ylim([-20,20])