# Estrategia de Entornos

## Objetivo

Definir los entornos necesarios para garantizar una promoción controlada de cambios desde desarrollo hasta producción.

## Entornos Salesforce

### Sandbox de Desarrollo

Entorno utilizado por los desarrolladores para construir nuevas funcionalidades, corregir errores y realizar pruebas iniciales.

Características:

- Desarrollo individual.
- Pruebas unitarias.
- Validaciones técnicas iniciales.

### Integración

Representado por la rama:

develop

Objetivo:

- Consolidar desarrollos de múltiples equipos.
- Detectar conflictos de integración.
- Validar despliegues automáticos.

### UAT (User Acceptance Testing)

Representado por la rama:

uat

Objetivo:

- Validación funcional por parte del negocio.
- Pruebas de aceptación.
- Verificación de requisitos.

Solo los cambios aprobados podrán ser promovidos a producción.

### Producción

Representado por la rama:

main

Objetivo:

- Servicio utilizado por los usuarios finales.
- Máxima estabilidad.
- Cambios controlados mediante proceso de Release.

## Flujo de Promoción

Sandbox Desarrollo
        ↓
     develop
        ↓
       uat
        ↓
      main

## Principios

- No se realizan cambios manuales en Producción.
- Todo cambio debe estar versionado en Git.
- Toda promoción debe ser trazable.
- Toda liberación debe permitir rollback.
