#!/usr/bin/env bash

activate_venv() {
  [[ -f ./venv/bin/activate ]] || {
    virtualenv venv/
    source ./venv/bin/activate
    pip install -U setuptools
    pip install -U pip
    pip install -r requirements.txt
    deactivate
  }

  source ./venv/bin/activate
  pip install -r requirements.txt
}

run_flask() {
  ## this function is not used
  export FLASK_APP=app.py
  export FLASK_DEBUG=1
  flask run \
    -p 5000 \
    -h '0.0.0.0'
}

run_gunicorn() {
  gunicorn app:app -b 0.0.0.0:8000
}

activate_venv
[[ $1 == 'run' ]] && run_gunicorn
