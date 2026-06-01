# Estrategia de Ramas

## Objetivo

Definir una estrategia de ramas que permita gestionar de forma segura y controlada la promoción de cambios entre los distintos entornos Salesforce.

## Ramas principales

### main

Representa el entorno de Producción.

Solo contendrá cambios aprobados y desplegados en producción.

### uat

Representa el entorno de pruebas de usuario (User Acceptance Testing).

Se utilizará para validar funcionalmente los cambios antes de su promoción a producción.

### develop

Representa el entorno de Integración.

Es la rama donde se consolidan los desarrollos antes de ser promovidos a UAT.

## Ramas de trabajo

### feature/*

Utilizadas por los desarrolladores para implementar nuevas funcionalidades o correcciones.

Ejemplos:

- feature/crear-cuenta-vip
- feature/mejora-validacion-contacto

Una vez finalizado el desarrollo, los cambios serán promovidos mediante Pull Request hacia la rama develop.

### hotfix/*

Utilizadas para corregir incidencias críticas detectadas en producción.

Ejemplo:

- hotfix/error-creacion-casos

Tras la validación correspondiente, los cambios serán promovidos a producción y posteriormente sincronizados con el resto de ramas.

## Flujo de promoción

feature/*
↓
develop
↓
uat
↓
main