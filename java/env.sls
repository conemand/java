include:
  - java.install

{% from 'java/map.jinja' import java with context %}

java-env:
  file.managed:
    - name: /etc/profile.d/java.sh
    - mode: 644
    - user: root
    - group: root
    - contents: |
        export JAVA_HOME={{ java.get('jre8').home }}
