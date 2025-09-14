## EJERCICIO N1

## Calculo para distintos valores de N
 format long; ## Seteo precision en 8 decimales

 # Valores iniciales
 t0=0; tf=0.5;
 iN=[10,20,40,80];
 data=[];
 im_err_data=[];
 itrap_err_data=[];


 ## Funcion a integrar
 f = @(x) sin(pi*x);

 ## Calculo exacto integral definida
 ex_value = integral(f,t0,tf);

for n=1:(length(iN))

   #Calculo del dt para el N actual
   dt=(tf-t0)/iN(n);

   # Discretizado de funcion f(x)
   [t, yt] = vector_factory(f,t0,tf,iN(n));

   # Calculo por método de im
   im = dt*sum(yt(1:(end-1)));
   # Calculo por método de iM
   iM = dt*sum(yt);
   # Calculo por trapecios multiples
   iTrap = trapecios_multiples(yt,dt);

   # Armado de tabla con resultados
   data=[data; [iN(n) dt im iM iTrap]];

   # Calculo del error im
   im_err_data = [im_err_data; [dt im (ex_value - im) log10(dt) log10(ex_value - im)]];

   # Calculo del error con trapecios multiples
   itrap_err_data = [itrap_err_data; [dt iTrap (ex_value - iTrap) log10(dt) log10(ex_value - iTrap)]];

endfor

 ## Calculo de pendiente por cada dt
 for k=2:rows(im_err_data)
   p = (abs(im_err_data(k,5)) - abs(im_err_data((k-1),5))) / (abs(im_err_data(k,4)) - abs(im_err_data((k-1),4)));
   im_err_data(k,6) = p;
   p2 = (abs(itrap_err_data(k,5)) - abs(itrap_err_data((k-1),5))) / (abs(itrap_err_data(k,4)) - abs(itrap_err_data((k-1),4)));
   itrap_err_data(k,6) = p2;
 endfor

 # Render de tablas y titulos
 f = figure ("Name","Trabajo Practico N1");
 columns = {"N","dt","im","iM","iTrap"};
 txt_title = uicontrol('Style', 'text','unit','normalized', 'Position', [0 0.94 1 0.06], 'String', "Ejercicio N1 - Integral de sin(wt) entre 0 y 0.5 \n Calculo mediante im iM y Trapecios Múltiples");
 t=uitable(f,'Data',data,'ColumnName',columns,'unit','normalized','Position',[0 0.66 1 0.28]);
 txt_title = uicontrol('Style', 'text','unit','normalized', 'Position', [0 0.61 1 0.05], 'String', "Error con im \n Cálculo de la Pendiente:");
 er_t = uitable(f,'Data',im_err_data,'ColumnName',{"dt","im","Er","Log(dt)","Log(Er)","Pendiente"},'unit','normalized','Position',[0 0.33 1 0.28]);
 txt_title = uicontrol('Style', 'text','unit','normalized', 'Position', [0 0.28 1 0.05], 'String', "Error con i Trapecios Multiples \n Cálculo de la Pendiente:");
 er_t2 = uitable(f,'Data',itrap_err_data,'ColumnName',{"dt","im","Er","Log(dt)","Log(Er)","Pendiente"},'unit','normalized','Position',[0 0 1 0.28]);



