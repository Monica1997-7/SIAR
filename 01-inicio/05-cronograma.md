# Cronograma

## 1. Tabla de actividades por semana (Primer Corte)

| Semana | Actividad | Entregable | Responsable principal |
|--------|-----------|-----------|----------------------|
| 1 | Documento de Inicio | `01-inicio/` completo (A.1–A.5) | Monica Ortiz |
| 2 | Historias de usuario + Casos de uso | `02-requerimientos/01-historias.md`, `02-casos-uso.md` | Andres Reyes |
| 3 | RF, RNF, Matriz de trazabilidad | `02-requerimientos/03-rf.md`, `04-rnf.md`, `05-trazabilidad.md` | Andres Reyes |
| 4 | Diagramas de casos de uso y clases | `03-modelado/01-casos-uso.png`, `02-clases.png` | Omar Rivera |
| 5 | MER + Diccionario + SQL | `03-modelado/03-mer.png`, `04-diccionario.md`, `db/schema.sql` | Omar Rivera |
| 6 | Revisión + sustentación | Documentación completa + sustentación | Todos |

## 2. Hitos por corte

| Corte | Semana | Peso | Entregable principal |
|-------|--------|------|---------------------|
| 1 | 6 | 30% | Documentación completa: Documento de Inicio + Ingeniería de Requerimientos + Modelado |
| 2 | 11 | 30% | Documentación de módulos restantes + pruebas documentadas |
| 3 | 16 | 40% | Código completo + despliegue + documentación final |

## 3. Diagrama de Gantt

![Diagrama de Gantt](gantt.png)

## 4. Distribución de responsabilidades

El proyecto es desarrollado por un equipo de 3 integrantes.
Dado que el primer corte corresponde únicamente a documentación
y modelado (sin código), las responsabilidades se organizan
por bloques de entregables y por módulos:

| Integrante | Nombre | Rol principal | Módulo asignado | RF que documenta |
|-----------|--------|---------------|-----------------|------------------|
| Integrante 1 | Monica Ortiz | Líder de Documento de Inicio | Usuarios | RF01–RF06 |
| Integrante 2 | Andres Reyes | Líder de Ingeniería de Requerimientos | Menú | RF07–RF11 |
| Integrante 3 | Omar Rivera | Líder de Modelado | Pedidos | RF17–RF22 |

### Estrategia de trabajo

El primer corte se divide en 3 bloques de documentación:

- **Bloque A — Documento de Inicio:** Monica lidera, todos aportan.
- **Bloque B — Ingeniería de Requerimientos:** Andres lidera, todos aportan sus módulos.
- **Bloque C — Modelado:** Omar lidera, todos aportan sus módulos.

Cada integrante es dueño de un módulo (Usuarios, Menú o Pedidos)
y aporta la documentación correspondiente a ese módulo en los
bloques B y C.

### Nota sobre el desarrollo

El desarrollo del código (Java + Spring Boot + PostgreSQL)
se realizará en el tercer corte, según lo indicado por la
profesora. El primer corte corresponde exclusivamente a
documentación y modelado.

## 5. Incrementos

| Incremento | Módulo | RF incluidos | Semanas |
|-----------|--------|--------------|---------|
| 1 | Usuarios | RF01–RF06 | 1–2 |
| 2 | Menú | RF07–RF11 | 3–4 |
| 3 | Pedidos | RF17–RF22 | 5–6 |

**Nota:** los incrementos corresponden a los módulos que se
documentarán y modelarán durante el primer corte. El código
se implementará en el tercer corte.

## 6. Riesgos identificados

| Riesgo | Probabilidad | Impacto | Plan de mitigación |
|--------|-------------|---------|-------------------|
| Falta de claridad en los requerimientos | Media | Alto | Validar cada documento con la profesora antes de avanzar |
| Descoordinación del equipo | Media | Medio | Reuniones semanales de seguimiento y tablero compartido |
| Retraso en la entrega de diagramas | Media | Alto | Usar PlantUML y draw.io para agilizar |
| Falta de tiempo por otras materias | Alta | Alto | Priorizar tareas críticas y avanzar en fines de semana |
| Cambios de última hora por parte de la profesora | Media | Medio | Dejar la semana 6 como holgura para ajustes |

## 7. Evidencia detallada

El detalle completo por requerimiento funcional, caso de uso,
rol/actor, flujo normal, horas estimadas y responsable de
documentación se encuentra en:

📎 [`cronograma-detallado.xlsx`](cronograma-detallado.xlsx)