## ----eval=TRUE----------------------------------------------------------------
library(rmzqc)

print(getCVInfo())
## test if the default CV is usable
toQCMetric(id = "MS:4000059", value = 13405) ## number of MS1 scans


## ----eval=TRUE----------------------------------------------------------------
## With internet:
myCV = getCVSingleton()
myCV$setData(getCVDictionary("latest")) ## this is done internally by default when you load the package
cat("Number of entries in latest CV: ", nrow(getCVSingleton()$getCV()), "\n")
print(getCVInfo())

## simulate missing internet connection by invoking the function manually
myCV$setData(getCVDictionary("local"))
cat("Number of entries in local CV: ", nrow(getCVSingleton()$getCV()), "\n")
print(getCVInfo())

## ----eval=TRUE----------------------------------------------------------------
myOBO = system.file("./cv/psi-ms.obo", package="rmzqc") ## we will use a local file, but you can point to anything you have (even URI's)
myCV$setData(getCVDictionary("custom", myOBO))
cat("Number of entries in custom CV: ", nrow(getCVSingleton()$getCV()), "\n")
print(getCVInfo())

## you may want to change the CV-entries, or URI or version manually, before creating an mzQC file:
newCV = list(CV = myCV$getData()$CV, 
             URI = "https://myURI.com",
             version = "9.9.2")
myCV$setData(newCV)
print(getCVInfo())




