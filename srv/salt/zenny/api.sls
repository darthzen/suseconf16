# Support for zenny api

# install python tornado
"Python PIP package install":
  pkg.installed:
    - name: python-pip

"PIP install tornado":
  pip.installed:
    - name: tornado
    - require:
      - pkg: python-pip

# deploy api code

"Deploy API code":
  file.managed:
    - name: '/web/api.py'
    - source: salt://zenny/api.py
    - makedirs: True

# start api service
