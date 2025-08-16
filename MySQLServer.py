import mysql.connector

try:
    # Connect to MySQL server (without choosing a database yet)
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",             # change this to your MySQL username
        password="Jackandjill100@"   # change this to your MySQL password
    )

    if mydb.is_connected():
        cursor = mydb.cursor()
        # Create the database if it doesn't already exist
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as err:
    # Handle connection or query errors
    print(f"Error: {err}")

finally:
    # Properly close cursor and connection
    if 'cursor' in locals() and cursor:
        cursor.close()
    if 'mydb' in locals() and mydb.is_connected():
        mydb.close()
        print("MySQL connection closed.")
