clear all
close all
clc

%% ===================== Ejercicio 23 =====================
x = [-5; 1; 2; 2];
y = [1; 3; 3; 5];

X = [ones(length(x), 1), x];
B = inv(X' * X) * (X' * y);

b0 = B(1);
b1 = B(2);

fprintf('\n======= Ejercicio 23 =======\n')
fprintf('Modelo: y = %.4f + %.4f·x\n', b0, b1)





