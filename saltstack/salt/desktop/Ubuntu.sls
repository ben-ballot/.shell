# Include all Ubuntu related stuff for a desktop



setup mutiverse:
  pkg.installed:
    - name: software-properties-common
  cmd.run:
    - name: add-apt-repository multiverse
    - require:
      - pkg: setup multiverse
