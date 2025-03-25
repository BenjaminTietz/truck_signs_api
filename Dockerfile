# Use a minimal Python 3 image as the base image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies for packages like Pillow, cffi, psycopg2 etc.
RUN apt-get update && apt-get install -y \
    gcc \
    libffi-dev \
    libpq-dev \
    zlib1g-dev \
    libjpeg-dev \
    build-essential \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# Copy project file into the container
COPY . .

# Install dependencies
RUN python -m pip install --no-cache-dir -r requirements.txt

# copy the entrypoint.sh and set permissions 
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

# Expose port 8020 so the application can be accessed externally
EXPOSE 8020

# Use entrypoint.sh as the startup command
ENTRYPOINT ["./entrypoint.sh"]
