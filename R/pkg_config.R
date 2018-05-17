#' Configure a newly created package
#'
#' @export
#'
#' @author Marc Choisy
#'
pkg_config <- function() {
  file.remove("R/hello.R")
  file.remove("man/hello.Rd")
  file.remove(NAMESPACE)

  package_name <- sub(".Rproj" , "", grep("Rproj", dir(), value = TRUE))

  description <- c(
    paste("Package:", package_name),
    "Type: Package",
    "***Title: What the Package Does (Title Case)",
    "Version: 0.1.0",
    "Authors@R: person(\"Marc\", \"Choisy\",",
    "                  email = \"marc.choisy@ird.fr\",",
    "                  role = c(\"aut\", \"cre\", \"cph\"),",
    "                  comment = c(ORCID = \"0000-0002-5187-6390\"))",
    "***Description: More about what it does (maybe more than one line)",
    "***    Use four spaces when indenting paragraphs within the Description.",
    "License: MIT + file LICENSE",
    "Encoding: UTF-8",
    "LazyData: true")
  fileConn <- file("DESCRIPTION")
  writeLines(description, fileConn)
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
}
