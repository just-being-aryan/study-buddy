FROM python:3.9.18

WORKDIR /app

COPY requirements.txt .

# Upgrade pip and install system dependencies for Pillow
RUN pip install --upgrade pip && \
    apt-get update && \
    apt-get install -y libjpeg-dev zlib1g-dev && \
    pip install -r requirements.txt

COPY . .

CMD ["gunicorn", "studybud.wsgi:application", "--bind", "0.0.0.0:10000"]