#
# Terminal specific stuff
#

include:
  - .{{ grains['os'] }}


install terminology:
  pkg.latest:
    - name: terminology
    - require:
      - pkgrepo: configure terminology repository
