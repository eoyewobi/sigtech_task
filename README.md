# Sigtech Task

```commandline
.
├── Dockerfile
├── README.md
├── app.py
├── docker-compose.yml
├── mysql-init.sh
├── requirements.txt
└── venv

```
Prerequisites
Make sure you have the following installed:

Docker
Docker Compose
Getting Started
Clone the Repository

```commandline
git clone git@github.com:eoyewobi/sigtech_task.git
cd your-repository
```

Before running commands please ensure you have the correct libraries installed.

You can do this by running this command in the terminal at the root of the project
```commandline
pip install -r requirements.txt
```



Setup Environment Variables

Create a .env file in the project root directory with the necessary environment variables. Here is an example .env:

```commandline
MYSQL_ROOT_PASSWORD=your-root-password
MYSQL_DATABASE=your-database
```


Build and Start the Services


Use the following command to build and start the services defined in the docker-compose.yml:


```commandline
docker-compose up --build
```

This command will:

Build the Docker images if they haven’t been built yet.
Start the containers for all the services defined in the docker-compose.yml.
Access the Application

Your application should now be accessible on http://localhost:your-port.
If using MySQL, you can connect to the database using the following details:
Host: localhost
Port: 3306
User: as defined in the .env
Password: as defined in the .env
Configuration
You can modify the configuration in the docker-compose.yml file to change the following:

Ports: Change the port mappings for the services.
Volumes: Modify volume mappings if you need to persist data outside the container.
Environment Variables: Adjust the environment variables for each service.
Stopping the Services
To stop the services, run:

```commandline
docker-compose down
```
This command will stop and remove the containers, but the data in any named volumes will be preserved.

Common Issues
"Host is not allowed to connect to this MySQL server" Error

If you encounter this error, make sure the MySQL server allows connections from the specified host. You may need to adjust MySQL configurations or ensure the environment variables are correctly set.

Port Conflicts

If you encounter port conflicts, ensure that the ports defined in the docker-compose.yml file are not already in use on your system.

Useful Commands
Rebuild the containers: If you make changes to the Dockerfiles or configuration:

```commandline
docker-compose up --build
```

View logs for a specific service:

```commandline
docker-compose logs -f service_name
```

Access a running container's shell:

```commandline
docker-compose exec service_name sh
```

