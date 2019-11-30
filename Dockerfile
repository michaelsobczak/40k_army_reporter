FROM python:3.8.0-buster

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