FROM python:3.9.18-alpine AS builder

RUN apk update && \
    apk add musl-dev libpq-dev gcc

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt

FROM python:3.9.18-alpine

RUN apk update && \
    apk add libpq-dev

COPY --from=builder /opt/venv /opt/venv

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/opt/venv/bin:$PATH"
