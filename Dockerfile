# Extend the Oracle 21 image
FROM oracle-21

# Copy the SQL script into the container
COPY db/human_resources/hr_install.sql /docker-entrypoint-initdb.d/hr_install.sql

# Copy a custom entrypoint script
COPY db/run-scripts.sh /docker-entrypoint-initdb.d/run-scripts.sh

# Make the script executable
RUN chmod +x /docker-entrypoint-initdb.d/run-scripts.sh
