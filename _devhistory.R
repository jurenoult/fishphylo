usethis::use_build_ignore("_devhistory.R")
usethis::use_git(message = ":tada: Initial commit")
usethis::use_git_ignore(".DS_Store")
usethis::use_build_ignore(".DS_Store")
usethis::use_git(message = ":see_no_evil: Ban .DS_Store files")
usethis::edit_file("DESCRIPTION")
usethis::use_git(message = ":bulb: Edit package metadata")
usethis::use_package_doc()
devtools::document()
usethis::use_mit_license(name = "Nicolas Casajus")
usethis::use_r("cb_taxa_gene") #generate the file of the corresponding
devtools::load_all()
usethis::use_git(message = ":boom: New fonctio - cb_taxa_gene")
devtools::document() #generate the corresponding .Rd file (special file for R documentation) from this Roxygen2 header
devtools::check() #check the integrity of the package
devtools::install() #install our package
usethis::use_testthat() # explicit test of the code
usethis::use_test("cb_taxa_gene")
usethis::use_git(message = ":boom: test pf cb_taxa_gene ok")
usethis::use_readme_rmd()
rmarkdown::render("README.Rmd")
usethis::use_build_ignore("README.html")
usethis::use_git_ignore("README.html")
usethis::use_git(message = ":pencil: Edit README")
