#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Esperando pelo PostgreSQL..."
    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done
    echo "PostgreSQL iniciado"
fi

exec "$@"
