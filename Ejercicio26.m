clear all
close all
clc

%% ===================== Ejercicio 26 =====================
x = [0; 4; 5; 8; 10];
y = [6; 3; 0; -4; -5];

X = [ones(length(x), 1), x];
B = inv(X' * X) * (X' * y);

b0 = B(1);
b1 = B(2);

fprintf('\n======= Ejercicio 26 =======\n')
fprintf('Modelo: y = %.4f + %.4f·x\n', b0, b1)
