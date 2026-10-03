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