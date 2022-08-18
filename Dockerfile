FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

ENV APP_DIR /app
WORKDIR $APP_DIR

COPY requirements.txt .

RUN apt-get update && \
    apt-get install -yy libpq-dev build-essential

ENV PATH="/root/.local/bin:$PATH"
RUN pip install --disable-pip-version-check --user -r requirements.txt

COPY . .

CMD uvicorn main:app --host 0.0.0.0 --port 80