## EJERCICIO N3

## Calculo para distintos valores de N
 format long; ## Seteo precision en 8 decimales

 # Valores iniciales
 w=2;
 t0=0; tf=6/w;
 iN=[6 12 18 24];

 ## Funcion a integrar
 f = @(x) e.^-(w*x);

 ## Calculo exacto integral definida
 ex_value = integral(f,t0,tf);

for n=1:(length(iN))

   #Calculo del dt para el N actual
   dt=(tf-t0)/iN(n);

   # Discretizado de funcion f(x)
   [t, yt] = vector_factory(f,t0,tf,iN(n));

   # Calculo por Sumas de Riemann im
   im(n) = dt*sum(yt(1:(end-1)));
   # Calculo por método de iM
   iM(n) = dt*sum(yt);
   # Calculo por trapecios multiples
   iTrap(n) = trapecios_multiples(yt,dt);
endfor

   f= figure (1);
   plot(iN,im, 'o-b', 'LineWidth', 1.5, 'MarkerFaceColor','b');
   hold on;
   plot(iN,iM, 's-r','LineWidth', 1.5, 'MarkerFaceColor', 'r');
   plot(iN,iTrap, '^-c','LineWidth',1.5,'MarkerFaceColor','c');
   plot([iN(1) iN(end)],[ex_value ex_value],'--k', 'LineWidth',1.5);
   hold off;
   xlabel('N');
   ylabel('Integral');
   title(sprintf('I = ∫e^{-w t} dt, w = %.3f',w));
   legend('Riemann Izq', 'Riemann Der', 'Trapecios', 'Exacta', 'Location', 'Northeast');
   grid on;
