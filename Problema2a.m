clear all
close all
clc

data = readtable('/Users/milcacorrea/Desktop/Metodos de Optimizacion Financiera/Matlab/Appletarea.xlsx', 'VariableNamingRule', 'preserve');
X = data.Open(1:80);
Y = data.Price(1:80);

grado = 3;
coef = polyfit(X, Y, grado);

x_new = 211.5;
y_new = polyval(coef, x_new);

x_curve = linspace(min(X), max(X), 200);
y_curve = polyval(coef, x_curve);

figure;
scatter(X, Y, 'filled'); hold on;
plot(x_curve, y_curve, 'r-', 'LineWidth', 2);
plot(x_new, y_new, 'y*', 'LineWidth', 2, 'MarkerSize', 10)
title('Regresión Polinomial de Grado 3');
xlabel('Open (USD)');
ylabel('Price (USD)');
legend('Datos reales', 'Curva ajustada', 'Valor predicho');
legend('Location', 'southeast');
grid on;

fprintf('Valor estimado de Price cuando Open = %.1f: %.2f USD\n', x_new, y_new);

disp('Coeficientes del modelo:');
disp(coef);
