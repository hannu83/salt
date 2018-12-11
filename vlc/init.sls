vlc:
  pkg.installed

#vlc_service:
#  service.running:
#    - name: vlc
#    - enable: True

create_dir:
  file.directory:
    - name: c:\Users\hasba\Application Data\vlc

C:\Users\hasba\Application Data\vlc\vlcrc:
  file.managed:
    - source: salt://vlc/vlcrc
