# Pet Store Automation - Karate & Maven

## Tabla de Contenidos

1. [Visión General del Proyecto](#visión-general-del-proyecto)
2. [Prerequisites](#prerequisites)
3. [Getting the Code](#getting-the-code)
4. [Running Tests](#running-tests)
5. [Reportes](#reports)

## Visión General del Proyecto

Este repositorio contiene pruebas de servicios REST de la página [Pet Store API](https://petstore.swagger.io/), la cual proporciona la documentación sobre las APIs de una "PetStore". Las pruebas están diseñadas para validar las funcionalidades clave de la API, garantizando que las operaciones de gestión de mascotas se realicen correctamente.

Las pruebas de servicios REST consideran la identificación de las entradas, captura de las salidas, test, variables, etc., para los siguientes casos:

- Añadir una mascota a la tienda.
- Consultar la mascota ingresada previamente (Búsqueda por ID).
- Actualizar el nombre de la mascota y el estatus de la mascota a “sold”.
- Consultar la mascota modificada por estatus (Búsqueda por estatus).

## Prerequisites

Asegúrate de tener instalados los siguientes requisitos previos:

- **Java**: 21.0.4
- **Maven**: 3.8.7

## Getting the Code

Para clonar este repositorio, usa:

```bash
git clone git@github.com:lfchb/petstoreProject.git
```

## running-tests
1. Para ejecutar las pruebas, navega al directorio del proyecto en tu terminal y utiliza el siguiente comando:

```bash
mvn clean test
```
2. Luego de ejecutado el comando anterior, podrás acceder al informe HTML en la ubicación de tu equipo similar a la siguiente ubicación: file:///home/liliana/Documentos/KARATE/petstoreProject/target/karate-reports/karate-summary.html

3. Podrás visualizar el escenario con cada uno de los resultados de las pruebas.

## Reports
Los reportes generados incluirán detalles sobre cada prueba ejecutada, mostrando los resultados y la información relevante sobre las pruebas.