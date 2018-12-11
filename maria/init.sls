mariadb-client:
  pkg.installed

mariadb-server:
  pkg.installed

create_testdb:
  cmd.run:
    - name: 'echo create database books|sudo mariadb -u root'
    - require:
      - mariadb-client
    - unless: 'echo show databases|sudo mariadb -u root|grep books'

create_testdbuser:
  cmd.run:
    - name: echo "grant all on books.* to books@localhost identified by 'password'"|sudo mariadb -u root
    - require:
      - mariadb-client
    - unless: 'echo select user from mysql.user|sudo mariadb -u root|grep books'
