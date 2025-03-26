# Use a Python 3.8.1-slim image as the base image
FROM python:3.8.1-slim

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies AND nesseary packages
RUN apt-get update && apt-get install -y \
    netcat \
    gcc \
    build-essential \
 && apt-get clean


# Copy project file into the container
COPY . .

# Install dependencies
RUN python -m pip install --no-cache-dir -r requirements.txt

# copy the entrypoint.sh and set permissions 
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

# Expose port 8020 so the application can be accessed externally
EXPOSE 8020

# Django Superuser variables
ENV DJANGO_SUPERUSER_USERNAME="admin"
ENV DJANGO_SUPERUSER_EMAIL="admin@admin.com"
ENV DJANGO_SUPERUSER_PASSWORD="adminpw"

# Django System Variables
ENV ALLOWED_HOSTS="*"

# Django / Postgresql variables
ENV DB_NAME=trucksigns_db
ENV DB_USER=trucksigns_user
ENV DB_PASSWORD=supertrucksignsuser!
ENV DB_HOST=db
ENV DB_PORT=5432

# Use entrypoint.sh as the startup command
ENTRYPOINT ["./entrypoint.sh"]
