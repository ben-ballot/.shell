Install common python packages:
  pkg.latest:
    - pkgs:
      - virtualenvwrapper

Install python3 packages:
  pkg.latest:
    - pkgs:
      - ipython3
      - pyflakes3
      - python3-jedi
      - python3-pip
