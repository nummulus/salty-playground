#simple jenkins install

run-nexus:
  cmd.run:
    - name: nexus-2.7.0-03/bin/nexus start
    - cwd: /opt/sonatype/nexus-2.7.0
  require:
    - sls: java

untar-nexus:
  cmd.run:
    - name: tar xvzf nexus-2.7.0-bundle.tar.gz
    - cwd: /opt/sonatype/nexus-2.7.0
    - require: 
      - cmd.run: download-and-get-nexus

download-and-get-nexus:
  cmd.run:
    - name: wget -q http://www.sonatype.org/downloads/nexus-2.7.0-bundle.tar.gz
    - cwd: /opt/sonatype/nexus-2.7.0
    - unless: "[ -e  /opt/sonatype/nexus-2.7.0/nexus-2.7.0-bundle.tar.gz ]"
    - require:
      - file: /opt/sonatype/nexus-2.7.0
  
/opt/sonatype/nexus-2.7.0:
    file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True
    - recurse:
        - user
        - group
        - mode