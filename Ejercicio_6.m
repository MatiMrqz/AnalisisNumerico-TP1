function Ejercicio_6
## EJERCICIO N6
t0=0; tf=3;N=10;p=2;
G0=0;
f=@(x) e.^(-p*x)

[t, yt] = vector_factory(f,t0,tf,N);

dt=(tf-t0)/N;
G1 = G0*ones((N+1),1)+(dt/2).*genMatrizTrapMultiples(N+1)*(yt)';

f= figure (1);
plot(t,G1, 'o', 'MarkerSize',5);
hold on;
plot(t,yt, 'o','MarkerSize', 5);
hold off;
xlabel('t');
ylabel('Integral');
title(sprintf('I = ∫e^-pt dt, N = %d',N));
legend('∫e^-pt dt','e^-pt', 'Location', 'Northeast');
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
