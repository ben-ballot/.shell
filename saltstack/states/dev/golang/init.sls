# Manage golang stuff
#

{%- from "user/info.sls" import user_info with context %}
{%- from "dev/map.jinja" import golang with context %}

{%- set goroot = user_info("home") ~ golang.user_goroot %}
{%- set gopath = user_info("home") ~ golang.user_gopath %}
{%- set golang_archive = "go" ~ golang.version ~ "." ~ grains['kernel']|lower ~ "-" ~ grains['osarch'] ~ ".tar.gz" %}


remove old golang version:
  file.absent:
    - name: {{ goroot }}
    - prereq: 
      - file: download golang {{ golang.version }} for {{ user_info("name") }}

download golang {{ golang.version }} for {{ user_info("name") }}:
  file.managed:
    - name: {{ user_info("home") }}/Downloads/{{ golang_archive }}
    - source: https://storage.googleapis.com/golang/{{ golang_archive }}
    - source_hash: sha256={{ golang.sha256 }}
    - user: {{ user_info("uid") }}
    - group: {{ user_info("gid") }}

install golang {{ golang.version }} for {{ user_info("name") }}:
  archive.extracted:
    - name: {{  user_info("home") }}
    - source: {{ user_info("home") }}/Downloads/{{ golang_archive }}
    - archive_format: tar
    - user: {{ user_info("name") }}
    - group: {{ user_info("gid") }}
    - options: v
    - if_missing: {{ goroot }}
    - onchanges:
      - file: download golang {{ golang.version }} for {{ user_info("name") }}
