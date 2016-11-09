
{% set minionid = pillar.get('minionid', '') %}
{% set username = pillar.get('username', '') %}
{% set fromhost = pillar.get('fromhost', '') %}
{% set color = pillar.get('color', '') %}
{% set message = pillar.get('message', '') %}


"Send text via xMatters":
  salt.runner:
    - name: xmatters.create_event
    - eventid: 1
    - priority: 1
    - message: {{ message }}
    - minionid: {{ minionid }}

"Send alert to Slack":
  salt.state:
    - tgt: 'master1'
    - sls:
      - slack.blast
    - pillar:
        mymessage: {{ message }}

'Send update to zenny':
  salt.state:
    - tgt: 'zenny'
    - sls:
      - zenny.message
    - pillar:
        color: {{ color }}
        message: {{ message }}