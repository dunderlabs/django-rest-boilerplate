# Backend setup
FROM python:3.10.8 AS backend-base

# Unbuffer Python logs
ENV PYTHONUNBUFFERED=1
ENV POETRY_VERSION=1.2.2

RUN pip install poetry==$POETRY_VERSION

WORKDIR /app
COPY . .

# Project initialization:
RUN poetry config virtualenvs.create false && poetry install --no-dev --no-interaction --no-ansi

# Static files

# Backend setup
FROM backend-base AS backend-development

# Install dev dependencies
RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi

FROM backend-development AS backend-production

CMD [ "gunicorn", "backend.wsgi", "--log-file -" ]
