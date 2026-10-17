# Eben Radocchia — personal site

A Jekyll site hosted on GitHub Pages.

## Run it locally

Use **Ruby 3.3** (on Windows: RubyInstaller's *Ruby+Devkit 3.3.x (x64)*). GitHub Pages builds with Jekyll 3, which is unreliable on newer Ruby (4.x fails outright). If you switch Ruby versions, delete `Gemfile.lock` before `bundle install`.

```sh
bundle install
bundle exec jekyll serve
```

Then open http://localhost:4000.

## Publish on GitHub Pages

1. Create a repository named `R-Eben.github.io` (a user site; `baseurl` stays empty).
   For any other repo name, set `baseurl: "/<repo-name>"` in `_config.yml`.
2. Push this folder to the `main` branch.
3. In the repo, go to **Settings → Pages** and set the source to *Deploy from a branch*, `main`, `/ (root)`.

## Architecture

| Path | What it is |
| --- | --- |
| `*.md` (root) | Top-level content pages: Markdown with YAML front matter (`layout: default`). |
| `projects/<project-name>/index.md` | One folder per project, with its images and documents. Set `type: project`, `date`, `summary`, and (optionally) `thumbnail` in front matter to list it on the home and Projects pages. |
| `_layouts/default.html` | Main layout: HTML, inline CSS, and JS. Desktop sidebar (branding scrolls away, nav stays put), expandable mobile menu, page banner, and footer. |
| `hobbies.md` | Astrophotography gallery and piano recordings, rendered from `_data/astrophotography.yml` and `_data/piano.yml`. |
| `assets/astrophotography/`, `assets/piano/` | Image and audio files for the hobbies page. |
| `_includes/` | `navigation.html`, `footer.html`, `banner.html`, `project-card.html`. |
| `_data/astrophotography.yml`, `_data/piano.yml` | Photo and recording lists (instructions inside each file). |
| `_data/navigation.yml` | Site navigation: a fixed two-level list (items and their `children`). |
| `_data/contact.yml` | Email, social links, headshot, and resume link. |
| `_config.yml` | Site metadata, permalinks, kramdown settings, plugins. |

## Common edits

- **Add a project:** copy `projects/ee1100-polyphonic-keyboard/` to a new folder, edit its `index.md`, and add a link under *Projects* in `_data/navigation.yml` if you want it in the menu.
- **Add a page banner:** in any page's front matter,
  ```yaml
  banner:
    image: /projects/my-project/banner.jpg
    alt: What the image shows
  ```
- **Add an astrophoto:** put the JPEG in `assets/astrophotography/` and add an entry under `photos:` in `_data/astrophotography.yml`.
- **Add a piano recording:** add an entry under `recordings:` in `_data/piano.yml` with either a YouTube video ID or an audio file in `assets/piano/`.
- **Add your headshot:** put it in `assets/images/` and set `photo:` in `_data/contact.yml`.
