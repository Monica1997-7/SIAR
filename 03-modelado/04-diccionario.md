# Diccionario de Datos — Módulo Usuarios

## Tabla: roles

| Campo | Tipo | Restricción | Descripción |
|-------|------|-------------|-------------|
| id_rol | SERIAL | PK | Identificador único del rol |
| nombre | VARCHAR(50) | UNIQUE, NOT NULL | Nombre del rol |
| permisos | TEXT | — | Permisos asociados al rol |

## Tabla: usuarios

| Campo | Tipo | Restricción | Descripción |
|-------|------|-------------|-------------|
| id_usuario | SERIAL | PK | Identificador único del usuario |
| nombre | VARCHAR(100) | NOT NULL | Nombre completo |
| correo | VARCHAR(150) | UNIQUE, NOT NULL | Correo electrónico |
| password_hash | VARCHAR(255) | NOT NULL | Contraseña cifrada |
| rol_id | INT | FK → roles(id_rol) | Rol asignado |
| activo | BOOLEAN | DEFAULT TRUE | Estado del usuario |
| creado_en | TIMESTAMP | DEFAULT NOW() | Fecha de creación |

# Diccionario de Datos — Módulo Menú

## Tabla: categorias

| Campo | Tipo | Restricción | Descripción |
|-------|------|-------------|-------------|
| id_categoria | SERIAL | PK | Identificador único de la categoría |
| nombre | VARCHAR(50) | UNIQUE, NOT NULL | Nombre de la categoría (Entradas, Bebidas, etc.) |
| descripcion | VARCHAR(200) | — | Descripción de la categoría |

## Tabla: productos

| Campo | Tipo | Restricción | Descripción |
|-------|------|-------------|-------------|
| id_producto | SERIAL | PK | Identificador único del producto |
| nombre | VARCHAR(100) | UNIQUE, NOT NULL | Nombre del producto |
| descripcion | TEXT | — | Descripción del producto |
| precio | NUMERIC(10,2) | NOT NULL, CHECK > 0 | Precio de venta del producto |
| categoria_id | INT | FK → categorias(id_categoria), NOT NULL | Categoría a la que pertenece |
| disponible | BOOLEAN | DEFAULT TRUE | Indica si el producto puede pedirse en este momento |
| activo | BOOLEAN | DEFAULT TRUE | Indica si el producto sigue en el menú (baja lógica) |
| creado_en | TIMESTAMP | DEFAULT NOW() | Fecha de creación del producto |

# Diccionario de Datos — Módulo Pedidos

## Tabla: pedidos

| Campo | Tipo | Restricción | Descripción |
|-------|------|-------------|-------------|
| id_pedido | SERIAL | PK | Identificador único del pedido |
| id_mesa | INT | FK → mesas(id_mesa), NOT NULL | Mesa a la que pertenece el pedido |
| id_usuario | INT | FK → usuarios(id_usuario), NOT NULL | Mesero que registró el pedido |
| fecha_hora | TIMESTAMP | DEFAULT NOW() | Fecha y hora de creación del pedido |
| estado | VARCHAR(20) | NOT NULL, DEFAULT 'Pendiente', CHECK | Estado: Pendiente, En preparación, Listo, Entregado, Facturado o Cancelado |
| total | NUMERIC(10,2) | NOT NULL, DEFAULT 0, CHECK >= 0 | Total del pedido (suma de subtotales) |

## Tabla: detalle_pedido

| Campo | Tipo | Restricción | Descripción |
|-------|------|-------------|-------------|
| id_detalle | SERIAL | PK | Identificador único del detalle |
| id_pedido | INT | FK → pedidos(id_pedido), NOT NULL | Pedido al que pertenece el detalle |
| id_producto | INT | FK → productos(id_producto), NOT NULL | Producto solicitado |
| cantidad | INT | NOT NULL, CHECK > 0 | Unidades solicitadas del producto |
| subtotal | NUMERIC(10,2) | NOT NULL, CHECK >= 0 | Valor de la línea (cantidad × precio al momento del pedido) |

> Nota: el estado `Cancelado` se incluye en la restricción CHECK porque CU-16 (Cancelar pedido) lo utiliza, aunque no aparece en la enumeración `EstadoPedido` del diagrama de clases.