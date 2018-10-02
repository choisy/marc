#' Configure a newly created package
#'
#' @export
#'
#' @author Marc Choisy
#'
pkg_config <- function() {
  file.remove("R/hello.R")
  file.remove("man/hello.Rd")
  file.remove("NAMESPACE")

  devtools::use_readme_rmd() # for creating the .Rbuildignore file
  write("^ignored/.*$", ".Rbuildignore", append = TRUE)

  package_name <- sub(".Rproj" , "", grep("Rproj", dir(), value = TRUE))

  description <- c(
    paste("Package:", package_name),
    "Type: Package",
    "Title: What the Package Does (Title Case) **************************************",
    "Version: 0.1.0",
    "Authors@R: person(\"Marc\", \"Choisy\",",
    "                  email = \"marc.choisy@ird.fr\",",
    "                  role = c(\"aut\", \"cre\", \"cph\"),",
    "                  comment = c(ORCID = \"0000-0002-5187-6390\"))",
    "Description: More about what it does (maybe more than one line) ****************",
    "    Use four spaces when indenting paragraphs within the Description. **********",
    "License: MIT + file LICENSE",
    paste0("URL: https://github.com/choisy/", package_name),
    paste0("BugReports: https://github.com/choisy/", package_name, "/issues"),
    "Encoding: UTF-8",
    "LazyData: true")
  fileConn <- file("DESCRIPTION")
  writeLines(description, fileConn)
  close(fileConn)

  readme <- c(
    "---",
    "output: github_document",
    "---",
    "",
    "<!-- README.md is generated from README.Rmd. Please edit that file -->",
    "",
    "```{r, echo = FALSE}",
    "knitr::opts_chunk$set(",
    "  collapse = TRUE,",
    "  comment = \"#>\",",
    "  fig.path = \"README-\"",
    ")",
    "```",
    "",
    "# dplyrx <img src=\"man/figures/logo.png\" align=\"right\" width=120/>",
    "",
    paste0("[![Travis-CI Build Status](https://travis-ci.org/choisy/", package_name, ".svg?branch=master)](https://travis-ci.org/choisy/", package_name, ")"),
    paste0("[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/", package_name, ")](https://cran.r-project.org/package=", package_name, ")"),
    "",
    paste0("`", package_name, "` is *************************************************"),
    "",
    "## Installation",
    "",
    paste0("You can install `", package_name,  "` from GitHub with:"),
    "",
    "```{r gh-installation, eval = FALSE}",
    "# install.packages(\"devtools\")",
    paste0("devtools::install_github(\"choisy/", package_name, "\")"),
    "```",
    "",
    "## Example",
    "",
    "*** Here explain a simple example **********************************************",
    "",
    "```{r}",
    "# *** Here give the code of the simple example *********************************",
    "```"
  )
  fileConn <- file("README.Rmd")
  writeLines(readme, fileConn)
  close(fileConn)

  proj <- c("Version: 1.0",
            "",
            "RestoreWorkspace: Default",
            "SaveWorkspace: Default",
            "AlwaysSaveHistory: Default",
            "",
            "EnableCodeIndexing: Yes",
            "UseSpacesForTab: Yes",
            "NumSpacesForTab: 2",
            "Encoding: UTF-8",
            "",
            "RnwWeave: Sweave",
            "LaTeX: pdfLaTeX",
            "",
            "AutoAppendNewline: Yes",
            "StripTrailingWhitespace: Yes",
            "",
            "BuildType: Package",
            "PackageUseDevtools: Yes",
            "PackageInstallArgs: --no-multiarch --with-keep.source",
            "PackageRoxygenize: rd,collate,namespace")
  fileConn <- file(paste0(package_name, ".Rproj"))
  writeLines(proj, fileConn)
  close(fileConn)

  rprojuser <- c(
    "auto_roxygenize_for_build_and_reload=\"1\"",
    "auto_roxygenize_for_build_package=\"1\"",
    "auto_roxygenize_for_check=\"1\"",
    "live_preview_website=\"1\"",
    "makefile_args=\"\"",
    "preview_website=\"1\"",
    "website_output_format=\"all\"")
  fileConn <- file(".Rproj.user/7FC44698/build_options")
  writeLines(rprojuser, fileConn)
  close(fileConn)

  devtools::use_mit_license()

  dir.create("ignored")
  file.copy(system.file("extdata", "add_favicon.sh", package = "marc"),
            "ignored/add_favicon.sh")
  file.copy(system.file("extdata", "favicon.R", package = "marc"),
            "ignored/favicon.R")
  download.file("https://www.dropbox.com/s/p8rtk67vtk4cwly/logo.key?raw=1",
                "ignored/logo.key")
}
