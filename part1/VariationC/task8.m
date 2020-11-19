%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%               Optimization and Algorithms
%
%                   Part1 of the Project
%
%
%
%   Authors: 
%         - Duarte Dias,  81356,  duarte.ferreira.dias@tecnico.ulisboa.pt
%         - Miguel Pinho, 80826,  miguel.m.pinho@tecnico.ulisboa.pt
%         - Pedro Mendes, 81046,  pedrogoncalomendes@tecnico.ulisboa.pt
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;

x = -3:0.05:3;
phi = x;

for i=1:1:length(x)
   if phi(i) ~= 0
       phi(i) = 1;
   end
end

x_hat = -2:0.05:0;
chord = -0.5 * x_hat;

figure(1);
hold on;

f = plot(x, phi);
g = plot(x_hat, chord);
line([-1 -1], [0.5 1], 'Color', 'green', 'LineStyle', '--');
scatter([-1 -1], [0.5 1], 'MarkerEdgeColor', 'green', 'MarkerFaceColor', 'green', 'LineWidth', 1.5);

axis([-3 3 -0.5 1.5]);
xlabel('x');
legend([f g], 'phi(x)', 'chord');

saveas(figure(1), 'Figures/task8/nonconvex.pdf');