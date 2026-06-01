# Salesforce Release Enterprise

Proyecto de referencia para la gestión de Releases Salesforce utilizando Salesforce DX, GitFlow y CI/CD.

## Objetivo

Diseñar un proceso de Release Management desde cero para entornos Salesforce siguiendo buenas prácticas DevOps.

## Arquitectura

feature/*
↓
develop
↓
uat
↓
main

## Entornos

- Develop (Integración)
- UAT (Pruebas de Usuario)
- Production

## Tecnologías

- Salesforce DX
- Git
- GitHub
- Jenkins

## Release Process

1. Desarrollo en feature branches.
2. Pull Request hacia develop.
3. Validación automática.
4. Promoción a UAT.
5. Aprobación funcional.
6. Despliegue a Producción.

## Rollback

- Git Revert.
- Hotfix Branches.
- Recuperación de Metadatos.
