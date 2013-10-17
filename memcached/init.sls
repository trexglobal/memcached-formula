memcached:
  pkg:
    - installed
  service.running:
    - enable: True
    - require:
      - pkg: memcached
    - watch:
      - file: /etc/memcached.conf

/etc/memcached.conf:
  file.managed:
    - template: jinja
    - source: salt://memcached/files/memcached.conf.jinja
    - require:
      - pkg: memcached
