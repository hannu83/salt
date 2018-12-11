install_lamp:
  pkg.installed:
    - pkgs:
      - apache2
      - libapache2-mod-php 
<<<<<<< HEAD
      - php-mysql
      - mariadb-server
      - mariadb-client
=======
      - mariadb-client
      - mariadb-server
>>>>>>> 55a1a1ed4472d68cf5a64b66e1a869ae8f583dd7

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

