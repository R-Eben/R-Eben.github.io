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

