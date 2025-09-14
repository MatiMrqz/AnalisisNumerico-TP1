function Ejercicio_5
## EJERCICIO N5
t0=0; tf=0.5;N=5;
G0=-1/pi;
f=@(x) sin(pi*x);

[t, yt] = vector_factory(f,t0,tf,N);

dt=(tf-t0)/N;
G1 = G0*ones((N+1),1)+(dt/2).*genMatrizTrapMultiples(N+1)*(yt)';
G2 = algoIntegralCTrap(yt,G0,N,dt);

disp("Comparativa Matriz vs Algoritmo: Metodo matricial:");
disp(G1);
disp("Metodo algoritmico:");
disp(G2');

f= figure (1);
plot(t,G1, '.', 'LineWidth', 1.5, 'MarkerFaceColor','b');
hold on;
plot(t,yt, '.','LineWidth', 1.5, 'MarkerFaceColor', 'r');
hold off;
xlabel('t');
ylabel('Integral');
title(sprintf('I = ∫sin(πt) dt, N = %d',N));
legend('∫sin(πt) dt','sin(πt)', 'Location', 'Northeast');
grid on;

end

## SUBFUNCIONES
function M = genMatrizTrapMultiples(dim)
  % Tamaño de la matriz
  n = dim;

  % Inicializar matriz de ceros
  A = zeros(n);

  % Construir la matriz
  for i = 1:n
      for j = 1:i
          if j == 1 || j == i
              A(i,j) = 1;     % primera columna siempre vale 1 (excepto fila 1)
          else
              A(i,j) = min(2, j);  % columnas posteriores: crecen hasta 2
          end
      end
  end
  A(1,1) = 0;

  M = A;

end

#Metodo sin matrices
function R = algoIntegralCTrap (yt,G0,N, dt)
  Trap = 0; Gd(1)=G0;
  for k=1:N
    Trap=dt*((yt(k)+yt(k+1))/2);
    Gd(k+1)=Gd(k)+Trap;
  endfor
  R=Gd;
end
