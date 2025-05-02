# Diabetes Risk Factor Analysis

This project explores factors influencing diabetes using the Pima Indians Diabetes Dataset.  
We analyze the effects of BMI, glucose, blood pressure, and other variables on diabetes outcomes.

## Folder Structure

- `code/` : Contains the R Markdown source file `final_project_2.Rmd`.  
- `data/` : Contains the dataset `diabetes.csv`.  
- `output/` : Contains the rendered report `final_project_2.html`.  
- `Dockerfile` : Defines the image to build and render the report.  
- `Makefile` : Provides convenient targets to run the container and build the report.  
- `renv.lock` : Records R package versions for reproducibility.

## Usage

### 1. Pull the Docker image

```bash
docker pull br1anli/final-project-report:latest