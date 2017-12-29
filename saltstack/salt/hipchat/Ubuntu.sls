# Ubuntu specific settings
#

include:
  - common

configure hipchat4 repository:
  pkgrepo.managed:
    - name: deb https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client {{ grains['oscodename'] }} main
    - file: /etc/apt/sources.list.d/atlassian-hipchat4.list
    - clean_file: true
    - key_url: https://atlassian.artifactoryonline.com/atlassian/api/gpg/key/public
    - require:
      - pkg: set apt to works with https
