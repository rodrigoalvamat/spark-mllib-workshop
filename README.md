# PySpark MLlib Workshop

This repository contains a quick introduction to Apache Spark MLlib through two practical notebooks. The workshop is designed to provide hands-on experience with Spark's machine learning capabilities, focusing on Market Basket Analysis and Customer Churn Prediction.

## Table of Contents

- [Overview](#overview)
- [Notebooks](#notebooks)
  - [Market Basket Analysis](#market-basket-analysis)
  - [Customer Churn Prediction](#customer-churn-prediction)
- [Installation](#installation)
- [Docker and Docker-Compose Requirements](#docker-and-docker-compose-requirements)
- [Customization](#customization)
  - [Spark Cluster Settings](#spark-cluster-settings)
  - [Number of Nodes](#number-of-nodes)
- [Managing the Spark Cluster](#managing-the-spark-cluster)

## Overview

This workshop provides a quick introduction to Spark MLlib. It includes two main notebooks:

1. **Market Basket Analysis using Apache Spark**: Focuses on the FP-Growth algorithm and Exploratory Data Analysis (EDA).
2. **Customer Churn Prediction with PySpark MLlib**: Focuses on Random Forest classification and the machine learning pipeline.

## Notebooks

### Market Basket Analysis

The first notebook demonstrates how to perform Market Basket Analysis using Apache Spark. It includes:

- Loading and exploring the Instacart dataset.
- Performing Exploratory Data Analysis (EDA).
- Implementing the FP-Growth algorithm to find frequent itemsets and association rules.

### Customer Churn Prediction

The second notebook walks through the process of predicting customer churn using PySpark MLlib. It includes:

- Loading and preparing the Telco Churn dataset.
- Building a machine learning pipeline with feature engineering.
- Training and evaluating a Random Forest classifier.

## Installation

To install the necessary dependencies, use [Poetry](https://python-poetry.org/). Run the following commands:

```bash
poetry install
```

## Docker and Docker-Compose Requirements

Ensure you have Docker and Docker-Compose installed on your system. You can find installation instructions here:

- [Docker Installation](https://docs.docker.com/get-docker/)
- [Docker-Compose Installation](https://docs.docker.com/compose/install/)

## Customization

### Spark Cluster Settings

The default Spark cluster settings are optimized to execute the FP-Growth algorithm. You can customize the driver and worker memory and number of cores to match your machine's specifications.

These settings are configured in the `docker-compose.yml` file:

```yaml
services:
  spark:
    environment:
      - SPARK_DRIVER_MEMORY=3G
  spark-worker:
    environment:
      - SPARK_WORKER_MEMORY=3G
      - SPARK_WORKER_CORES=2
```

### Number of Nodes

To change the number of Spark worker nodes, modify the --scale option in the makefile:

```make
.PHONY: spark-up
spark-up:
	docker-compose up -d --scale spark-worker=3
```

## Managing the Spark Cluster

You can use the makefile to easily create and destroy the Spark cluster.

## Creating the Cluster

```bash
make spark-up
```

## Destroying the Cluster

```bash
make spark-down
```