# echo "Apply database migrations"
# python manage.py migrate
# exec "$@"
#!/bin/bash
python manage.py migrate
python manage.py runserver 0.0.0.0:8000