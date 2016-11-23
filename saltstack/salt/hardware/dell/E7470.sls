{%- if grains['init'] == 'systemd %}
suspend on lid close:
  file.line:
    - name: /etc/systemd/logind.conf
    - content: HandleLidSwitch=suspend
    - mode: ensure
    - location: end

ignore login on dock/undock:
  file.line:
    - name: /etc/systemd/logind.conf
    - content: HandleLidSwitchDocked=ignore
    - mode: ensure
    - location: end
{%- endif %}
