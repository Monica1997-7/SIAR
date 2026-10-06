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

## CU-08 — Registrar producto

**Actor principal:** Administrador
**Actores secundarios:** Base de datos
**Precondiciones:** El administrador ha iniciado sesión con rol Administrador y existe al menos una categoría registrada
**Postcondiciones:** El nuevo producto queda registrado y disponible en el menú

**Flujo normal:**
1. El administrador ingresa al módulo de gestión de menú.
2. Selecciona la opción "Registrar nuevo producto".
3. El sistema muestra el formulario de registro.
4. El administrador ingresa: nombre, descripción, precio y categoría.
5. El administrador confirma el registro.
6. El sistema valida la información ingresada.
7. El sistema asigna el producto a la categoría seleccionada.
8. El sistema registra el producto en la base de datos.
9. El sistema muestra un mensaje de confirmación exitoso.

**Flujos alternativos:**
- 6a. Algún campo obligatorio está vacío → el sistema muestra "Todos los campos obligatorios deben completarse".
- 6b. El precio no es un número mayor que cero → el sistema muestra "El precio debe ser mayor que cero".
- 6c. Ya existe un producto con ese nombre → el sistema muestra "El producto ya está registrado".

**Excepciones:** Si la base de datos no responde, el sistema muestra "Error al conectar con la base de datos".
**RF asociado:** RF07

## CU-09 — Editar producto

**Actor principal:** Administrador
**Actores secundarios:** Base de datos
**Precondiciones:** El administrador ha iniciado sesión y existe al menos un producto registrado
**Postcondiciones:** Los datos del producto quedan actualizados en la base de datos

**Flujo normal:**
1. El administrador ingresa al módulo de gestión de menú.
2. El sistema muestra la lista de productos existentes.
3. El administrador selecciona un producto.
4. El sistema muestra el formulario con los datos actuales.
5. El administrador modifica los campos deseados (nombre, descripción, precio o categoría).
6. El sistema valida la información modificada.
7. El sistema guarda los cambios en la base de datos.
8. El sistema muestra un mensaje de actualización exitosa.

**Flujos alternativos:**
- 6a. El nuevo nombre ya existe en otro producto → el sistema muestra "El producto ya está registrado".
- 6b. El precio no es válido → el sistema muestra "El precio debe ser mayor que cero".
- 5a. No se modificó ningún campo → el sistema muestra "No hay cambios para guardar".

**Excepciones:** Si la base de datos no responde, el sistema muestra "Error al conectar con la base de datos".
**RF asociado:** RF08

## CU-10 — Eliminar producto

**Actor principal:** Administrador
**Actores secundarios:** Base de datos
**Precondiciones:** El administrador ha iniciado sesión y existe al menos un producto registrado
**Postcondiciones:** El producto queda eliminado o desactivado y deja de aparecer en el menú

**Flujo normal:**
1. El administrador ingresa al módulo de gestión de menú.
2. El sistema muestra la lista de productos existentes.
3. El administrador selecciona un producto.
4. El administrador solicita su eliminación.
5. El sistema solicita confirmación antes de proceder.
6. El administrador confirma la eliminación.
7. El sistema verifica si el producto tiene pedidos asociados.
8. Si no tiene pedidos, el sistema actualiza la base de datos eliminando el producto.
9. El sistema muestra un mensaje de eliminación exitosa.

**Flujos alternativos:**
- 7a. El producto tiene pedidos asociados → el sistema lo desactiva en lugar de eliminarlo y muestra "El producto fue desactivado porque tiene pedidos asociados".
- 6a. El administrador cancela la confirmación → el sistema no realiza cambios.

**Excepciones:** Si la base de datos no responde, el sistema muestra "Error al conectar con la base de datos".
**RF asociado:** RF09

## CU-11 — Gestionar categorías

**Actor principal:** Administrador
**Actores secundarios:** Base de datos
**Precondiciones:** El administrador ha iniciado sesión con rol Administrador
**Postcondiciones:** Las categorías del menú quedan creadas, modificadas o eliminadas, con sus productos asignados

**Flujo normal:**
1. El administrador ingresa al módulo de gestión de categorías.
2. El sistema muestra la lista de categorías existentes.
3. El administrador selecciona "Crear nueva categoría" o selecciona una existente.
4. El administrador ingresa o modifica el nombre y la descripción de la categoría.
5. El administrador asigna o retira productos de la categoría, si corresponde.
6. El administrador confirma la operación.
7. El sistema valida que el nombre de la categoría sea único.
8. El sistema guarda los cambios en la base de datos.
9. El sistema muestra un mensaje de confirmación exitoso.

**Flujos alternativos:**
- 7a. El nombre de la categoría ya existe → el sistema muestra "La categoría ya existe".
- 3a. El administrador intenta eliminar una categoría con productos asociados → el sistema muestra "No se puede eliminar una categoría con productos asociados".

**Excepciones:** Si la base de datos no responde, el sistema muestra "Error al conectar con la base de datos".
**RF asociado:** RF10

## CU-12 — Cambiar disponibilidad del producto

**Actor principal:** Administrador
**Actores secundarios:** Base de datos
**Precondiciones:** El administrador ha iniciado sesión y existe al menos un producto registrado
**Postcondiciones:** El producto queda marcado como disponible o no disponible, y el menú refleja el cambio

**Flujo normal:**
1. El administrador ingresa al módulo de gestión de menú.
2. El sistema muestra la lista de productos con su estado de disponibilidad.
3. El administrador selecciona un producto.
4. El administrador cambia el estado de disponibilidad (disponible / no disponible).
5. El administrador confirma el cambio.
6. El sistema guarda el cambio en la base de datos.
7. El sistema refleja el nuevo estado en el menú.
8. El sistema muestra un mensaje de confirmación exitoso.

**Flujos alternativos:**
- 4a. El administrador selecciona el mismo estado que ya tenía → el sistema muestra "El producto ya se encuentra en ese estado".

**Excepciones:** Si la base de datos no responde, el sistema muestra "Error al conectar con la base de datos".
**RF asociado:** RF11

## CU-13 — Crear pedido

**Actor principal:** Mesero
**Precondiciones:** El mesero ha iniciado sesión en el sistema. La mesa seleccionada se encuentra disponible u ocupada por el mismo cliente.
**Postcondiciones:** Queda registrado un nuevo pedido en estado "Pendiente", asociado a la mesa y al mesero, visible para cocina.

**Flujo normal:**
1. El mesero selecciona la mesa correspondiente.
2. El sistema crea un nuevo pedido asociado a esa mesa.
3. El mesero agrega uno o varios productos del menú al pedido.
4. El mesero confirma el pedido.
5. El sistema envía el pedido a cocina y cambia su estado a "Pendiente".

**Flujos alternativos:**
- 1a. La mesa no está disponible → el sistema notifica al mesero y no permite crear el pedido.

**RF asociado:** RF17

## CU-14 — Agregar productos a un pedido existente

**Actor principal:** Mesero
**Precondiciones:** Existe un pedido activo (no facturado ni cancelado) asociado a la mesa.
**Postcondiciones:** El pedido queda actualizado con los nuevos productos y su total recalculado.

**Flujo normal:**
1. El mesero selecciona el pedido existente.
2. El mesero agrega uno o más productos nuevos.
3. El sistema valida la disponibilidad de cada producto.
4. El sistema actualiza el total del pedido.
5. El sistema guarda los cambios.

**Flujos alternativos:**
- 3a. Algún producto no está disponible → el sistema lo informa y no lo agrega al pedido.

**RF asociado:** RF18

## CU-15 — Modificar pedido

**Actor principal:** Mesero
**Precondiciones:** El pedido existe y no ha sido facturado.
**Postcondiciones:** El pedido refleja los productos y cantidades actualizados, con su total recalculado.

**Flujo normal:**
1. El mesero consulta el pedido.
2. El mesero modifica productos o cantidades.
3. El sistema valida que los cambios sean consistentes (disponibilidad, cantidades válidas).
4. El sistema actualiza el total del pedido.
5. El sistema guarda los cambios.

**Flujos alternativos:**
- 1a. El pedido ya fue facturado → el sistema rechaza la modificación.

**RF asociado:** RF19

## CU-16 — Cancelar pedido

**Actor principal:** Mesero / Administrador
**Precondiciones:** El pedido existe y no ha sido facturado.
**Postcondiciones:** El pedido queda marcado como cancelado y la mesa asociada vuelve a estar disponible.

**Flujo normal:**
1. El usuario consulta el pedido.
2. El usuario solicita la cancelación.
3. El sistema valida que el pedido no esté facturado.
4. El sistema solicita confirmación.
5. El usuario confirma la cancelación.
6. El sistema actualiza el estado del pedido a "Cancelado" y libera la mesa.

**Flujos alternativos:**
- 3a. El pedido ya fue facturado → el sistema impide la cancelación e informa al usuario.

**RF asociado:** RF20

## CU-17 — Enviar pedido a cocina

**Actor principal:** Mesero
**Precondiciones:** El pedido contiene al menos un producto. El pedido se encuentra en estado "Pendiente".
**Postcondiciones:** El cocinero recibe la notificación del nuevo pedido y el estado queda en "En preparación".

**Flujo normal:**
1. El mesero confirma el pedido.
2. El sistema envía el pedido a cocina.
3. El sistema notifica al cocinero.
4. El sistema cambia el estado del pedido a "En preparación".

**Flujos alternativos:**
- 1a. El pedido no tiene productos agregados → el sistema no permite enviarlo a cocina.

**RF asociado:** RF21

## CU-18 — Consultar estado del pedido

**Actor principal:** Mesero / Cocinero / Cajero
**Precondiciones:** El pedido existe en el sistema.
**Postcondiciones:** El usuario conoce el estado real del pedido y, si corresponde, el estado queda actualizado.

**Flujo normal:**
1. El usuario consulta el pedido.
2. El sistema muestra el estado actual (Pendiente, En preparación, Listo, Entregado o Facturado).
3. El usuario (según su rol) actualiza el estado conforme avanza la preparación o entrega.

**Flujos alternativos:**
- 1a. El pedido no existe o fue eliminado → el sistema informa que no se encontró el registro.

**RF asociado:** RF22
