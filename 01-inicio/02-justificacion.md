# Justificación

## 1. Justificación técnica

Actualmente los restaurantes pequeños y medianos de Cali manejan
su operación con herramientas separadas: cuadernos para pedidos,
Excel para cuentas, y a veces un software viejo que solo imprime
recibos. Esto hace que la información esté dispersa y sea difícil
de consultar. Una aplicación web resuelve esto porque centraliza
toda la información en un solo lugar y permite consultarla desde
cualquier dispositivo con Internet: una tablet en la mesa, un
computador en caja, o un celular en la cocina. Además, no hay
que instalar nada en cada equipo; se actualiza sola.

Para construir el sistema se eligió Java 21 con Spring Boot 3.
Java es un lenguaje muy usado en la industria, lo que garantiza
que haya documentación y soporte. Spring Boot simplifica la
programación del backend (la parte que procesa los datos) y trae
herramientas ya hechas para seguridad, bases de datos y pruebas.
Spring Security, en particular, permite manejar el login y los
permisos por rol de forma segura, cumpliendo con los
requerimientos RNF04 (contraseñas cifradas) y RNF05 (control
de acceso por roles).

Como base de datos se eligió PostgreSQL 15. Es un sistema
gratuito, robusto y confiable: garantiza que las operaciones
se completen correctamente o no se hagan, evitando datos a
medias. Además, soporta roles y permisos nativos, lo que
facilita la gestión de usuarios del sistema. Su integración
con Java a través de JPA/Hibernate permite trabajar con clases
Java en lugar de escribir SQL a mano, lo que reduce errores.

Finalmente, el proyecto aplicará patrones de diseño formales:
MVC (separar datos, pantallas y lógica), Repository (centralizar
el acceso a la base de datos), Factory (crear objetos de forma
controlada) y Observer (notificar cambios entre módulos, por
ejemplo cuando un pedido pasa a cocina). Estos patrones
garantizan que el código sea ordenado, fácil de mantener y
de extender en el futuro.

## 2. Justificación académica

El proyecto SIAR se alinea con los tres resultados de aprendizaje
de la asignatura:

1. **Implementación de prototipos funcionales aplicando patrones
   de diseño.** El sistema aplicará al menos cuatro patrones
   (MVC, Repository, Factory y Observer) en módulos concretos,
   con justificación técnica documentada. Esto permite demostrar
   en la práctica cómo los patrones mejoran la calidad del código.

2. **Realización de pruebas unitarias, integración y funcionales.**
   Se utilizarán JUnit 5 y Mockito para probar cada módulo de
   forma automática, alcanzando una cobertura mínima del 70%
   medida con JaCoCo. Esto garantiza que el sistema funcione
   correctamente antes de entregarlo.

3. **Documentación, despliegue y entrega del software.** Se
   elaborarán manuales técnico y de usuario, se documentará la
   API con Swagger UI, y el sistema se desplegará en Internet
   con disponibilidad mínima del 95%. Esto simula un entorno
   real de trabajo profesional.

Cada resultado se evidencia en entregables concretos por corte,
lo que permite evaluar el progreso de forma objetiva.

## 3. Justificación económica y social

Económicamente, SIAR reduce las pérdidas que actualmente
representan entre el 10% y el 15% de las ventas diarias. Al
digitalizar los pedidos, el inventario y la facturación, se
cometen menos errores humanos y se aprovechan mejor los
insumos. El dueño obtiene reportes en tiempo real que le
permiten tomar decisiones basadas en datos: saber qué platos
se venden más, qué días hay menos clientes, y dónde se está
perdiendo dinero.

Socialmente, el sistema mejora las condiciones laborales de
los empleados. Los roles bien definidos eliminan la confusión
de responsabilidades y reducen el estrés. Los meseros dejan
de correr con libretas, los cocineros reciben pedidos claros,
y los cajeros facturan sin errores. El resultado es un ambiente
de trabajo más sano y un servicio más rápido para el cliente.

Tecnológicamente, SIAR representa la digitalización de un
negocio que operaba de forma manual. Esto genera datos
históricos que pueden usarse para planear el crecimiento del
restaurante sin perder el control.

## 4. Viabilidad

### 4.1 Viabilidad técnica

El equipo cuenta con conocimientos básicos en Java, Spring Boot
y PostgreSQL. El stack seleccionado es gratuito, ampliamente
documentado y con una comunidad activa. La curva de aprendizaje
es manejable dado el plazo de 16 semanas.

### 4.2 Viabilidad económica

El proyecto no requiere inversión en licencias. Todas las
herramientas son gratuitas: Java 21, Spring Boot 3, PostgreSQL
15, VS Code, GitHub, y plataformas de despliegue como Render
o Railway. El costo total del proyecto es $0.

### 4.3 Viabilidad operativa

Los usuarios finales (administradores, cajeros, meseros y
cocineros) tienen conocimientos básicos de navegación web. La
interfaz será intuitiva y responsiva, construida con React y
Bootstrap 5. No se requiere capacitación extensiva porque el
sistema está diseñado para ser autoexplicativo.

## 5. Conclusión

SIAR es un proyecto técnica, académica, económica y
operativamente viable. Resuelve el problema descrito en el
documento anterior, se alinea con los resultados de aprendizaje
de la asignatura, y aprovecha un stack moderno, gratuito y
ampliamente utilizado en la industria. Su implementación
permitirá a los restaurantes pequeños y medianos de Cali
competir en igualdad de condiciones con cadenas más grandes,
gracias al uso inteligente de la tecnología.