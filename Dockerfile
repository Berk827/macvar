FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
COPY app.py .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 10000

CMD gunicorn app:app --bind 0.0.0.0:10000 --worker-class gevent --workers 4 --timeout 120
