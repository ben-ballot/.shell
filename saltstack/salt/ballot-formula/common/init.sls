# Common stuff
#

include:
  - .{{ grains['os_family'] }}

install common packages:
  pkg.installed:
    - pkgs:
      - curl
      - python-pip
