---
layout: default
title: Projects
permalink: /projects/
---

Some fun things I've worked on.

{% assign projects = site.pages | where: "type", "project" | sort: "date" | reverse %}
<ul class="card-list">
{%- for p in projects %}
  {%- include project-card.html project=p %}
{%- endfor %}
</ul>
