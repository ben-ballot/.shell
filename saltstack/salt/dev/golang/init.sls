# Manage golang stuff
#

{%- from "user/info.sls" import user_info with context %}
{%- from "dev/map.jinja" import golang with context %}

{%- set goroot = user_info("home") ~ golang.user_goroot %}
{%- set gopath = user_info("home") ~ golang.user_gopath %}

install golang {{ golang.version }} for {{ user_info("name") }}:
  archive.extracted:
    - name: {{  user_info("home") }}
    - source: https://storage.googleapis.com/golang/go{{ golang.version }}.{{ grains['kernel']|lower }}-{{ grains['osarch'] }}.tar.gz
    - source_hash: sha256={{ golang.sha256 }}
    - archive_format: tar
    - archive_user: {{ user_info("name") }}
    - options: v
