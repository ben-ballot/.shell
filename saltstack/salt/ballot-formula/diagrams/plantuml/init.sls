# Manage PlantUML installation
#

{%- from "user/info.sls" import user_info with context %}
{%- set plantuml_jar = user_info("home") ~ "/.local/share/plantuml/plantuml.jar" %}

downlaod PlantUML jar file:
  file.managed:
    - name: {{ plantuml_jar }}
    - user: {{ user_info("uid") }}
    - group: {{ user_info("gid") }}
    - source: https://sourceforge.net/projects/plantuml/files/plantuml.jar/download?use_mirror=autoselect
    - skip_verify: True
    - mode: 640
    - makedirs: True
    - dir_mode: 750

create wrapper script for PlantUML:
  file.managed:
    - name: {{ user_info("home") }}/.local/bin/plantuml
    - user: {{ user_info("uid") }}
    - group: {{ user_info("gid") }}
    - mode: 750
    - makedirs: True
    - dir_mode: 750
    - contents: |
        #!/bin/bash
        # Provide plantuml function
        # Excpecting plantuml jar file in $HOME/.local.share/plantuml/plantuml.jar

        java -jar "$HOME"/.local/share/plantuml/plantuml.jar "$@"
