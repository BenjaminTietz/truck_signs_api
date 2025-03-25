#!/usr/bin/env bash

cp truck_signs_designs/settings/simple_env_config.env .env

echo "Checking if Django SECRET_KEY already exists..."

CURRENT_SECRET_KEY=$(grep "^SECRET_KEY=" .env | cut -d '=' -f2-)
if [ -n "$CURRENT_SECRET_KEY" ]; then
  echo "SECRET_KEY already exists – skipping generation."
else
  echo "Generating Django SECRET_KEY via Django's get_random_secret_key..."
  DJANGO_SECRET_KEY=$(python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())')
  sed -i "s/^SECRET_KEY=.*/SECRET_KEY=$DJANGO_SECRET_KEY/" .env
fi

echo "Checking if DOCKER_SECRET_KEY already exists..."

CURRENT_DOCKER_SECRET_KEY=$(grep "^DOCKER_SECRET_KEY=" .env | cut -d '=' -f2-)
if [ -n "$CURRENT_DOCKER_SECRET_KEY" ]; then
  echo "DOCKER_SECRET_KEY already exists – skipping generation."
else
  echo "Generating DOCKER_SECRET_KEY..."
  DOCKER_SECRET_KEY=$(openssl rand -base64 64 | tr -d '\n')
  sed -i "s/^DOCKER_SECRET_KEY=.*/DOCKER_SECRET_KEY=$DOCKER_SECRET_KEY/" .env
fi