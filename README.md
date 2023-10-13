Containerized Python application that connects to PostgreSQL database needs to have psycopg2 installed. This project is for building a Python Docker image that has psycopg2 installed.

Python official Docker image has big size because of many unnecessary packages. So we will use Python slim Docker image as the base image for smaller image size. Python alpine image is even smaller but it is based on an alpine distribution. The difference of compilation might lead to unexpected errors.

To install psycopg2 with Python slim image, we need to install libpq-dev and gcc first.

Use multi-stage build to leave the unnecessary behind and keep only the essential.