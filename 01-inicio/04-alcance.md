# Alcance

## 1. Incluye

| Módulo | Funcionalidades | Corte |
|--------|----------------|-------|
| Usuarios | Registro, edición, eliminación, roles (Admin, Cajero, Mesero, Cocinero), login con JWT, recuperación de contraseña | 1 |
| Menú | CRUD de productos, categorización, gestión de disponibilidad | 1 |
| Pedidos | Creación, modificación, cancelación, envío a cocina, seguimiento de estados (Pendiente, En preparación, Listo, Entregado, Facturado) | 1 |
| Mesas | CRUD de mesas, consulta de estado, reserva y liberación | 2 |
| Inventario | CRUD de insumos, descuento automático por venta, alertas de stock mínimo | 2 |
| Facturación | Generación de factura, cálculo de impuestos, aplicación de descuentos, registro de pago, emisión de comprobante | 2 |
| Reportes | Ventas por periodo, productos más vendidos, consumo de inventario, ocupación de mesas, indicadores financieros | 3 |
| Dashboard | Panel administrativo con gráficos y métricas en tiempo real | 3 |
| Reservas | CRUD de reservas, calendario visual, gestión de disponibilidad | 3 |

## 2. NO incluye

- Aplicación móvil nativa (solo web responsivo).
- Facturación electrónica ante la DIAN.
- Pagos en línea (tarjeta, PSE, Nequi, etc.).
- Integración con impresoras térmicas o POS físicos.
- Gestión de múltiples sucursales (solo un restaurante).
- Reconocimiento facial o biometría.
- Chatbot de atención al cliente.
- Delivery o pedidos a domicilio.
- Programa de fidelización de clientes.
- Integración con redes sociales.

## 3. Supuestos

- El restaurante cuenta con conexión a Internet estable.
- Los usuarios finales tienen conocimientos básicos de navegación web.
- Se dispone de un servidor gratuito (Render o Railway) para el despliegue.
- El equipo de desarrollo tiene conocimientos básicos en Java, Spring Boot y PostgreSQL.
- El proyecto se desarrolla en un plazo de 16 semanas.

## 4. Restricciones

- **Tiempo:** 16 semanas divididas en 3 cortes (6 + 5 + 5).
- **Presupuesto:** $0 (solo herramientas gratuitas).
- **Equipo:** 3 estudiantes.
- **Alcance académico:** el proyecto debe cumplir con los 3 resultados de aprendizaje de la asignatura.
- **Despliegue:** solo en plataformas con capa gratuita.