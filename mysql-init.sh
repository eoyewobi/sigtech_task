#!/bin/bash

# Wait for MySQL to be ready
echo "Waiting for MySQL to be ready..."
until mysql -h "localhost" -u root -p"${MYSQL_ROOT_PASSWORD}" -e "status"; do
  echo "Waiting for MySQL..."
  sleep 2
done

# Execute SQL commands dynamically using environment variables
echo "Initializing the database..."

mysql -h "localhost" -u root -p"${MYSQL_ROOT_PASSWORD}" <<-EOSQL
  CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
  GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
  FLUSH PRIVILEGES;
EOSQL

echo "Database initialization complete."
