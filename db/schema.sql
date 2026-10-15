-- ============================================
-- Script SQL — Proyecto SIAR
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