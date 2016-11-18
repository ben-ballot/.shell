# All specific github.com related stuff

{%- from 'user/info.sls' import user_info with context %}

ssh known_hosts for github.com:
  ssh_known_hosts.present:
    - name: github.com
    - user: {{ user_info('name') }}
    - enc: ssh-rsa
    - fingerprint: 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48
