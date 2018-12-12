/home/xubuntu/Public/backup.sh:
  file.managed:
    - source: salt://backup/backup.sh
    - user: root
    - group: root
    - mode: 644
run:
  cmd.script:
    - require:
      - file: /home/xubuntu/Public/backup.sh
    - source: /home/xubuntu/Public/backup.sh
    - user: root
    - group: root
    - shell: /bin/bash

