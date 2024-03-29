##
## Author: Chris Bielow
##

test_that("getCVDictionary = function()", {
  cv = getCVDictionary()
  expect_true(all(c("CV", "URI", "version") %in% names(cv)))
  expect_true(all(c("id", "name", "def") %in% names(cv$CV)))
  expect_true("MS:1001000" %in% cv$CV$id)
  expect_true("gene name" %in% cv$CV$name)

})

test_that("getLatest_PSICV_URL = function()", {
  ## this test requires internet connection - in particular to Github (checking other sites may not help), so run it only if available:
  con = try(url("https://api.github.com", open="r"))
  if (!inherits(con, "try-error")) {
    close(con)
    expect_true(endsWith(getLatest_PSICV_URL(), "psi-ms.obo"))
  }
})

test_that("getLocal_CV_Version = function()", {
  expect_true(getLocal_CV_Version(system.file("./cv/psi-ms.obo", package="rmzqc")) == "4.1.129")
})

test_that("getCVInfo = function()", {
  expect_true(startsWith(getCVInfo()$name, "Proteomics Standards Initi"))
})

test_that("getCVSingleton()", {
  d1 = getCVSingleton()
  d2 = getCVSingleton()
  expect_true(identical(d1$getData(), d2$getData()))
  entry = d1$byID("MS:1000563")
  expect_true(entry$parents == "MS:1000560")
  suppressWarnings(expect_null(d1$byID("does_not_exit")))
})

