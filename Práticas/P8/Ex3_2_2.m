% 2. Considere sequencias de dígitos ímpares de 1 a 9 com as seguintes propriedades:
    %
    % Começam por 9;
    % 2ª posição: 1 ou 3, com igual probabilidade;
    % 3ª posição e seguintes podem aparecer 3, 5 ou 9;
    %
    % Os inícios de sequencia 913, 915 e 919 sao equiprovaveis;
    % 2ª -> 3ª posição, P(3 -> 5) = 0.6 e P (3->3) = 0 
    % 3ª posição em diante as probabilidades s˜ao as assinaladas na figura abaixo.

      % ->   9_p1    1_p2    3_p2    3_p3+    5_p3+    9_p3+    FIM
% 9_p1                  0.5       0.5    
% 1_p2                                          1/3         1/3         1/3
% 3_p2                                                        0.6         0.4
% 3_p3+                                        0.2         0.5                      0.3
% 5_p3+                                        0.1         0.4         0.3        0.2
% 9_p3+                                                      0.3         0.3        0.4
% FIM                                                                                      1


%% (a) Complete o diagrama de estados abaixo (incompleto!...) relativo `a cadeia de Markov correspondente 
% indicando todos os estados e transicoes poss´ıveis segundo o enunciado. 
% Crie em Matlab a matriz de transicao de estados (T) correspondente.

T = [0 0.5 0.5 0 0 0 0; 0 0 0 1/3 1/3 1/3 0; 0 0 0 0 0.6 0.4 0; 0 0 0 0.2 0.5 0 0.3; 0 0 0 0.1 0.4 0.3 0.2; 0 0 0 0 0.3 0.3 0.4; 0 0 0 0 0 0 1]';

%% (b) Qual a probabilidade de uma sequencia de 7 dígitos iniciada por 91 e terminada em 9 ?

N = 1e5; %Nº experiencias

Seq7_91 = 0;    %Contador da alínea c) 
Seq7_91__9 = 0; %Contador da alínea b)

aux = crawl(T,1,7);

for i=1: N
    aux = crawl(T,1,7); %gerar sequência
    if length(aux) == 7 %comp = 7
        if aux(1,2) == 2    %seq "91....."
            Seq7_91 = Seq7_91 + 1;
            if aux(1, end-1) == 6 %seq"91.....9"
                Seq7_91__9 = Seq7_91__9 + 1;
            end   
        end
    end
end

probB = Seq7_91__9 /N;
fprintf("b) Probabilidade de uma sequência de 7 dígitos iniciada por 91 e terminada em 9: %.5f\n", probB);

%% (c) Qual a probabilidade de sequencias de 7 dígitos iniciadas por 91 ?

probC = Seq7_91/N;
fprintf("c) Probabilidade de sequências de 7 dígitos iniciadas por 91: %.5f\n ", probC);
