# Common stuff
#

include:
  - common.{{ grains['os_family'] }}

install common packages:
  pkg.installed:
    - pkgs:
      - curl
      - python-pip
