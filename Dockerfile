# Use Python base image
FROM python:3.13.0rc2-slim
LABEL authors="Emmanuel"

# Upgrade pip
RUN pip install --upgrade pip

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY app.py requirements.txt ./

# Install the dependencies
RUN pip install -r requirements.txt

# Add a non-root user with UID 1000
RUN useradd --uid 1000 myuser
RUN mkdir -p /home/myuser
RUN chown -R myuser:myuser /home/myuser
USER myuser

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the app
ENTRYPOINT ["python","app.py"]