# From analysis to published report

A Slidev workshop deck introducing Quarto to R/Bioconductor users.

## View the slides

```bash
npm install
npm run dev
```

Then open the local URL printed by Slidev. Press `p` for presenter mode.
Speaker notes are included in `slides.md` as HTML comments.

## Build / export

```bash
npm run build
npm run export
```

`npm run export` writes a PDF using Playwright. If the browser is not installed:

```bash
npx playwright install chromium
```

## Docker

A prebuilt image with R, Bioconductor, Quarto and the demo's `renv`
environment is published to GitHub Container Registry:

```bash
docker pull ghcr.io/artur-sannikov/2026-11-25-bioconductor-africa-quarto-presentation:latest
```

Start an RStudio server instance:

```bash
docker run -it --rm -p 8787:8787 \
  -e PASSWORD=bioc ghcr.io/artur-sannikov/2026-11-25-bioconductor-africa-quarto-presentation:latest
```

Go to `localhost:8787` in your browser and login with
`rstudio` or `root` (if using rootless Docker) and `bioc`
password.

In the R console:

```
setwd("/workspace/demo")
renv::restore()
# Select 1: Activate the project and use the project library.
```

You can open `airway-report.qmd` file and experiment with it.

## Files

| Path                     | Purpose                                    |
| ------------------------ | ------------------------------------------ |
| `slides.md`              | Slide deck                                 |
| `style.css`              | Custom visual design                       |
| `layouts/chapter.vue`    | Full-bleed section-divider layout          |
| `demo/README.md`         | Demo setup and render instructions         |
| `demo/airway-report.qmd` | Report built during the live demo          |
| `demo/references.bib`    | Citation for the Himes et al. airway study |
| `demo/.Rprofile`         | Activates the demo's `renv` environment    |
| `demo/renv.lock`         | Pinned R package versions for the demo     |
