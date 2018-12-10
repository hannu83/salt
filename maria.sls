install_mariadb:
  pkg.installed:
    - pkgs:
      - mariadb-server
      - mariadb-client


