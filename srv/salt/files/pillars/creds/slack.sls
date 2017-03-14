slack:
  channel: suseconf16
  from_name: MasterServer
  api_key: {{ salt['sdb.get']('sdb://saltconfig/creds?slack') }}