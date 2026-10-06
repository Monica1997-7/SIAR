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

# Historias de Usuario (Módulo Menú)

## HU08 - Registrar producto

Como administrador  
Quiero registrar nuevos productos en el menú  
Para que estén disponibles para ser agregados a los pedidos

**Criterios de aceptación:**

- El formulario solicita: nombre, descripción (opcional), precio y categoría
- El nombre del producto debe ser único en el sistema
- El precio debe ser un valor numérico mayor que cero
- La categoría se selecciona de la lista de categorías existentes
- El producto se registra por defecto como disponible
- El sistema confirma el registro exitoso
- Si faltan datos obligatorios o son inválidos, el sistema muestra un error

**Prioridad:** Alta  
**RF asociado:** RF07  
**Estimación:** 6 horas

## HU09 - Editar producto

Como administrador  
Quiero modificar los datos de un producto existente  
Para mantener el menú actualizado (precios, nombres y categorías)

**Criterios de aceptación:**

- El sistema muestra la lista de productos registrados
- Se puede seleccionar un producto para editar
- Se pueden modificar: nombre, descripción, precio y categoría
- Si se cambia el nombre, debe validarse que no exista otro producto igual
- El sistema valida la información modificada antes de guardar
- Los cambios de precio no alteran los pedidos ya facturados
- El sistema confirma la actualización exitosa

**Prioridad:** Alta  
**RF asociado:** RF08  
**Estimación:** 5 horas

## HU10 - Eliminar producto

Como administrador  
Quiero eliminar productos del menú  
Para retirar los platos o bebidas que el restaurante ya no ofrece

**Criterios de aceptación:**

- El sistema muestra la lista de productos registrados
- Se puede seleccionar un producto para eliminar
- El sistema pide confirmación antes de eliminar
- Si el producto tiene pedidos asociados, se desactiva en lugar de eliminarse
- El producto eliminado o desactivado deja de aparecer en el menú
- El sistema confirma la eliminación exitosa

**Prioridad:** Media  
**RF asociado:** RF09  
**Estimación:** 4 horas

## HU11 - Gestionar categorías

Como administrador  
Quiero crear y administrar las categorías del menú  
Para organizar los productos (entradas, platos fuertes, bebidas, postres)

**Criterios de aceptación:**

- El sistema permite crear categorías nuevas
- Cada categoría tiene un nombre único
- Se pueden asignar productos a una categoría
- Se puede modificar el nombre y la descripción de una categoría
- No se puede eliminar una categoría que tenga productos asociados
- El sistema confirma cada operación exitosa

**Prioridad:** Media  
**RF asociado:** RF10  
**Estimación:** 6 horas

## HU12 - Cambiar disponibilidad del producto

Como administrador  
Quiero marcar un producto como disponible o no disponible  
Para evitar que los meseros ofrezcan productos agotados durante el servicio

**Criterios de aceptación:**

- El sistema permite seleccionar un producto de la lista
- El estado de disponibilidad puede ser: disponible o no disponible
- El cambio se guarda en la base de datos
- El cambio se refleja de inmediato en el menú
- Un producto no disponible no puede agregarse a un pedido (RF18)
- El sistema confirma el cambio exitoso

**Prioridad:** Alta  
**RF asociado:** RF11  
**Estimación:** 4 horas


# Historias de Usuario (Módulo Pedidos)

## HU13 - Crear pedido

Como mesero  
Quiero seleccionar una mesa y crear un pedido agregando los productos solicitados por el cliente  
Para registrar el consumo y enviarlo a cocina de forma organizada

**RF asociado:** RF17  
**Estimación:** 8 horas

## HU14 - Agregar productos a un pedido existente

Como mesero  
Quiero agregar productos a un pedido ya creado  
Para atender solicitudes adicionales del cliente sin tener que generar un nuevo pedido

**RF asociado:** RF18  
**Estimación:** 5 horas

## HU15 - Modificar pedido

Como mesero  
Quiero modificar las cantidades o productos de un pedido  
Para corregir errores o cambios solicitados por el cliente antes de que sea facturado

**RF asociado:** RF19  
**Estimación:** 6 horas

## HU16 - Cancelar pedido

Como mesero o administrador  
Quiero cancelar un pedido que aún no ha sido facturado  
Para liberar la mesa y corregir errores de registro

**RF asociado:** RF20  
**Estimación:** 4 horas

## HU17 - Enviar pedido a cocina

Como mesero  
Quiero confirmar y enviar el pedido a cocina  
Para que el cocinero reciba la notificación y comience la preparación de los productos

**RF asociado:** RF21  
**Estimación:** 6 horas

## HU18 - Consultar estado del pedido

Como mesero, cocinero o cajero  
Quiero consultar el estado actual de un pedido  
Para dar seguimiento a su progreso desde que se crea hasta que se factura

**RF asociado:** RF22  
**Estimación:** 5 horas
