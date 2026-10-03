# Requerimientos No Funcionales

## Tabla de RNF

| ID | Categoría | Descripción | Métrica | Valor objetivo | Cómo se verifica |
|----|-----------|-------------|---------|----------------|------------------|
| RNF01 | Usabilidad | El sistema debe ser web responsivo y adaptarse a móvil, tablet y desktop | Adaptación visual | 100% de las vistas | Prueba en 3 resoluciones (móvil, tablet, desktop) |
| RNF02 | Disponibilidad | El sistema debe estar disponible la mayor parte del tiempo | Porcentaje de uptime | ≥ 95% | Monitoreo con UptimeRobot o similar |
| RNF03 | Rendimiento | El sistema debe responder rápido a las peticiones | Tiempo de respuesta de la API | < 3 segundos | Pruebas con JMeter o Postman |
| RNF04 | Seguridad | Las contraseñas deben almacenarse de forma segura | Tipo de cifrado | bcrypt con salt | Revisión de código y pruebas de seguridad |
| RNF05 | Seguridad | El acceso debe estar controlado por roles | Cobertura de endpoints | 100% de endpoints protegidos | Pruebas con diferentes roles (Admin, Cajero, Mesero, Cocinero) |
| RNF06 | Auditoría | El sistema debe registrar las acciones importantes | Registro de acciones | 100% de operaciones CRUD registradas | Revisión de logs de auditoría |
| RNF07 | Arquitectura | El sistema debe seguir una arquitectura en capas | Capas definidas | 3 capas (presentación, negocio, datos) | Revisión de la estructura del código |
| RNF08 | Versionamiento | El proyecto debe usar Git para control de versiones | Commits | ≥ 1 commit por tarea | Revisión del historial de Git |
| RNF09 | Pruebas | El sistema debe tener cobertura de pruebas suficiente | Porcentaje de cobertura | ≥ 70% | Reporte de JaCoCo |
| RNF10 | Documentación | El sistema debe tener documentación técnica y de usuario | Documentos entregados | Manual técnico + manual de usuario | Revisión de los documentos |

## Observaciones

- Los RNF son transversales a todos los módulos del sistema.
- Los RNF04 y RNF05 están relacionados con seguridad.
- El RNF09 (cobertura ≥ 70%) es obligatorio según los resultados de aprendizaje de la asignatura.
- Todos los RNF son medibles y verificables.