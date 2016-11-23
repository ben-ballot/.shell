# Include all Ubuntu related stuff for a desktop

setup multiverse:
  pkg.installed:
    - name: software-properties-common
  cmd.run:
    - name: add-apt-repository multiverse
    - require:
      - pkg: setup multiverse

desktop packages:
  pkg.installed:
    - pkgs:
      - acpi
      - chromium-browser
      - dconf-editor
      - network-manager-openvpn
      - terminator
      - vim-gtk
