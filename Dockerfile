# Use the official Python image from the Docker Hub
FROM python:3.9-slim

ARG ECR_IMAGE_REPO
ARG CIRCLE_SHA1

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the necessary dependencies
RUN pip install flask

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variables
ENV ENV_VAR1=ECR_IMAGE_REPO
ENV ENV_VAR2=CIRCLE_SHA1

# Run app.py when the container launches
CMD ["python", "app2.py"]
