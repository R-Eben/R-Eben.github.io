---
layout: default
title: Hobbies
permalink: /hobbies/
---

<div class="media-row">
  <p>Two of my favorite hobbies are astronomy and playing piano. I also enjoy skiing in the winter, and playing board and video games.</p>
<figure>
  <img src="{{ '/assets/images/bromley.jpeg' | relative_url }}" alt="Eben in a ski helmet and goggles at the top of a ski lift, with snowy Vermont mountains behind him">
  <figcaption>Bromley mountain in Southern VT.</figcaption>
</figure>
</div>

<h2 id="astrophotography">Astronomy</h2>

{% assign astro = site.data.astrophotography %}
I enjoy both visual observation through my 8-inch Dobsonian telescope and astrophotography with my computerized setup.

<div class="photo-pair">
  <figure>
    <img src="{{ '/assets/images/dob_winter.jpeg' | relative_url }}" alt="An 8-inch Apertura Dobsonian telescope set up on snow at night, next to an observing chair and eyepiece case" loading="lazy">
    <figcaption>My 8-inch Dobsonian set up outside my dorm in December 2025.</figcaption>
  </figure>
  <figure>
    <img src="{{ '/assets/images/stellafane.jpg' | relative_url }}" alt="Amateur astronomers browsing tables of telescopes and eyepieces in a wooded field at Stellafane" loading="lazy">
    <figcaption>Swap tables at Stellafane Convention in August 2026.</figcaption>
  </figure>
</div>

Here are some of my favorite astrophotography results. I take, stack, and process everything myself.

{% if astro.photos and astro.photos.size > 0 %}
<ul class="gallery">
{%- for photo in astro.photos %}
  {%- assign full = photo.image | relative_url -%}
  {%- assign thumb = photo.thumb | default: photo.image | relative_url %}
  <li>
    <a class="gallery-item" href="{{ full }}"
       data-title="{{ photo.title | escape }}"
       data-meta="{% if photo.catalog %}{{ photo.catalog | escape }}{% endif %}{% if photo.date %} · {{ photo.date | date: '%B %Y' }}{% endif %}{% if photo.location %} · {{ photo.location | escape }}{% endif %}"
       data-detail="{% if photo.integration %}Integration: {{ photo.integration | escape }}. {% endif %}{{ photo.notes | escape }}">
      <img src="{{ thumb }}" alt="{{ photo.title | escape }}{% if photo.catalog %} ({{ photo.catalog | escape }}){% endif %}" loading="lazy">
      <span class="gallery-caption">{{ photo.title }}{% if photo.catalog %} <small>{{ photo.catalog }}</small>{% endif %}</span>
    </a>
  </li>
{%- endfor %}
</ul>
{% else %}
<p class="empty-note">Photos coming soon.</p>
{% endif %}

<div class="media-row small-photo">
  <p>All photos were taken via a ZWO ASI533MC Pro camera, through an Apertura 72mm doublet refractor mounted on an AM3 harmonic drive mount, with autoguiding and an ASIAir for control. Stacking and postprocessing of all photos was done in Siril and GraXpert.</p>
  <figure>
    <img src="{{ '/assets/images/photographing.jpeg' | relative_url }}" alt="Astrophotography rig at night: a camera and telescope on a tripod-mounted harmonic drive mount, with cables, a power station, and a laptop on a small table" loading="lazy">
    <figcaption>Imaging Andromeda in fall 2025.</figcaption>
  </figure>
</div>

<h2 id="piano">Piano</h2>

{% assign recordings = site.data.piano.recordings %}
I have been playing the piano since I was 6. I take lessons which focus on classical music, but my favorite things to play are arrangements of soundtracks from video games and movies, such as the Ghibli Medley below. I am also part of a small music ensemble with a few friends at UVM, meeting weekly.

{% if recordings and recordings.size > 0 %}
<ul class="recordings">
{%- for rec in recordings %}
  <li class="recording">
    <div class="recording-head">
      <h3>{{ rec.title }}</h3>
      <p class="recording-meta">{{ rec.composer }}{% if rec.composer and rec.date %} · {% endif %}{% if rec.date %}{{ rec.date }}{% endif %}</p>
    </div>
    {%- if rec.youtube %}
    <div class="video">
      <button type="button" class="video-facade" data-youtube="{{ rec.youtube | escape }}" aria-label="Play {{ rec.title | escape }} (loads a YouTube video)">
        <img src="https://i.ytimg.com/vi/{{ rec.youtube | escape }}/hqdefault.jpg" alt="" loading="lazy">
        <span class="play-icon" aria-hidden="true"></span>
      </button>
      <noscript><a href="https://www.youtube.com/watch?v={{ rec.youtube | escape }}">Watch on YouTube</a></noscript>
    </div>
    {%- elsif rec.audio %}
    <audio controls preload="none" src="{{ rec.audio | relative_url }}">
      <a href="{{ rec.audio | relative_url }}">Download the recording</a>
    </audio>
    {%- endif %}
    {%- if rec.notes %}
    <p>{{ rec.notes }}</p>
    {%- endif %}
  </li>
{%- endfor %}
</ul>
{% else %}
<p class="empty-note">Recordings coming soon.</p>
{% endif %}

<dialog class="lightbox" aria-label="Photo viewer">
  <div class="lightbox-view">
    <div class="lightbox-stage">
      <img alt="">
    </div>
    <div class="lightbox-tools">
      <a class="lightbox-btn lightbox-open" href="#" target="_blank" rel="noopener">Full size</a>
      <button type="button" class="lightbox-btn lightbox-fs">Fullscreen</button>
      <form method="dialog"><button class="lightbox-btn lightbox-close" aria-label="Close">&times;</button></form>
    </div>
    <p class="lightbox-hint">Click to zoom</p>
  </div>
  <div class="lightbox-text">
    <p class="lightbox-title"></p>
    <p class="lightbox-meta"></p>
    <p class="lightbox-detail"></p>
  </div>
</dialog>