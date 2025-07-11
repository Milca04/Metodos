clear all
close all
clc

%% ===================== Ejercicio 25 =====================
x = [-5; -1; 3; 7; 5];
y = [10; 8; 6; 4; 5];

X = [ones(length(x), 1), x];
B = inv(X' * X) * (X' * y);

b0 = B(1);
b1 = B(2);

fprintf('\n======= Ejercicio 25 =======\n')
fprintf('Modelo: y = %.4f + %.4f·x\n', b0, b1)
