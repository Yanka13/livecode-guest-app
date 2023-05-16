FROM python:3.8-buster

COPY app/requirements.txt /requirements.txt

RUN pip install -r requirements.txt

COPY app/templates app/templates
COPY app/app.py app/app.py
COPY app/models.py app/models.py

WORKDIR app/

ENV FLASK_APP=app.py

CMD flask db init && flask db migrate && flask db upgrade && flask run -h 0.0.0.0 --port $PORT
