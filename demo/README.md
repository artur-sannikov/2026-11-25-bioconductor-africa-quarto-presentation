# Airway demo

This is the small report built during the live demo. It uses the Bioconductor
`airway` dataset, `SummarizedExperiment`, `ggplot2`, `knitr`, and `kableExtra`.

## Render

From this directory:

```bash
quarto render airway-report.qmd
```

Open `airway-report.html` in a browser.

## Setup

```r
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(c(
  "airway", "SummarizedExperiment", "ggplot2", "knitr", "kableExtra"
))
```
