import os
from flask import Flask
import mysql.connector

app = Flask(__name__)

db_name = os.getenv('DB_NAME')
db_user = os.getenv('DB_USER')
db_password = os.getenv('DB_PASSWORD')


def connect_to_database():
    try:
        connection = mysql.connector.connect(
            host='mysql',
            user='root',
            password=db_password,
            database=db_name
        )
        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS test_database;")
        cursor.close()
        connection.close()
        return "Successfully connected to the database."
    except mysql.connector.Error as err:
        return f"Error: {err}"


@app.route('/')
def hello_world():
    db_message = connect_to_database()
    return f"Hello, World! {db_message}"


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)
