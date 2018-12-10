{% if "Windows" == grains["os"] %}
{%      set hellofile = "C:\hellohannu.txt" %}
{% else %}
{%      set hellofile = "/tmp/hellohannu.txt" %}
{% endif %}

{{ hellofile }}:
  file.managed:
  - source: salt://hello/hellohannu.txt

