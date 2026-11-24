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
