base:
  '*':
    - ballot-formula.common

  'roles:desktop':
    - match: grain
    - ballot-formula.desktop

  'roles:server':
    - match: grain
    - ballot-formula.docker
