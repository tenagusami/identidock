FROM python:3.8

# RUN pip install Flask==0.10.1
# WORKDIR /app

# COPY app /app
# CMD ["python", "identidock.py"]

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask uWSGI requests redis
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi
CMD ["/cmd.sh"]
