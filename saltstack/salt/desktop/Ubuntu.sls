# Include all Ubuntu related stuff for a desktop

setup multiverse:
  pkg.installed:
    - name: software-properties-common
  cmd.run:
    - name: add-apt-repository multiverse
    - require:
      - pkg: setup multiverse

setup kernel ppa:
  pkgrepo.managed:
    - ppa: kernel-ppa/ppa

desktop packages:
  pkg.installed:
    - pkgs:
      - chromium-browser
      - terminator
      - vim-gtk
      - network-manager-openvpn
