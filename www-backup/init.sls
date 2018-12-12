/home/xubuntu/Public/www-backup.sh:
  file.managed:
    - source: salt://www-backup/www-backup.sh
    - user: root
    - group: root
    - mode: 644

run:
  cmd.script:
    - require:
      - file: /home/xubuntu/Public/www-backup.sh
    - source: /home/xubuntu/Public/www-backup.sh
    - user: root
    - group: root
    - shell: /bin/bash 
