-- ============================================
-- Script SQL — Proyecto SIAR
-- Módulos Usuarios, Menú y Pedidos
-- ============================================

-- ============================================
-- Módulo Usuarios
-- Autor: Mónica Ortiz Ossa
-- ============================================

-- ============================================
-- Tabla: roles
-- Almacena los roles del sistema
-- ============================================
CREATE TABLE roles (
  id_rol SERIAL PRIMARY KEY,
  nombre VARCHAR(50) UNIQUE NOT NULL,
  permisos TEXT
);

-- ============================================
-- Tabla: usuarios
-- Almacena los usuarios del sistema
-- ============================================
CREATE TABLE usuarios (
  id_usuario SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  correo VARCHAR(150) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  rol_id INT REFERENCES roles(id_rol),
  activo BOOLEAN DEFAULT TRUE,
  creado_en TIMESTAMP DEFAULT NOW()
);

-- ============================================
-- Índices
-- ============================================
CREATE INDEX idx_usuarios_correo ON usuarios(correo);
CREATE INDEX idx_usuarios_rol ON usuarios(rol_id);

-- ============================================
-- Datos iniciales
-- ============================================
INSERT INTO roles (nombre, permisos) VALUES
  ('Administrador', 'todos'),
  ('Cajero', 'facturacion,pedidos'),
  ('Mesero', 'pedidos,mesas'),
  ('Cocinero', 'pedidos');

-- ============================================
-- Módulo Menú
-- Autor: Omar Rivera
-- ============================================

-- ============================================
-- Tabla: categorias
-- Almacena las categorías del menú
-- ============================================
CREATE TABLE categorias (
  id_categoria SERIAL PRIMARY KEY,
  nombre VARCHAR(50) UNIQUE NOT NULL,
  descripcion VARCHAR(200)
);

-- ============================================
-- Tabla: productos
-- Almacena los productos del menú
-- ============================================
CREATE TABLE productos (
  id_producto SERIAL PRIMARY KEY,
  nombre VARCHAR(100) UNIQUE NOT NULL,
  descripcion TEXT,
  precio NUMERIC(10,2) NOT NULL CHECK (precio > 0),
  categoria_id INT NOT NULL REFERENCES categorias(id_categoria),
  disponible BOOLEAN DEFAULT TRUE,
  activo BOOLEAN DEFAULT TRUE,
  creado_en TIMESTAMP DEFAULT NOW()
);

-- ============================================
-- Índices
-- ============================================
CREATE INDEX idx_productos_categoria ON productos(categoria_id);
CREATE INDEX idx_productos_disponible ON productos(disponible);

-- ============================================
-- Datos iniciales
-- ============================================
INSERT INTO categorias (nombre, descripcion) VALUES
  ('Entradas', 'Platos para comenzar'),
  ('Platos fuertes', 'Platos principales'),
  ('Bebidas', 'Bebidas frías y calientes'),
  ('Postres', 'Postres y dulces');

-- ============================================
-- Módulo Pedidos
-- Autor: Andrés Felipe Reyes
-- Dependencias: usuarios (módulo Usuarios), productos (módulo Menú)
-- y mesas (módulo Mesas) deben existir antes de crear estas tablas.
-- ============================================

-- ============================================
-- Tabla: pedidos
-- Almacena los pedidos de cada mesa
-- ============================================
CREATE TABLE pedidos (
  id_pedido SERIAL PRIMARY KEY,
  id_mesa INT NOT NULL REFERENCES mesas(id_mesa),
  id_usuario INT NOT NULL REFERENCES usuarios(id_usuario),
  fecha_hora TIMESTAMP DEFAULT NOW(),
  estado VARCHAR(20) NOT NULL DEFAULT 'Pendiente'
    CHECK (estado IN ('Pendiente','En preparación','Listo',
                      'Entregado','Facturado','Cancelado')),
  total NUMERIC(10,2) NOT NULL DEFAULT 0 CHECK (total >= 0)
);

-- ============================================
-- Tabla: detalle_pedido
-- Almacena los productos de cada pedido
-- ============================================
CREATE TABLE detalle_pedido (
  id_detalle SERIAL PRIMARY KEY,
  id_pedido INT NOT NULL REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
  id_producto INT NOT NULL REFERENCES productos(id_producto),
  cantidad INT NOT NULL CHECK (cantidad > 0),
  subtotal NUMERIC(10,2) NOT NULL CHECK (subtotal >= 0)
);

-- ============================================
-- Índices
-- ============================================
CREATE INDEX idx_pedidos_mesa ON pedidos(id_mesa);
CREATE INDEX idx_pedidos_estado ON pedidos(estado);
CREATE INDEX idx_detalle_pedido ON detalle_pedido(id_pedido);
