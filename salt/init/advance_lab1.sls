# Push all file configs for advance_lab_1

"Deploy custom modules":
  file.recurse:
    - name: '/srv/modules/'
    - source: salt://custom_modules
    - makedirs: True

"Deploy master configs":
  file.recures:
    - name: '/etc/salt/master.d/'
    - source: salt://files/master-d-configs/

"Restart master":
  cmd.run:
    - name: echo service salt-master restart | at now + 1 minute