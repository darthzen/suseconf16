# reactor for logins
{% set minionid = data['data']['id'] %}
{% set username = data['data']['user'] %}
{% set fromhost = data['data']['hostname'] %}

{% set color = 'green' %}
{% set message = 'A user has logged into ' + minionid %}

invoke_orchestrate_file:
  runner.state.orchestrate:
    - mods: demo.logins
    - pillar:
        minionid: {{ sitename }}
        username: {{ nodename }}
        fromhost: {{ fromhost }}
        color: {{ color }}
        message: {{ message }}

