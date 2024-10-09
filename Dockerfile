# Use Python base image
FROM python:3.13.0rc2-slim
LABEL authors="Emmanuel"


RUN apt-get update && \
    apt-get install -y default-libmysqlclient-dev build-essential pkg-config


RUN pip install --upgrade pip


WORKDIR /app


ENV VIRTUAL_ENV=/home/app/venv
RUN python -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"


COPY app.py requirements.txt ./


RUN pip install -r requirements.txt


RUN useradd --uid 1000 myuser
RUN mkdir -p /home/myuser
RUN chown -R myuser:myuser /home/myuser
USER myuser


EXPOSE 80


ENTRYPOINT ["python","app.py"]