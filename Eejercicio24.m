clear all
close all
clc

%% ===================== Ejercicio 24 =====================
x = [-3; -1; 1; 3];
y = [4; 2; 1; 0];

X = [ones(length(x), 1), x];
B = inv(X' * X) * (X' * y);

b0 = B(1);
b1 = B(2);

fprintf('\n======= Ejercicio 24 =======\n')
fprintf('Modelo: y = %.4f + %.4f·x\n', b0, b1)