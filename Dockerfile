FROM python:3.8.0-buster

ARG RDS_HOSTNAME
ARG RDS_PORT
ARG RDS_DB_NAME
ARG RDS_USERNAME
ARG RDS_PASSWORD

ENV RDS_HOSTNAME=$RDS_HOSTNAME
ENV RDS_PORT=$RDS_PORT
ENV RDS_DB_NAME=$RDS_DB_NAME
ENV RDS_USERNAME=$RDS_USERNAME
ENV RDS_PASSWORD=$RDS_PASSWORD

RUN adduser --disabled-password --gecos "" armybuilder

WORKDIR /home/armybuilder

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY armybuilder armybuilder
COPY setup.py setup.py
RUN python setup.py install
COPY run.py ./
RUN chmod a+x ./run.py

ENV FLASK_APP armybuilder

RUN chown -R armybuilder:armybuilder ./
USER armybuilder

EXPOSE 5000
CMD python run.py