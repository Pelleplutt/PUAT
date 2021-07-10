FROM alpine:latest AS sass
#RUN apk add sassc imagemagick curl
#COPY sass/* /sass/
#RUN for fil in /sass/*.scss; do sassc $fil > /sass/$(basename $fil .scss).css; done

FROM python:3.9

COPY requirements.txt /app/
RUN pip install -r /app/requirements.txt
RUN addgroup puat
RUN adduser --disabled-password --no-create-home --home /app  --gecos '' --ingroup puat puat

COPY puat_main.py /app/puat_main.py
COPY puat_wsgi.py /app/puat_wsgi.py
COPY puat /app/puat/
COPY api /app/api/
#COPY static /app/static/
#COPY templates /app/templates/
#COPY puat.ini /app/puat.ini
#COPY --from=sass /sass/*.css /app/static/css/

EXPOSE 5000
ENV TZ=Europe/Stockholm

USER puat:puat
WORKDIR /app
CMD ["/usr/local/bin/gunicorn", "--bind", ":5000", "--access-logfile", "-", "--error-logfile", "-", "--capture-output", "puat_wsgi:app"]