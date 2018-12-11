fail2ban:
  pkg.installed

/etc/fail2ban/jail.local:
  file.managed:
    - source: salt://fail2ban/jail.local

fail2banservice:
  service.running:
    - name: fail2ban
    - watch:
      - file: /etc/fail2ban/jail.local
