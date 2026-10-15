# Stack Tecnológico — SIAR

## Lenguaje principal
- **TypeScript 5**
- **Justificación:** Lenguaje tipado que se compila a JavaScript.
  Permite detectar errores en tiempo de desarrollo y se integra
  naturalmente con React y Node.js.

## Frontend
- **Tecnología:** React 18 + TypeScript + Bootstrap 5
- **Justificación:** React permite construir interfaces por
  componentes. TypeScript añade tipado fuerte. Bootstrap 5
  acelera el diseño responsivo (RNF01) con componentes
  preconstruidos.

## Backend
- **Tecnología:** Node.js 20 + Express 4 + TypeScript
- **Justificación:** Node.js permite ejecutar TypeScript en el
  servidor. Express es minimalista y permite construir APIs
  REST con pocas líneas.
- **Arquitectura:** MVC en capas (Controller → Service → Repository).

## Base de datos
- **Tecnología:** PostgreSQL 15
- **Justificación:** Base de datos relacional, gratuita y robusta.
  Soporta roles y permisos nativos (RF04).

## Conexión TypeScript ↔ PostgreSQL
- **Tecnología:** Prisma o TypeORM
- **Justificación:** ORM que permite mapear clases TypeScript a
  tablas PostgreSQL sin escribir SQL manualmente.
- **Nota:** se aprenderá durante el proyecto.

## Pruebas
- **Framework:** Jest + Supertest
- **Cobertura mínima:** 70% (RNF09)
- **Nota:** se aprenderá durante el proyecto.

## Gestor de dependencias
- **Tecnología:** npm (o pnpm)
- **Nota:** se aprenderá durante el proyecto.

## Documentación de API
- **Tecnología:** Swagger UI (con swagger-jsdoc)
- **Nota:** se aprenderá durante el proyecto.

## Control de versiones
- Git + GitHub (RNF08)

## IDE
- Visual Studio Code

## Despliegue
- **Frontend:** Vercel o Netlify
- **Backend:** Render o Railway
- **Base de datos:** Neon o Supabase (PostgreSQL gratuito)
- **Nota:** se aprenderá en el corte 3.

## Resumen del stack

| Capa | Tecnología | ¿Visto en clase? |
|------|-----------|-------------------|
| Lenguaje | TypeScript 5 |  Sí |
| Frontend | React 18 + TS + Bootstrap 5 | Sí |
| Backend | Node.js + Express + TS | Sí |
| BD | PostgreSQL 15 | Sí |
| Conexión | Prisma o TypeORM |  Por aprender |
| Pruebas | Jest + Supertest |  Por aprender |
| Build | npm |  Por aprender |
| API Docs | Swagger UI |  Por aprender |
| Despliegue | Vercel + Render |  Por aprender |
| Versionamiento | Git + GitHub |  Sí |
| IDE | VS Code |  Sí |

## Módulos del proyecto

| Corte | Módulos |
|-------|---------|
| 1 | Usuarios, Menú |
| 2 | Pedidos, Inventario |
| 3 | Facturación, Reservas |

## ¿Por qué TypeScript y no Java?

- **TypeScript es más rápido de aprender** si ya se conoce JavaScript.
- **Un solo lenguaje** para frontend y backend (menos cambios de contexto).
- **React + TypeScript** es un stack muy común en la industria.
- **Node.js + Express** permite levantar un servidor en minutos.
- **Vercel y Render** tienen capa gratuita generosa para desplegar.

## Temas por aprender

Durante el proyecto aprenderemos:

- **React:** construcción de interfaces por componentes.
- **Prisma o TypeORM:** conexión a PostgreSQL.
- **Jest + Supertest:** pruebas automatizadas.
- **Swagger UI:** documentación de la API.
- **Vercel + Render:** despliegue en la nube.