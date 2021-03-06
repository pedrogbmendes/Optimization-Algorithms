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

%load the workspace
load('dataC.mat');

% solve optimization problem
cvx_begin
    variable x(4, T+1);% columns are R^4 state vectors
    variable u(2,   T); % columns are R^2 control signal

    f = 0;
    minimize( f );

    %subject to
    x(:,1) == initialx;
    x(:,T+1) == finalx;

    for t = 1:T
        norm( u(:,t)) <= Umax;
    end
    
    for i=1:1:k
        E * x(:, tau(i) + 1) == w(:, i);
    end 

    for t = 1:T
        x(:, t+1) == A * x(:, t) + B * u(:, t);
    end

cvx_end;


captured=0;
for i=1:1:k
    dw = norm(E * x(:, tau(i)+1) - w(:, i), 2);
    
    %disp(dw);
    if dw <= 10^-6
        captured = captured + 1;
    end
end

disp(captured);


plot_graphs(x, u, tau+1, w);
