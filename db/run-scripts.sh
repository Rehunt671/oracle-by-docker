#!/bin/bash
# Wait for Oracle to fully start up before running the script

# Wait until the database is ready
while ! echo exit | sqlplus -S sys/secret@localhost:1521/XEPDB1 as sysdba <<< "exit"; do
  echo "Waiting for Oracle to be ready..."
  sleep 10
done

echo "Database is ready. Running the SQL script."

# Run the HR installation SQL script
sqlplus sys/secret@localhost:1521/XEPDB1 as sysdba @/docker-entrypoint-initdb.d/hr_install.sql

echo "SQL script execution completed."
