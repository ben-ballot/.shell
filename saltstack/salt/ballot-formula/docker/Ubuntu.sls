# Docker for ubuntu distribution
#

include:
  - ballot-formula.common

configure docker repository:
  pkgrepo.managed:
    - humanname: Docker repository
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ grains['oscodename'] }} stable
    - dist: {{ grains['oscodename'] }}
    - file: /etc/apt/sources.list.d/docker.list
    - clean_file: true
    - keyid: 58118E89F3A912897C070ADBF76221572C52609D
    - keyserver: p80.pool.sks-keyservers.net
    - refresh_db: true
    - require:
      - pkg: set apt to works with https
