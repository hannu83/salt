cmd.run:
- unless: "echo 'show databases'|sudo mariadb -u root|grep '^houses$'"
