clear all
close all
clc

%% ===================== Ferretería =====================
x = [25; 30; 35; 40];
y = [82; 75; 67; 55];

X = [ones(length(x), 1), x];
B = inv(X' * X) * (X' * y);

b0 = B(1);
b1 = B(2);

fprintf('\n======= Ejercicio Ferretería =======\n')
fprintf('Modelo: y = %.4f + %.4f·x\n', b0, b1)

precio = 32.95;
demanda_estim = b0 + b1 * precio;
fprintf('Demanda estimada para $%.2f: %.2f unidades\n', precio, demanda_estim)
