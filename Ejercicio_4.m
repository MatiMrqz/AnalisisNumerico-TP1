## EJERCICIO N4

## Calculo para distintos valores de N
 format long; ## Seteo precision en 8 decimales

 # Valores iniciales
 t0=0; tf=2*pi;
 k=3; m=3;
 iN=[10 20 30 40];
 data=[];

 ## Funcion a integrar
 f = @(x) sin(k*x).*sin(m*x);

 ## Calculo exacto integral definida
 ex_value = integral(f,t0,tf);

for n=1:(length(iN))

   #Calculo del dt para el N actual
   dt=(tf-t0)/iN(n);

   # Discretizado de funcion f(x)
   [t, yt] = vector_factory(f,t0,tf,iN(n));

   # Calculo por Trapecios Multiples
   iTrap = trapecios_multiples(yt,dt);
   # Calculo por método de im
   im = dt*sum(yt(1:(end-1)));
   # Calculo por método de iM
   iM = dt*sum(yt);

   # Armado de tabla con resultados
   data=[data; [iN(n) dt ex_value iTrap im iM]];

endfor

 # Render de tablas y titulos
 f = figure ("Name","Trabajo Practico N1");
 uicontrol('Style', 'text','unit','normalized', 'Position', [0 0.95 1 0.05], 'String', sprintf("Ejercicio N4: Integración sin(pi*x) con k=%d, m=%d",k,m));
 uitable(f,'Data',data,'ColumnName',{"N","dt","Ex","Er","Log(dt)","Log(Er)"},'unit','normalized','Position',[0 0 1 0.95]);


