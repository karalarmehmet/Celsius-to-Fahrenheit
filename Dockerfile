# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY  requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install flake8 pytest
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Make port 80 available to the world outside this container
EXPOSE 8080

# Define environment variable
ENV FLASK_APP=main.py

# Run the application
CMD ["python", "main.py"]