{%- from "vagrant/map.jinja" import vagrant with context %}
{%- from "user/info.sls" import user_info with context %}

{%- set plugins = [
    "vagrant-mutate",
    "sahara",
  ]
%}

include:
  - kvm

Install Vagrant:
  pkg.installed:
    - sources:
      - vagrant: {{ vagrant.url }}

Install vagrant-libvirt dependencies:
  pkg.installed:
    - pkgs:
      - libvirt-dev
      - libxml2-dev
      - libxslt1-dev
      - ruby-dev
      - zlib1g-dev

Install vagrant-libvirt plugin:
  cmd.run:
    - name: "vagrant plugin install vagrant-libvirt"
    - runas: {{ user_info("name") }}
    - env:
      - CONFIGURE_ARGS: "with-libvirt-include=/usr/include/libvirt with-libvirt-lib=/usr/lib"
    - require:
      - pkg: Install Vagrant
      - pkg: Install vagrant-libvirt dependencies


{%- for plugin in plugins %}
Install {{ plugin }} plugin:
  cmd.run:
    - name: "vagrant plugin install {{ plugin }}"
    - runas: {{ user_info("name") }}
    - require:
      - pkg: Install Vagrant

{% endfor -%}
