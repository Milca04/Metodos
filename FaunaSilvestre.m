clear all
close all
clc

%% ===================== Fauna Silvestre =====================
x = [100; 120; 140];
y = [75; 68; 55];

X = [ones(length(x), 1), x];
B = inv(X' * X) * (X' * y);

b0 = B(1);
b1 = B(2);

fprintf('\n======= Ejercicio Fauna Silvestre =======\n')
fprintf('Modelo: y = %.4f + %.4f·x\n', b0, b1)

% Gráfico
Xp = linspace(min(x), max(x), 100)';
Yp = b0 + b1 * Xp;
figure
plot(Xp, Yp, 'r-', 'LineWidth', 2); hold on; grid on;
plot(x, y, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
title('Modelo de regresión lineal - Reproducción de ciervos')
legend('Modelo de regresión', 'Datos reales', 'Location', 'southwest')

% Tabla de comparación
y_est = b0 + b1 * x;
T = table(x, y, y_est, y - y_est, ...
    'VariableNames', {'Hembras', 'Porcentaje_Real', 'Porcentaje_Estimado', 'Error'});
disp('Tabla comparativa (Fauna Silvestre):')
disp(T)

% Estimación para 170 hembras
y_170 = b0 + b1 * 170;
fprintf('Estimación para 170 hembras: %.2f%% con crías\n', y_170)

% Estimación inversa: cuántas hembras para 40% con crías
x_dado = (40 - b0) / b1;
fprintf('Estimación para 40%% con crías: %.2f hembras\n', x_dado)
