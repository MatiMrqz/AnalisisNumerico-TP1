## EJERCICIO N2 - Calculo integral por Simpson multiple

## Calculo para distintos valores de N
 format long; ## Seteo precision en 8 decimales

 # Valores iniciales
 t0=0; tf=0.5;
 iN=[4,6,8,12];
 data=[];

 ## Funcion a integrar
 f = @(x) sin(pi*x);

 ## Calculo exacto integral definida
 ex_value = integral(f,t0,tf);

for n=1:(length(iN))

   #Calculo del dt para el N actual
   dt=(tf-t0)/iN(n);

   # Discretizado de funcion f(x)
   [t, yt] = vector_factory(f,t0,tf,iN(n));

   # Calculo por Simpson Multiple
   iSim = simpson_multiple(yt,dt);

   # Armado de tabla con resultados
   data=[data; [iN(n) dt iSim abs(iSim-ex_value) log10(dt) log10(abs(iSim-ex_value))]];

endfor

 ## Calculo de pendiente por cada dt
 for k=2:rows(data)
   p = (abs(data(k,6)) - abs(data((k-1),6))) / (abs(data(k,5)) - abs(data((k-1),5)));
   data(k,7) = p;
 endfor

 # Render de tablas y titulos
 f = figure ("Name","Trabajo Practico N1");
 uicontrol('Style', 'text','unit','normalized', 'Position', [0 0.95 1 0.05], 'String', "Ejercicio N2: Integración sin(pi*x) con Simpson Multiple");
 uitable(f,'Data',data,'ColumnName',{"N","dt","ISim","Er","Log(dt)","Log(Er)","Pendiente"},'unit','normalized','Position',[0 0 1 0.95]);



