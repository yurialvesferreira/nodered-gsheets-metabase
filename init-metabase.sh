#!/bin/bash
set -e

echo "Waiting for PostgreSQL to be ready..."
until pg_isready -h postgres -U "$POSTGRES_USER"; do
    sleep 2
done

echo "PostgreSQL is ready. Checking and creating the 'metabase' database if it doesn't exist..."

PGPASSWORD="$POSTGRES_PASSWORD" psql -h postgres -U "$POSTGRES_USER" -d postgres -tc \
"SELECT 1 FROM pg_database WHERE datname = 'metabase'" | grep -q 1 || \
PGPASSWORD="$POSTGRES_PASSWORD" psql -h postgres -U "$POSTGRES_USER" -d postgres -c "CREATE DATABASE metabase;"

echo "Database 'metabase' is ready!"
