clear all
close all
clc

data = readtable('/Users/milcacorrea/Desktop/Metodos de Optimizacion Financiera/Matlab/Appletarea.xlsx', 'VariableNamingRule', 'preserve');

y = data.Price(1:100);
x1 = data.High(1:100);
x2 = data.Low(1:100);
X = [x1, x2];

modelo = @(b,X) b(1)*log(1 + abs(X(:,1))) + ...
                b(2)*cos(X(:,2)) + ...
                b(3)*X(:,1).*X(:,2) + ...
                b(4);
beta0 = [1, 1, 0.1, 1];

mdl = fitnlm(X, y, modelo, beta0);
coef = mdl.Coefficients.Estimate;

nuevo_X = [214.86, 210.64];
nuevo_y = predict(mdl, nuevo_X);

disp(['El valor estimado de Price es: $', num2str(nuevo_y, '%.2f')]);
disp('Coeficientes del modelo:');
disp(coef);

x1_range = linspace(min(x1), max(x1), 40);
x2_range = linspace(min(x2), max(x2), 40);
[X1_grid, X2_grid] = meshgrid(x1_range, x2_range);
X_grid = [X1_grid(:), X2_grid(:)];
y_grid = predict(mdl, X_grid);
Y_grid = reshape(y_grid, size(X1_grid));

figure;
hold on;
surf(X1_grid, X2_grid, Y_grid, 'FaceAlpha', 0.8, 'EdgeColor', 'none');
colormap parula;
scatter3(X(:,1), X(:,2), y, 25, 'k', 'filled');
scatter3(nuevo_X(1), nuevo_X(2), nuevo_y, 100, 'r', 'filled');
xlabel('High');
ylabel('Low');
zlabel('Price');
title('Regresión No Lineal Múltiple - Superficie y Nuevo Punto');
legend('Superficie ajustada', 'Datos reales', 'Nuevo punto predicho');
view(45, 30); 
grid on;
