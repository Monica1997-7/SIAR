# Stack Tecnológico — SIAR

## Lenguaje principal
- **Java 21 (LTS)**
- **Justificación:** Lenguaje fuertemente tipado, ideal para
  aplicar patrones de diseño formales (Factory, Singleton,
  Strategy, Observer, Repository). Amplia documentación y
  soporte empresarial.

## Frontend
- **Tecnología:** React 18 + Bootstrap 5
- **Justificación:** React permite construir interfaces dinámicas
  por componentes. Bootstrap 5 acelera el diseño responsivo (RNF01)
  con componentes preconstruidos (tablas, formularios, navbar,
  modales) sin necesidad de escribir CSS desde cero.

## Backend
- **Tecnología:** Spring Boot 3 + Spring Web + Spring Security
- **Justificación:**
  - Spring Boot simplifica la configuración y el despliegue.
  - Spring Web permite construir APIs REST con pocas líneas.
  - Spring Security gestiona autenticación JWT y control de
    acceso por roles (RF04, RF05, RNF04, RNF05).
- **Arquitectura:** MVC en capas (Controller → Service → Repository).

## Base de datos
- **Tecnología:** PostgreSQL 15
- **Justificación:** Soporta roles y permisos nativos (RF04),
  transacciones ACID (útil para pedidos), y es gratuito.

## ORM / Persistencia
- **Tecnología:** Spring Data JPA + Hibernate
- **Justificación:** Mapea clases Java a tablas PostgreSQL,
  permite migraciones versionadas con Flyway o Liquibase.

## Pruebas
- **Framework:** JUnit 5 + Mockito + Spring Boot Test
- **Cobertura mínima:** 70% (RNF09)
- **Herramienta de cobertura:** JaCoCo

## Documentación de API
- **Tecnología:** Springdoc OpenAPI (Swagger UI)
- **Justificación:** Genera documentación interactiva de los
  endpoints automáticamente.

## Control de versiones
- Git + GitHub (RNF08)

## Gestor de dependencias
- Maven 3.9

## Despliegue
- **Plataforma:** Railway o Render (soporte Java)
- **Base de datos en la nube:** Neon (PostgreSQL gratuito)
- **Justificación:** Capa gratuita suficiente para el proyecto.

## IDE
- **Visual Studio Code**
- **Extensiones necesarias:**
  - Extension Pack for Java (Microsoft)
  - Spring Boot Extension Pack (VMware)
  - Maven for Java
  - Debugger for Java
  - GitLens
  - Markdown Preview Enhanced (para ver los .md)

## Resumen del stack

| Capa | Tecnología |
|------|-----------|
| Lenguaje | Java 21 (LTS) |
| Frontend | React 18 + Bootstrap 5 |
| Backend | Spring Boot 3 + Spring Web + Spring Security |
| BD | PostgreSQL 15 |
| ORM | Spring Data JPA + Hibernate |
| Pruebas | JUnit 5 + Mockito + JaCoCo |
| API Docs | Springdoc OpenAPI (Swagger UI) |
| Build | Maven 3.9 |
| IDE | Visual Studio Code |
| Despliegue | Railway / Render |
| Versionamiento | Git + GitHub |

## ¿Por qué este stack y no otro?
- **Java + Spring Boot:** estándar empresarial, tipado fuerte,
  ideal para patrones de diseño formales.
- **Bootstrap 5:** fácil de aprender, componentes listos,
  acelera el desarrollo del dashboard administrativo.
- **JUnit + Mockito + JaCoCo:** permiten cumplir el RNF09
  (cobertura ≥ 70%) con facilidad.
- **PostgreSQL:** gratuito, robusto, soporta roles nativos
  para el RF04.
- **VS Code:** IDE ligero, multiplataforma, con extensiones
  oficiales de Microsoft para Java y Spring Boot.