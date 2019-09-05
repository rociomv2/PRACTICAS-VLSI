# PRÁCTICA-2: Registros de Corrimiento

# Equipo:
Castillo Del Valle Gabriela Aideé,
Durán Romero José Arturo,
Landín Martínez Uri Raquel,
Valdés Vargas Rocío Montserrat

# Descripción:
Diseñar un sistema de monitoreo de variables físicas que está constituido por 8 sensores. Se desea implementar
un sistema automático que permita realizar la selección de 4 de los 8 sensores simultáneamente en cada
instante de tiempo, de tal forma que, en el primer instante, se deberán activar en nivel alto los canales
asociados a los sensores S0, S3, S4 y S7, donde S0 es el sensor asociado al LSB y S7 al MSB.
En el segundo instante deberán estar activos S2, S3, S6 y S7, y así sucesivamente hasta regresar al estado
inicial, para repetir la secuencia nuevamente.

Por otra parte, el diseño debe considerar que mediante un selector (switch) la dirección en que se corren los
bits puede ser invertida respecto al caso anterior. Finalmente, debe existir la posibilidad de regresar al
sistema a su estado inicial mediante un botón de RESET (señal asíncrona)
# Link del video
https://www.youtube.com/watch?v=jRz9rHqhBTY&rel=0
