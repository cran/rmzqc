## ----eval=FALSE---------------------------------------------------------------
#  library(rmzqc)
#  mzQC_filename = system.file("testdata/test.mzQC", package="rmzqc")
#  #mzQC_filename = "C:\\dev\\rmzqc\\inst\\testdata\\test.mzQC"
#  res = validateFromFile(mzQC_filename)
#  res
#  

## ----eval=FALSE---------------------------------------------------------------
#  library(rmzqc)
#  mzQC_strings = readLines(system.file("testdata/test.mzQC", package="rmzqc"))
#  res = validateFromString(mzQC_strings)
#  res
#  

## ----eval=FALSE---------------------------------------------------------------
#  library(rmzqc)
#  mzQC_root = rmzqc::readMZQC(system.file("testdata/test.mzQC", package="rmzqc"))
#  res = validateFromObj(mzQC_root)
#  res
#  

