# Historias de Usuario (Módulo Usuarios) 

 

## HU01 - Registrar usuarios. 

Como administrador  

Quiero registrar nuevos usuarios en el sistema  

Para que puedan acceder según su rol asignado 

 

**Criterios de aceptación:**

- El formulario solicita: nombre completo, correo, contraseña y rol 

- El correo debe ser único en el sistema 

- La contraseña debe tener mínimo 8 caracteres 

- La contraseña se almacena cifrada con bcrypt 

- El rol se selecciona de la lista: Administrador, Cajero, Mesero, Cocinero 

- El sistema confirma el registro exitoso 

- Si el correo ya existe, el sistema muestra un error 

 

**Prioridad:** Alta  

**RF asociado:** RF01 

**Estimación:** 8 horas 

 

## HU02 - Editar usuario 

Como administrador  

Quiero editar los datos de un usuario existente  

Para mantener la información actualizada y corregir errores 

 

Criterios de aceptación: 

El sistema muestra la lista de usuarios registrados 

Se puede seleccionar un usuario para editar 

Se pueden modificar: nombre, correo y rol 

Si se cambia el correo, debe validarse que no exista otro igual 

Se puede cambiar el estado del usuario (activo/inactivo) 

El sistema confirma la actualización exitosa 

Los cambios quedan registrados en la base de datos 

 

Prioridad: Alta  

RF asociado: RF02  

Estimación: 6 horas 

 

HU03 - Eliminar usuario 

Como administrador  

Quiero eliminar o desactivar usuarios del sistema  

Para revocar el acceso de empleados que ya no laboran en el restaurante 

 

Criterios de aceptación: 

El sistema muestra la lista de usuarios registrados 

Se puede seleccionar un usuario para eliminar 

El sistema pide confirmación antes de eliminar 

El usuario eliminado no puede volver a iniciar sesión 

Si el usuario tiene pedidos asociados, se desactiva en lugar de eliminarse 

El sistema confirma la eliminación exitosa 

Los cambios quedan registrados en la base de datos 

 

Prioridad: Alta  

RF asociado: RF03  

Estimación: 5 horas 

 

HU04 - Gestionar roles 

Como administrador  

Quiero crear y administrar los roles del sistema  

Para definir qué permisos tiene cada tipo de usuario 

 

Criterios de aceptación: 

El sistema permite crear roles nuevos 

Cada rol tiene un nombre único 

Se pueden asignar permisos específicos a cada rol 

Los roles predefinidos son: Administrador, Cajero, Mesero, Cocinero 

Se puede modificar el nombre y los permisos de un rol existente 

No se puede eliminar un rol que tenga usuarios asignados 

El sistema confirma cada operación exitosa 

 

Prioridad: Alta  

RF asociado: RF04  

Estimación: 8 horas 

 

HU05 - Asignar rol a usuario 

Como administrador  

Quiero asignar o modificar el rol de un usuario  

Para controlar el acceso a las funciones del sistema según sus responsabilidades 

 

 

Criterios de aceptación: 

El sistema muestra la lista de usuarios con su rol actual 

Se puede seleccionar un usuario y cambiar su rol 

El cambio de rol se refleja inmediatamente en los permisos del usuario 

El sistema valida que el rol exista 

El sistema confirma el cambio exitoso 

Los cambios quedan registrados en la base de datos 

El usuario afectado debe volver a iniciar sesión para que se apliquen los cambios 

 

Prioridad: Alta  

RF asociado: RF04  

Estimación: 6 horas 

 

HU-06 — Iniciar sesión 

Como usuario registrado (cualquier rol)  

Quiero iniciar sesión con mi correo y contraseña  

Para acceder a las funciones del sistema según mi rol 

 

Criterios de aceptación: 

El formulario solicita correo y contraseña 

El sistema valida las credenciales contra la base de datos 

El sistema verifica que el usuario esté activo 

El sistema identifica el rol del usuario 

El sistema genera un token JWT con tiempo de expiración 

El sistema redirige al dashboard correspondiente al rol 

Si las credenciales son incorrectas, muestra un mensaje de error 

Si el usuario está inactivo, deniega el acceso 

 

Prioridad: Alta  

RF asociado: RF05  

Estimación: 8 horas 

 

 

HU07 - Recuperar contraseña 

Como usuario registrado  

Quiero recuperar mi contraseña cuando la olvide  

Para poder volver a acceder al sistema sin ayuda del administrador 

 

Criterios de aceptación: 

El formulario solicita el correo registrado 

El sistema valida que el correo exista en la base de datos 

El sistema envía un enlace o código de recuperación al correo 

El enlace tiene tiempo de expiración (ej. 30 minutos) 

El usuario puede establecer una nueva contraseña 

La nueva contraseña se valida (mínimo 8 caracteres) 

La nueva contraseña se almacena cifrada 

El sistema confirma el cambio exitoso 

 

Prioridad: Media  

RF asociado: RF06  

Estimación: 6 horas 

## Módulo Menú

### HU-08 — Crear producto

**Como** administrador
**Quiero** crear nuevos productos en el menú
**Para** ofrecerlos a los clientes y mantener actualizada la carta

**Criterios de aceptación:**
- [ ] El formulario solicita: nombre, precio, categoría y descripción
- [ ] El nombre del producto debe ser único
- [ ] El precio debe ser mayor a 0
- [ ] Se asigna una categoría de la lista existente
- [ ] El producto se crea con estado "disponible" por defecto
- [ ] El sistema confirma la creación exitosa

**Prioridad:** Alta
**RF asociado:** RF07
**Estimación:** 6 horas

### HU-09 — Modificar producto

**Como** administrador
**Quiero** modificar los datos de un producto existente
**Para** corregir errores o actualizar precios

**Criterios de aceptación:**
- [ ] El sistema muestra la lista de productos
- [ ] Se puede seleccionar un producto para editar
- [ ] Se pueden modificar: nombre, precio, categoría y descripción
- [ ] El sistema valida que el nuevo nombre no exista
- [ ] El sistema confirma la actualización exitosa
- [ ] Los cambios quedan registrados en la base de datos

**Prioridad:** Alta
**RF asociado:** RF08
**Estimación:** 5 horas

### HU-10 — Eliminar producto

**Como** administrador
**Quiero** eliminar productos del menú
**Para** retirar platos que ya no se ofrecen

**Criterios de aceptación:**
- [ ] El sistema muestra la lista de productos
- [ ] Se puede seleccionar un producto para eliminar
- [ ] El sistema pide confirmación antes de eliminar
- [ ] Si el producto tiene pedidos asociados, se desactiva en lugar de eliminarse
- [ ] El sistema confirma la eliminación exitosa

**Prioridad:** Alta
**RF asociado:** RF09
**Estimación:** 4 horas

### HU-11 — Categorizar productos

**Como** administrador
**Quiero** crear y administrar categorías de productos
**Para** organizar el menú por tipos de platos

**Criterios de aceptación:**
- [ ] El sistema permite crear categorías nuevas
- [ ] Cada categoría tiene un nombre único
- [ ] Se pueden asignar productos a categorías
- [ ] Se pueden modificar los nombres de las categorías
- [ ] No se puede eliminar una categoría con productos asociados
- [ ] El sistema confirma cada operación exitosa

**Prioridad:** Alta
**RF asociado:** RF10
**Estimación:** 6 horas

### HU-12 — Gestionar disponibilidad

**Como** administrador
**Quiero** cambiar el estado de disponibilidad de un producto
**Para** indicar rápidamente qué platos están disponibles o agotados

**Criterios de aceptación:**
- [ ] El sistema muestra la lista de productos con su estado actual
- [ ] Se puede cambiar el estado (disponible / no disponible)
- [ ] El cambio se refleja inmediatamente en el menú
- [ ] El sistema confirma el cambio exitoso
- [ ] Los cambios quedan registrados en la base de datos

**Prioridad:** Media
**RF asociado:** RF11
**Estimación:** 4 horas