# Oracle 21c Docker Setup and Human Resources Schema Installation

This guide provides step-by-step instructions to pull the Oracle 21c image, update your Docker Compose configuration, and install the Human Resources (HR) schema in your Oracle database container.

---

## Prerequisites

Ensure you have the following installed on your system:

- **Docker**: [Installation Guide](https://docs.docker.com/get-docker/)
- **Docker Compose**: [Installation Guide](https://docs.docker.com/compose/install/)

---

## Steps

### 1. Pull the Oracle 21c Docker Image

Pull the Oracle 21c image from Docker Hub by running the following command:

```bash
docker pull rehunt671/oracle-21
```

### 2. Update Docker Compose File

Modify your `docker-compose.yml` file to use the `rehunt671/oracle-21` image. For example:

```yaml
version: "3"

services:
  oracle:
    image: rehunt671/oracle-21
    container_name: oracle21
    ports:
      - "1521:1521"
    volumes:
      - ./data:/opt/oracle/oradata
```

### 3. Start the Oracle Container

Run the following command to start the container in detached mode:

```bash
docker-compose up -d
```

Verify that the container is running:

```bash
docker ps
```

### 4. Install the HR Schema

To install the HR schema, access the Oracle container's `sqlplus` interface:

```bash
docker exec -it oracle21 bash
```

Once inside the container, execute the following command:

```bash
sqlplus sys/secret@localhost:1521/XEPDB1 as sysdba @/run/mock/human_resources/hr_install.sql
```

This will run the `hr_install.sql` script to install the HR schema.
