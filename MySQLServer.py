import mysql.connector
from mysql.connector import Error

try:
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Jackandjill100@"
    )

    if mydb.is_connected():
        cursor = mydb.cursor()


        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

        print("Database 'alx_book_store' created successfully!")


except Error as e:
    print(f"Error: {e}")

finally:
    if mydb.is_connected():
        cursor.close()
        mydb.close()