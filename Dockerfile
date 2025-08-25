FROM python:3.12-bullseye

ENV PYTHONUNBUFFERED=1

WORKDIR /code


RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*


COPY requirements.txt ./
RUN pip install --upgrade pip
RUN pip install -r requirements.txt


COPY . .

EXPOSE 8000

ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8000"]