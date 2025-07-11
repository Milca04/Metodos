clear all
close all
clc

%% ===================== Energía Eólica =====================
x = [2009; 2010; 2011; 2012; 2013];
y = [0.72; 0.92; 1.17; 1.34; 1.60];

X = [ones(length(x), 1), x];
B = inv(X' * X) * (X' * y);

b0 = B(1);
b1 = B(2);

fprintf('\n======= Ejercicio Energía Eólica =======\n')
fprintf('Modelo: y = %.6f + %.6f·x\n', b0, b1)

anio = 2014;
consumo_estimado = b0 + b1 * anio;
fprintf('Consumo estimado para el año %d: %.4f cuatrillones de BTU\n', anio, consumo_estimado)
