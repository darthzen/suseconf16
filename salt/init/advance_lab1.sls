# Push all file configs for advance_lab_1

{% if grains['os_family'] == 'RedHat' %}
    {% set filename = '/usr/lib/python2.7/site-packages/salt' %}

{% elif grains['os_family'] == 'Debian' %}
    {% set filename = '/usr/lib/python2.7/dist-packages/salt' %}

{% elif grains['os_family'] == 'Suse' %}
    {% set filename = '/usr/lib/python2.7/site-packages/salt' %}

{% endif %}


"Deploy custom modules":
  file.recurse:
    - name: '/srv/modules/'
    - source: salt://custom_modules
    - makedirs: True

"Deploy master configs":
  file.recurse:
    - name: '/etc/salt/master.d/'
    - source: salt://files/master-d-configs/

# PR is in for this fix
"Update config init file":
  file.managed:
    - name: {{ filename }}/config/__init__.py
    - source: salt://files/fixes/config-__init__.py

"Restart master":
  cmd.run:
    - name: echo service salt-master restart | at now + 1 minute