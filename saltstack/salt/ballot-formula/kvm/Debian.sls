Install lib-virt:
  pkg.latest:
    - pkgs:
      - bridge-utils
      - libvirt-clients
      - libvirt-daemon
      - libvirt-daemon-system
      - qemu
      - qemu-kvm
      - qemu-utils
      - virt-manager
      - virtinst
