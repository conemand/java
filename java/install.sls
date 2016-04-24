{% from 'java/map.jinja' import java with context %}

{% for jre, jreinfo in java.iteritems() %}
jre-{{ jre }}-download:
  cmd.run:
    - name: "curl -Lsb oraclelicense=accept-securebackup-cookie '{{ jreinfo.url }}' > '{{ jreinfo.rpm }}'"
    - creates: {{ jreinfo.rpm }}

{{ jre }}:
  pkg.installed:
    - sources:
      - {{ jreinfo.package }}: {{ jreinfo.rpm }}
{% endfor %}
