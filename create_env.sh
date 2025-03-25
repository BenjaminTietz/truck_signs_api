#!/usr/bin/env bash

cp truck_signs_designs/settings/simple_env_config.env .env

echo "Checking if Django SECRET_KEY already exists..."

if grep -q "^SECRET_KEY=" .env; then
  echo "SECRET_KEY already exists – skipping generation."
else
  echo "Generating Django SECRET_KEY via Django's get_random_secret_key..."
  DJANGO_SECRET_KEY=$(python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())')
  echo "SECRET_KEY=$DJANGO_SECRET_KEY" >> .env
fi

echo "Checking if DOCKER_SECRET_KEY already exists..."

if grep -q "^DOCKER_SECRET_KEY=" .env; then
  echo "DOCKER_SECRET_KEY already exists – skipping generation."
else
  echo "Generating DOCKER_SECRET_KEY..."
  DOCKER_SECRET_KEY=$(openssl rand -base64 64 | tr -d '\n')
  echo "DOCKER_SECRET_KEY=$DOCKER_SECRET_KEY" >> .env
fi

