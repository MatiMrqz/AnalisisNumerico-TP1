function [t_out,yt_out] = vector_factory(f,t0,tf,N)
   dt=(tf-t0)/N;

   ##Generar vectores t() e yt() para la función seno
   for k=1:(N+1)
    t(k)=dt*(k-1);
    yt(k)=f(t(k));
   endfor
   t_out=t;
   yt_out=yt;
endfunction
