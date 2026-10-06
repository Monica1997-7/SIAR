# Matriz de Trazabilidad

## Tabla completa

| RF | Nombre | HU asociada | CU asociado | Módulo | Responsable | Prueba planificada |
|----|--------|-------------|-------------|--------|-------------|---------------------|
| RF01 | Registrar usuario | HU-01 | CU-01 | Usuarios | Monica Ortiz | test_registrar_usuario |
| RF02 | Editar usuario | HU-02 | CU-02 | Usuarios | Monica Ortiz | test_editar_usuario |
| RF03 | Eliminar usuario | HU-03 | CU-03 | Usuarios | Monica Ortiz | test_eliminar_usuario |
| RF04 | Gestionar roles | HU-04, HU-05 | CU-04, CU-05 | Usuarios | Monica Ortiz | test_gestionar_roles |
| RF05 | Iniciar sesión | HU-06 | CU-06 | Usuarios | Monica Ortiz | test_iniciar_sesion |
| RF06 | Recuperar contraseña | HU-07 | CU-07 | Usuarios | Monica Ortiz | test_recuperar_password |
| RF07 | Registrar producto | HU-08 | CU-08 | Menú | Omar Rivera | test_registrar_producto |
| RF08 | Editar producto | HU-09 | CU-09 | Menú | Omar Rivera | test_editar_producto |
| RF09 | Eliminar producto | HU-10 | CU-10 | Menú | Omar Rivera | test_eliminar_producto |
| RF10 | Gestionar categorías | HU-11 | CU-11 | Menú | Omar Rivera | test_gestionar_categorias |
| RF11 | Cambiar disponibilidad | HU-12 | CU-12 | Menú | Omar Rivera | test_cambiar_disponibilidad |
| RF17 | Crear pedido | HU-13 | CU-13 | Pedidos | Andrés Reyes | test_crear_pedido |
| RF18 | Agregar productos a un pedido existente | HU-14 | CU-14 | Pedidos | Andrés Reyes | test_agregar_productos |
| RF19 | Modificar pedido | HU-15 | CU-15 | Pedidos | Andrés Reyes | test_modificar_pedido |
| RF20 | Cancelar pedido | HU-16 | CU-16 | Pedidos | Andrés Reyes | test_cancelar_pedido |
| RF21 | Enviar pedido a cocina | HU-17 | CU-17 | Pedidos | Andrés Reyes | test_enviar_cocina |
| RF22 | Consultar estado del pedido | HU-18 | CU-18 | Pedidos | Andrés Reyes | test_consultar_estado |

## Resumen por módulo

| Módulo | RF | HU | CU | Responsable |
|--------|-----|-----|-----|-------------|
| Usuarios | 6 | 7 | 7 | Monica Ortiz |
| Menú | 5 | 5 | 5 | Omar Rivera |  
| Pedidos | 6 | 6 | 6 | Andrés Reyes |  
| **Total** | **17** | **18** | **18** | — |

## Observaciones

- Cada RF tiene al menos 1 HU y 1 CU asociados.
- El RF04 tiene 2 HU y 2 CU porque cubre dos acciones: gestionar roles y asignar roles.
- Los RF del 12 al 16 (Mesas) y del 23 al 37 (Inventario, Facturación, Reportes) corresponden a los cortes 2 y 3, por lo que no se incluyen en esta matriz del primer corte.
- Las pruebas planificadas se implementarán en el tercer corte, cuando se desarrolle el código.