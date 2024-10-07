# Use Python base image
FROM python:3.13.0rc2-slim
LABEL authors="Emmanuel"

# Install system dependencies required for mysqlclient
RUN apt-get update && \
    apt-get install -y default-libmysqlclient-dev build-essential pkg-config

# Upgrade pip
RUN pip install --upgrade pip

# Set the working directory
WORKDIR /app

# venv
ENV VIRTUAL_ENV=/home/app/venv
RUN python -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Copy the current directory contents into the container at /app
COPY app.py requirements.txt ./

# Install the dependencies
RUN pip install -r requirements.txt

# Add a non-root user with UID 1000
RUN useradd --uid 1000 myuser
RUN mkdir -p /home/myuser
RUN chown -R myuser:myuser /home/myuser
USER myuser

# Make port 80 available to the world outside this container
EXPOSE 80

# Run the app
ENTRYPOINT ["python","app.py"]