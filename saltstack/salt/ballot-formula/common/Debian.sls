# Common stuff for ubuntu distributions
#

common packages for Debian based distributions:
  pkg.installed:
    - pkgs:
      - apt-file
      - htop
      - tcpdump

set apt to works with https:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - ca-certificates
