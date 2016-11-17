# Docker for ubuntu distribution
#

set apt to works with https:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - ca-certificates

configure docker repository:
  pkgrepo.managed:
    - humanname: Docker repository
    - name: deb https://apt.dockerproject.org/repo ubuntu-{{ grains['oscodename'] }} main
    - dist: ubuntu-{{ grains['oscodename'] }}
    - file: /etc/apt/sources.list.d/docker.list
    - keyid: 58118E89F3A912897C070ADBF76221572C52609D
    - keyserver: p80.pool.sks-keyservers.net
    - refresh_db: true
    - require:
      - pkg: set apt to works with https
