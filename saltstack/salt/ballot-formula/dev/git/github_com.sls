# All specific github.com related stuff

{%- from 'ballot-formula/user/info.sls' import user_info with context %}

ssh known_hosts for github.com:
  ssh_known_hosts.present:
    - name: github.com
    - user: {{ user_info('name') }}
    - enc: ed25519
    - key: AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl
    - hash_known_hosts: True
