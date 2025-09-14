# 📘 Ejercicios de Integración Numérica en GNU Octave

Este repositorio contiene la **implementación en GNU/Octave** de los ejercicios de **Integración Numérica** planteados en la cátedra de **Métodos Numéricos – UTN FRM**.
El objetivo es desarrollar, ejecutar y analizar distintos métodos de integración aproximada, evaluando sus errores y comparando los resultados con las soluciones analíticas conocidas.

---

## 📑 Contenido de los ejercicios

### **Ejercicio 1 – Integración de la función seno en ¼ del período**

* Función: \$y = \sin(\pi t)\$, con \$t \in \[0, 0.5]\$.
* Métodos aplicados:

  * **Suma de Riemann**
  * **Trapecios Múltiples**
* Se comparan resultados con el valor exacto \$I = 1/\pi\$ y se analiza la convergencia del error.

---

### **Ejercicio 2 – Método de Simpson Múltiple**

* Integral de \$y = \sin(\pi t)\$ en el intervalo $\[0, 0.5]\$.
* Implementación en Octave del **Método de Simpson Múltiple**.
* Se estudia la convergencia del error y el orden del método.

---

### **Ejercicio 3 – Integración de la función exponencial**

* Función: \$y(t) = e^{-wt}\$.
* Se estudia para distintos valores de \$w\$ (ej: \$w=2\$ y \$w=0.5\$).
* Métodos aplicados:

  * **Trapecios Múltiples**
  * **Suma de Riemann**
* Se comparan resultados numéricos con la solución exacta.

---

### **Ejercicio 4 – Integración de funciones trigonométricas**

* Aplicación de **propiedades de ortogonalidad** en integrales de senos y cosenos.
* Implementación de Trapecios y Suma de Riemann para verificar los resultados teóricos.

---

### **Ejercicio 5 – Obtención de la función integral de \$\sin(\pi t)\$**

* Se calcula la **primitiva numérica** mediante el método de **Trapecios Múltiples**.
* Se implementa un programa en Octave para generar la función integral \$G(t)\$.
* Comparación entre la versión discreta y la solución exacta.

---

### **Ejercicio 6 – Integral de \$y(t) = e^{pt}\$**

* Se calcula la primitiva para distintos valores de \$p\$.
* Implementación numérica en Octave y comparación con la solución analítica.
* Estudio de la convergencia según el número de intervalos \$N\$.

---

### **Ejercicio 7 – Integral de \$y(t) = e^{pt}\sin(wt)\$**

* Obtención de la función integral usando **Trapecios Múltiples**.
* Estudio de la aproximación para \$N=50\$ y \$N=100\$.
* Comparación entre las distintas discretizaciones.

---

## 🛠️ Tecnologías utilizadas

* **GNU Octave / MATLAB**
* Scripts organizados por ejercicio.
* Uso de `linspace`, `plot`, y funciones propias para integración numérica.

---

## 🚀 Ejecución de los programas

1. Clonar este repositorio:

   ```bash
   git clone https://github.com/usuario/integracion-numerica-octave.git
   ```
2. Abrir Octave en la carpeta del proyecto.
3. Ejecutar el script correspondiente a cada ejercicio, por ejemplo:

   ```octave
   ejercicio1.m
   ```

---

## 📊 Resultados esperados

* Tablas con valores aproximados de las integrales.
* Gráficos de comparación entre métodos numéricos y soluciones exactas.
* Análisis de error y convergencia para cada método.

---

## 📖 Referencias

* **Apunte: Integración Numérica – Ejercicios 2023 (UTN FRM)**
* Métodos numéricos aplicados a ingeniería – UTN FRM.
