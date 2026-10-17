---
layout: default
title: Eben Radocchia
hide_title: false
permalink: /
---

<div class="intro{% if site.data.contact.photo %} has-photo{% endif %}">
  {%- if site.data.contact.photo %}
  <img class="intro-photo" src="{{ site.data.contact.photo | relative_url }}" alt="Portrait of Eben Radocchia">
  {%- endif %}
  <div markdown="1">

I'm an Electrical Engineering student at the University of Vermont (Class of 2029), also pursuing the undergraduate certificate in Autonomy and Robotics. I'm originally from Bennington, Vermont.

I lead the inverter project on UVM's Alternative Energy Racing Organization (AERO) electrical team, handling motor and inverter setup, calibration, and integration for the 2026–27 season. In 2026 I helped the team get the car's wheels spinning for competition for the first time since before the pandemic. I'm also an undergraduate researcher at UVM, working under Dr. Duffaut on the Autonomous Weeding Robot, utilizing tools such as Ros2 and RViz with the goal of implemeting more advanced autonomous capabilities on the robot.

Before UVM, I captained FIRST Team 18650 and led it to the winning alliance at the 2024–25 Vermont State Championship. I still mentor the team on software and prototyping, and helped guide them to the 2026 FIRST World Championship in Houston, the first southern Vermont team ever to qualify.

<div class="button-row">
  <a class="button" href="{{ site.data.contact.resume }}">Resume (PDF)</a>
</div>

  </div>
</div>

## Projects

{% assign projects = site.pages | where: "type", "project" | sort: "date" | reverse %}
<ul class="card-list">
{%- for p in projects limit: 4 %}
  {%- include project-card.html project=p %}
{%- endfor %}
</ul>

[All projects &rarr;]({{ '/projects/' | relative_url }})

## Other Interests

I'm also into astronomy (visual and photographic) and piano. [Some of my photos are visible here &rarr;]({{ '/hobbies/' | relative_url }})
