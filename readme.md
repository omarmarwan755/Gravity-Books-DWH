# Gravity Books Data Warehouse

## Overview

This project implements a complete Data Warehouse solution for Gravity Books.

The solution includes:

- Database Modeling
- ETL Process using SSIS
- Data Warehouse Design
- OLAP Analysis using SSAS
- Reporting-ready structure

---

## Architecture

Source Database
↓
SSIS ETL
↓
Data Warehouse
↓
SSAS Cube
↓
Business Analysis

---

## Technologies

- Microsoft SQL Server
- SQL Server Integration Services (SSIS)
- SQL Server Analysis Services (SSAS)
- Visual Studio

---

## Data Warehouse Model

The warehouse follows a Star Schema design.

### Fact Tables

- FactSales

### Dimension Tables

- DimBook
- DimCustomer
- DimStore
- DimDate

---

## ETL Process

The ETL process performs:

1. Data Extraction
2. Data Cleansing
3. Data Transformation
4. Data Loading

using SSIS packages.

---

## Analysis Layer

SSAS is used to create analytical models and support multidimensional analysis.

---

## Project Structure

```text
database/
ssis/
ssas/
docs/
```

---

## Screenshots

### Architecture

![Architecture](docs/Architecture.png)

### Star Schema

![Schema](docs/StarSchema.png)

### SSIS Package

![ETL](docs/Screenshots/ssis.png)

---

## Author

Omar Marwan