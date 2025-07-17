clc;
clear all;
close all;

%% Datos
% Clase +1
x1 = [0.10; 0.15; 0.12; 0.11; 0.14];
x3 = [20; 22; 21; 19; 20.5];
X_pos = [x1 x3];
y_pos = ones(5,1);

% Clase -1
x1 = [0.30; 0.28; 0.32; 0.35; 0.31];
x3 = [15; 14; 13; 12; 14.5];
X_neg = [x1 x3];
y_neg = -ones(5,1);

% Concatenar datos
X = [X_pos; X_neg];
y = [y_pos; y_neg];
N = size(X,1);

%% LS-SVM
gamma = 1;
kernel = @(x,z) x*z'; % lineal

Omega = zeros(N,N);
for i = 1:N
    for j = 1:N
        Omega(i,j) = kernel(X(i,:), X(j,:));
    end
end

Omegabar = Omega + (1/gamma)*eye(N);
uno = ones(N,1);
A = [0 uno'; uno Omegabar];
bvec = [0; y];
sol = A \ bvec;
b = sol(1);
alpha = sol(2:end);

%% Visualización
[x1Grid, x3Grid] = meshgrid(0:0.005:0.45, 10:0.1:24);
[n1, n2] = size(x1Grid);
Xtest = [x1Grid(:) x3Grid(:)];
f = zeros(size(Xtest,1),1);

for i = 1:size(Xtest,1)
    suma = 0;
    for j = 1:N
        suma = suma + alpha(j) * kernel(X(j,:), Xtest(i,:));
    end
    f(i) = suma + b;
end

f_class = reshape(sign(f), n1, n2);

figure; hold on;
contourf(x1Grid, x3Grid, f_class, [-1 0 1], 'k', 'LineWidth', 1.2)
colormap([1 0.9 0.9; 0.9 0.9 1]);
scatter(X_pos(:,1), X_pos(:,2), 80, 'r', 'filled', 'DisplayName', 'Clase +1');
scatter(X_neg(:,1), X_neg(:,2), 80, 'b', 'filled', 'DisplayName', 'Clase -1');
title('Clasificación binaria con LS-SVM (Kernel lineal)');
xlabel('$x_1$', 'Interpreter','latex');
ylabel('$x_3$', 'Interpreter','latex');
legend('Location', 'best');  
grid on;
