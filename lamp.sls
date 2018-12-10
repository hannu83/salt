install_lamp:
  pkg.installed:
    - pkgs:
      - apache2
      - libapache2-mod-php 
      - php-mysql
      - mariadb-server
      - mariadb-client

/var/www/html/index.php:
  file:
    - managed
    - source: salt://LAMP/webserver/index.php
    - require:
      - pkg: install_lamp

/var/www/html/index.html:
  file:
    - absent
    - require:
      - pkg: install_lamp

/tmp/createuser.sql:
  file.managed:
    - mode: 600
    - source: salt://maria/createuser.sql

