# Proceso de Release

## Objetivo

Definir el proceso de promoción de cambios entre los distintos entornos Salesforce garantizando calidad, trazabilidad y capacidad de recuperación ante incidencias.

## Flujo General

feature/*
↓
develop
↓
uat
↓
main

## Fase 1 - Desarrollo

El desarrollador crea una rama feature para implementar una nueva funcionalidad o corregir una incidencia.

Ejemplos:

- feature/crear-cuenta-vip
- feature/validacion-contactos

Durante esta fase se realizan:

- Desarrollo de metadatos Salesforce.
- Configuración de Flows.
- Desarrollo Apex.
- Desarrollo Lightning Web Components.
- Pruebas unitarias.

## Fase 2 - Pull Request

Una vez finalizado el desarrollo:

- Se crea un Pull Request hacia develop.
- Se realiza revisión técnica.
- Se validan los cambios antes de su integración.

## Fase 3 - Integración

Tras aprobar el Pull Request:

- Los cambios se integran en develop.
- Se ejecutan validaciones automáticas.
- Se detectan posibles conflictos entre desarrollos.

## Fase 4 - Validación UAT

Los cambios aprobados se promocionan a la rama uat.

En esta fase:

- El negocio valida la funcionalidad.
- Se ejecutan pruebas funcionales.
- Se verifica el cumplimiento de requisitos.

## Fase 5 - Release

Una vez aprobada la validación funcional:

- Se planifica la ventana de despliegue.
- Se genera la Release.
- Se obtiene la aprobación necesaria.

## Fase 6 - Producción

Los cambios se promocionan a la rama main.

Actividades:

- Despliegue en Producción.
- Validaciones posteriores al despliegue.
- Comunicación del Release.

## Trazabilidad

Todo cambio debe estar asociado a:

- Rama Git.
- Pull Request.
- Evidencia de validación.
- Fecha de despliegue.

## Buenas prácticas

- No realizar cambios directos en Producción.
- Mantener historial de promociones.
- Automatizar validaciones siempre que sea posible.
- Mantener procedimientos de rollback actualizados.