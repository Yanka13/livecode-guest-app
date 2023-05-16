# 1 - Récupère image avec buster linux + python
FROM python:3.8-buster

# 2 - Mettre tout le code de l'appli dans le container
COPY app/app.py app/app.py
COPY app/models.py app/models.py
COPY app/templates app/templates
COPY requirements.txt requirements.txt

# 3 - RUN
RUN pip install --upgrade pip
RUN pip install -r requirements.txt



ENV FLASK_APP=app/app.py

EXPOSE 5000
# Lancer tout pour faire tourner flask
CMD flask db init && flask db migrate && flask db upgrade && flask run --host 0.0.0.0 --port $PORT
