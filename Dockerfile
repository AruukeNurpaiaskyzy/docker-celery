# FROM python:3.11.0-alpine
# WORKDIR /usr/src/app
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1
# RUN pip install --upgrade pip
# RUN apk update
# RUN apk add postgresql-dev gcc python3-dev musl-dev
# COPY requirements.txt .
# RUN pip install -r requirements.txt
# COPY entrypoint.sh .
# RUN sed -i 's/\r$//g' /usr/src/app/entrypoint.sh
# RUN chmod +x /usr/src/app/entrypoint.sh
# COPY .. .
# ENV HOME=/home/app
# ENV APP_HOME=/home/app/web
# RUN mkdir $HOME
# RUN mkdir $APP_HOME
# WORKDIR $APP_HOME
# COPY .. $APP_HOME
# RUN mkdir $APP_HOME/staticfiles
# RUN mkdir $APP_HOME/mediafiles
# ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
FROM python:3.11-slim
WORKDIR /usr/src/app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]