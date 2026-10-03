## CU-01 — Registrar usuario

**Actor principal:** Administrador
**Actores secundarios:** Base de datos
**Precondiciones:** El administrador ha iniciado sesión con rol Administrador
**Postcondiciones:** El nuevo usuario queda registrado y activo en el sistema

**Flujo normal:**
1. El administrador ingresa al módulo de gestión de usuarios.
2. Selecciona la opción "Registrar nuevo usuario".
3. El sistema muestra el formulario de registro.
4. El administrador ingresa: nombre completo, correo, contraseña y rol.
5. El administrador confirma el registro.
6. El sistema valida que el correo no esté registrado previamente.
7. El sistema cifra la contraseña con bcrypt.
8. El sistema guarda el usuario en la base de datos.
9. El sistema muestra un mensaje de confirmación exitoso.

**Flujos alternativos:**
- 6a. El correo ya existe → el sistema muestra "El correo ya está registrado" y vuelve al paso 4.
- 6b. Algún campo obligatorio está vacío → el sistema muestra "Todos los campos son obligatorios".
- 4a. La contraseña tiene menos de 8 caracteres → el sistema muestra "La contraseña debe tener mínimo 8 caracteres".

**Excepciones:** Si la base de datos no responde, el sistema muestra "Error al conectar con la base de datos".
**RF asociado:** RF01

## CU-02 — Editar usuario

**Actor principal:** Administrador
**Actores secundarios:** Base de datos
**Precondiciones:** El administrador ha iniciado sesión y existe al menos un usuario registrado
**Postcondiciones:** Los datos del usuario quedan actualizados en la base de datos

**Flujo normal:**
1. El administrador ingresa al módulo de gestión de usuarios.
2. El sistema muestra la lista de usuarios registrados.
3. El administrador selecciona un usuario.
4. El sistema muestra el formulario con los datos actuales.
5. El administrador modifica los campos deseados (nombre, correo, rol o estado).
6. El administrador confirma los cambios.
7. El sistema valida que el nuevo correo no esté en uso por otro usuario.
8. El sistema actualiza los datos en la base de datos.
9. El sistema muestra un mensaje de actualización exitosa.

**Flujos alternativos:**
- 7a. El nuevo correo ya existe → el sistema muestra "El correo ya está registrado por otro usuario".
- 6a. No se modificó ningún campo → el sistema muestra "No hay cambios para guardar".

**Excepciones:** Si la base de datos no responde, el sistema muestra "Error al conectar con la base de datos".
**RF asociado:** RF02

## CU-03 — Eliminar usuario

**Actor principal:** Administrador
**Actores secundarios:** Base de datos
**Precondiciones:** El administrador ha iniciado sesión y existe al menos un usuario registrado
**Postcondiciones:** El usuario queda eliminado o desactivado en el sistema

**Flujo normal:**
1. El administrador ingresa al módulo de gestión de usuarios.
2. El sistema muestra la lista de usuarios registrados.
3. El administrador selecciona el usuario que desea eliminar.
4. El administrador solicita su eliminación.
5. El sistema solicita confirmación antes de proceder.
6. El administrador confirma la eliminación.
7. El sistema verifica si el usuario tiene pedidos o registros asociados.
8. Si no tiene registros, el sistema elimina al usuario.
9. El sistema muestra un mensaje de eliminación exitosa.

**Flujos alternativos:**
- 7a. El usuario tiene pedidos asociados → el sistema lo desactiva en lugar de eliminarlo y muestra "El usuario fue desactivado porque tiene registros asociados".
- 6a. El administrador cancela la confirmación → el sistema no realiza cambios.

**Excepciones:** Si la base de datos no responde, el sistema muestra "Error al conectar con la base de datos".
**RF asociado:** RF03


## CU-04 — Gestionar roles

**Actor principal:** Administrador
**Actores secundarios:** Base de datos
**Precondiciones:** El administrador ha iniciado sesión con rol Administrador
**Postcondiciones:** Los roles del sistema quedan creados o modificados

**Flujo normal:**
1. El administrador ingresa al módulo de gestión de roles.
2. El sistema muestra la lista de roles existentes.
3. El administrador selecciona "Crear nuevo rol" o selecciona uno existente.
4. El administrador ingresa o modifica: nombre del rol y permisos asociados.
5. El administrador confirma la operación.
6. El sistema valida que el nombre del rol sea único.
7. El sistema guarda el rol en la base de datos.
8. El sistema muestra un mensaje de confirmación exitoso.

**Flujos alternativos:**
- 6a. El nombre del rol ya existe → el sistema muestra "El rol ya existe".
- 6b. Se intenta eliminar un rol con usuarios asignados → el sistema muestra "No se puede eliminar un rol con usuarios asignados".

**Excepciones:** Si la base de datos no responde, el sistema muestra "Error al conectar con la base de datos".
**RF asociado:** RF04

## CU-05 — Asignar rol a usuario

**Actor principal:** Administrador
**Actores secundarios:** Base de datos
**Precondiciones:** El administrador ha iniciado sesión y existen usuarios y roles registrados
**Postcondiciones:** El usuario queda con el rol actualizado

**Flujo normal:**
1. El administrador ingresa al módulo de gestión de usuarios.
2. El sistema muestra la lista de usuarios con su rol actual.
3. El administrador selecciona un usuario.
4. El administrador cambia el rol del usuario seleccionando uno de la lista.
5. El administrador confirma el cambio.
6. El sistema valida que el rol exista.
7. El sistema actualiza el rol del usuario en la base de datos.
8. El sistema muestra un mensaje de confirmación exitoso.

**Flujos alternativos:**
- 4a. El administrador selecciona el mismo rol que ya tenía → el sistema muestra "El usuario ya tiene ese rol asignado".
- 6a. El rol seleccionado ya no existe → el sistema muestra "El rol seleccionado no está disponible".

**Excepciones:** Si la base de datos no responde, el sistema muestra "Error al conectar con la base de datos".
**RF asociado:** RF04

## CU-06 — Iniciar sesión

**Actor principal:** Usuario registrado (cualquier rol)
**Actores secundarios:** Base de datos, servicio JWT
**Precondiciones:** El usuario está registrado y activo en el sistema
**Postcondiciones:** El usuario accede al sistema con un token JWT válido

**Flujo normal:**
1. El usuario ingresa a la página de inicio de sesión.
2. El sistema muestra el formulario de login.
3. El usuario ingresa su correo y contraseña.
4. El usuario confirma el inicio de sesión.
5. El sistema valida las credenciales contra la base de datos.
6. El sistema verifica que el usuario esté activo.
7. El sistema identifica el rol del usuario.
8. El sistema genera un token JWT con tiempo de expiración.
9. El sistema redirige al dashboard correspondiente según el rol.

**Flujos alternativos:**
- 5a. Las credenciales son incorrectas → el sistema muestra "Correo o contraseña incorrectos" y vuelve al paso 3.
- 6a. El usuario está inactivo → el sistema muestra "Usuario desactivado. Contacte al administrador".
- 5b. El correo no existe → el sistema muestra "Correo o contraseña incorrectos" (no revela cuál falló).

**Excepciones:** Si el servicio JWT no responde, el sistema muestra "Error al generar la sesión. Intente de nuevo".
**RF asociado:** RF05

## CU-07 — Recuperar contraseña

**Actor principal:** Usuario registrado
**Actores secundarios:** Base de datos, servicio de correo
**Precondiciones:** El usuario está registrado en el sistema
**Postcondiciones:** El usuario establece una nueva contraseña

**Flujo normal:**
1. El usuario ingresa a la página de login.
2. Selecciona la opción "¿Olvidó su contraseña?".
3. El sistema muestra un formulario para ingresar el correo.
4. El usuario ingresa su correo registrado.
5. El sistema valida que el correo exista en la base de datos.
6. El sistema genera un token de recuperación con expiración de 30 minutos.
7. El sistema envía un correo con el enlace de recuperación.
8. El usuario abre el enlace y accede al formulario de nueva contraseña.
9. El usuario ingresa y confirma la nueva contraseña.
10. El sistema valida que la contraseña tenga mínimo 8 caracteres.
11. El sistema cifra la nueva contraseña.
12. El sistema actualiza la contraseña en la base de datos.
13. El sistema muestra un mensaje de confirmación exitoso.

**Flujos alternativos:**
- 5a. El correo no existe → el sistema muestra "Si el correo está registrado, recibirá un enlace de recuperación" (no revela si existe o no).
- 10a. La nueva contraseña no cumple los requisitos → el sistema muestra "La contraseña debe tener mínimo 8 caracteres".
- 8a. El enlace ha expirado → el sistema muestra "El enlace ha expirado. Solicite uno nuevo".

**Excepciones:** Si el servicio de correo no responde, el sistema muestra "No se pudo enviar el correo. Intente más tarde".
**RF asociado:** RF06