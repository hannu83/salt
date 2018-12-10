install_apache:
  pkg.installed:
    - pkgs:
      - apache2
      - libapache2-mod-php
      - php

/var/www/html/index.php:
  file:
    - managed
    - source: salt://LAMP/webserver/index.php
    - require:
      - pkg: install_apache

/var/www/html/index.html:
  file:
    - absent
    - require:
      - pkg: install_apache

