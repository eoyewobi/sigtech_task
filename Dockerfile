# Use Python base image
FROM python:3.13.0rc2-slim
LABEL authors="Emmanuel"

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the dependencies
RUN pip install Flask mysql-connector-python

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the app
ENTRYPOINT ["python","app.py"]