#!/usr/bin/env bash

cp truck_signs_designs/settings/simple_env_config.env .env

echo "Generating Django SECRET_KEY..."
SECRET_KEY=$(openssl rand -base64 64 | tr -d '\n')
sed -i "s|^SECRET_KEY=$|SECRET_KEY=$SECRET_KEY|" .env

echo "Generating DOCKER_SECRET_KEY..."
DOCKER_SECRET_KEY=$(openssl rand -base64 64 | tr -d '\n')
sed -i "s|^DOCKER_SECRET_KEY=$|DOCKER_SECRET_KEY=$DOCKER_SECRET_KEY|" .env