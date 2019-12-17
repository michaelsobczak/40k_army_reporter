# 40k_army_reporter
# python scripts/generate_report.py 
# to execute the generate report function

Requirements:
- docker
- pipenv
- pyenv

Setup:
    brew install docker pyenv pipenv

To run the app:
    pipenv shell
    FLASK_DEBUG=true FLASK_APP=armybuilder flask run

To do docker stuff:
    - Go install it from docker.io, you need to make account :(


To set up postgres stuff

- install postgres
- createdb armybuilder
- NOTE: from bash (/bin/bash)
- source scripts/setup_env.sh
- dropdb armybuilder && createdb armybuilder && alembic upgrade head && rm failure.csv && python scripts/parse_book.py dbtools/content.txt