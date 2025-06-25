FROM python:3.9-buster

WORKDIR /app
COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["gunicorn", "studybud.wsgi:application", "--bind", "0.0.0.0:10000"]
