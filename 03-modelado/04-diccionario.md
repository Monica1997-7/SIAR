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