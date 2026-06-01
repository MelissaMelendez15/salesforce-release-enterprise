# Plan de Rollback

## Objetivo

Definir un procedimiento de recuperación ante fallos durante o después de un despliegue Salesforce, garantizando trazabilidad, comunicación y reducción del impacto en producción.

## Principios

- Todo despliegue debe tener una estrategia de recuperación definida antes de ejecutarse.
- Todo cambio debe estar versionado en Git.
- No se deben realizar correcciones manuales directamente en Producción salvo emergencia justificada.
- El rollback debe ser comunicado y documentado.

## Escenarios de fallo

### Fallo durante la validación

Si la validación falla antes del despliegue:

- Se detiene la promoción.
- Se revisan los logs del pipeline.
- Se corrige el error en una rama feature o hotfix.
- Se vuelve a ejecutar la validación.

### Fallo durante el despliegue

Si el despliegue falla durante la ejecución:

- Se detiene el pipeline.
- Se revisa el error técnico.
- Se verifica si hubo despliegue parcial.
- Se comunica al equipo técnico y funcional.
- Se decide si repetir el despliegue o aplicar rollback.

### Fallo posterior al despliegue

Si el error aparece después de pasar a Producción:

- Se registra la incidencia.
- Se evalúa el impacto.
- Se activa el plan de rollback o hotfix.
- Se comunica el estado al negocio.
- Se valida la recuperación del servicio.

## Estrategias de rollback

### 1. Git Revert

Se revierte el commit que introdujo el cambio problemático.

```bash
git revert <commit_hash>