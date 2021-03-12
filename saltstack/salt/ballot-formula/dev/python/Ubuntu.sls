Install common python packages:
  pkg.latest:
    - pkgs:
      - virtualenvwrapper

Install python2 packages:
  pkg.latest:
    - pkgs:
      - flake8
      - ipython
      - pyflakes
      - python-dev
      - python-flake8
      - python-jedi
      - python-pip

Install python3 packages:
  pkg.latest:
    - pkgs:
      - ipython3
      - pyflakes3
      - python3-jedi
      - python3-pip
