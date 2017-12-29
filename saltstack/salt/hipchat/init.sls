# Configure hipchat
#

include:
  - .{{ grains['os'] }}

install hipchat4:
  pkg.latest:
    - name: hipchat4
    - require:
      - pkgrepo: configure hipchat4 repository
