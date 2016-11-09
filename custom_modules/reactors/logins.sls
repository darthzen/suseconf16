# reactor for logins
{% set minionid = data['data']['id'] %}
{% set username = data['data']['user'] %}
{% set fromhost = data['data']['hostname'] %}

{% set color = 'green' %}
{% set message = username + ' failed to log into ' + minionid %}

invoke_orchestrate_file:
  runner.state.orchestrate:
    - mods: demo.logins
    - pillar:
        minionid: {{ minionid }}
        username: {{ username }}
        fromhost: {{ fromhost }}
        color: {{ color }}
        message: {{ message }}

