### Genome Cluster Report

These scripts generate a genome clustering report using R Markdown

### Rendering the Report

The genus and species of your isolates, the number of isolates in your analysis, a tab-delimited SNP matrix and a newick tree file are the required inputs for rendering the report. The report can be rendered using the generateReport.sh wrapper script or manually rendered in Rstudio.

Usage:

```
generateReport.sh <options>

Options:
      Required
      -s      Genus and Species eg. "Escherichia coli"
      -n      Number of isolates
      -m      SNP matrix file name
      -tr     Newick tree file name
      Optional
      -o      Output path: defaults to /data/

```

### Dependencies

A Docker container of the scripts' dependencies can be built using the Dockerfile included in this repository, or pulled from ashockey/cluster-report. This report has many dependencies, so we highly recommend using the Docker container. 

If you choose to manually render the report in Rstudio, you will need to install the following R libraries from the [CRAN repository](https://cran.r-project.org/):

* httr
* usethis
* covr
* xml2
* roxygen2
* rversions
* knitr
* rmarkdown
* tidyverse
* tinytex
* magick
* devtools
* tidytree
* BiocManager
* ggtree
* ggimage
* phytools

Many of these libraries have overlapping dependencies that will be installed by default in Rstudio. 

Note: Rendering the report requires a forked repository of ggtree, so you will need to install ggtree using devtools with the following command:

```
devtools::install_github('AbigailShockey/ggtree')
```

tinytex must be installed using the following command:

```
tinytex::install_tinytex()
```

Because the report relies on latex, you will also need to install [TeX Live](https://www.tug.org/texlive/).

The report's default font is Roboto, which can be downloaded [here](https://www.fontsquirrel.com/fonts/roboto), but this can easily be changed to a font already installed on your OS.