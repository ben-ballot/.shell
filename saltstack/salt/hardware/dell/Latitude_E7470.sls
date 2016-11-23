{%- if grains['init'] == 'systemd' %}
suspend on lid close:
  file.append:
    - name: /etc/systemd/logind.conf
    - text: HandleLidSwitch=suspend

ignore login on dock/undock:
  file.append:
    - name: /etc/systemd/logind.conf
    - text: HandleLidSwitchDocked=ignore
{%- endif %}
