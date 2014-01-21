# Copyright 2013 Hewlett-Packard Development Company, L.P.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.
#

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

/var/run/memcached:
  file.directory:
    - user: memcache
    - group: memcache
    - mode: 0755
    - require:
      - pkg: memcached


