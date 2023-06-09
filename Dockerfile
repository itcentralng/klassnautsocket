FROM python:3.9

RUN mkdir app

RUN cd app

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD ["gunicorn", "-k", "eventlet", "app:app", "-b", "0.0.0.0:80"]

EXPOSE 80