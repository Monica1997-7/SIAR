# Patrones de Diseño

Propuesta del Líder de Modelado (Andrés Felipe Reyes) a partir de las reglas de negocio del módulo Pedidos.

## Patrón State — gestión del estado del pedido (RF22)

- **Problema:** El pedido transita por varios estados (Pendiente, En preparación, Listo, Entregado, Facturado) y, según el estado actual, ciertas acciones están permitidas o no (por ejemplo, no se puede cancelar un pedido ya facturado, RF20).
- **Solución propuesta:** Modelar cada estado como una clase que implementa una interfaz común `EstadoPedido`, con métodos como `avanzar()` o `cancelar()`. La clase `Pedido` delega en el objeto de estado actual el comportamiento permitido, en lugar de usar múltiples condicionales (`if`/`switch`) dispersos en el código.
- **Justificación:** Evita validaciones repetidas en cada método de `Pedido`, centraliza las reglas de transición de estado y facilita agregar nuevos estados sin modificar la lógica existente (principio abierto/cerrado).

## Patrón Observer — notificación a cocina (RF21)

- **Problema:** Cuando el mesero confirma un pedido (RF21), el sistema debe notificar al cocinero sin que la clase `Pedido` necesite conocer los detalles de cómo se despliega esa notificación (pantalla de cocina, impresión de comanda, etc.).
- **Solución propuesta:** `Pedido` actúa como sujeto observable: al cambiar su estado a "En preparación", notifica a los observadores suscritos (por ejemplo, un `PanelCocinaObserver`) para que actualicen la vista de cocina en tiempo real.
- **Justificación:** Desacopla la lógica de negocio del pedido de la forma en que se presenta la notificación a cocina, permitiendo agregar nuevos canales (por ejemplo, una alerta sonora) sin modificar la clase `Pedido`.
