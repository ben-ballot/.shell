# Configure docker based on the right OS

include:
  - docker.{{ grains['os'] }}

install docker engine:
  pkg.latest:
    - name: docker-engine
    - require:
      - pkgrepo: configure docker repository

stop docker before configuration change:
  service.dead:
    - name: docker

start docker:
  service.running:
    - name: docker
    - enable: True
    - watch:
      - file: configure docker

configure docker:
  file.managed:
    - name: /etc/docker/daemon.json
    - source: salt://docker/files/daemon.json.tmpl
    - template: jinja
    - user: root
    - group: root
    - mode: 600
    - prereq_in:
      - service: stop docker before configuration change
