clear all
lambda = 2;

soma = 0;

%Distribuição de Poisson
for i=0:1
    Px = (lambda^i * exp(-lambda))/factorial(i);
    soma = soma + Px;
end

fprintf("Probabilidade de existir no máximo um erro num livro de 100 páginas = %0.4f \n", soma)

%Probabilidade aleatória - 
%experiencias = rand(100,1e5) < 0.02;
% cfav = sum(sum(experiencias) <2);
% prob = cfav/1e5