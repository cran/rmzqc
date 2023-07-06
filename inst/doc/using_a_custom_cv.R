## ---- eval=TRUE---------------------------------------------------------------
library(rmzqc)

print(getCVInfo())
## test if the default CV is usable
toQCMetric(id = "MS:4000059", value = 13405) ## number of MS1 scans


## ---- eval=TRUE---------------------------------------------------------------
## With internet:
CV = getCVSingleton()
CV$setData(getCVDictionary("latest")) ## this is done internally by default when you load the package
cat("Number of entries in latest CV: ", nrow(getCVSingleton()$getCV()), "\n")
print(getCVInfo())

## simulate missing internet connection by invoking the function manually
CV$setData(getCVDictionary("local"))
cat("Number of entries in local CV: ", nrow(getCVSingleton()$getCV()), "\n")
print(getCVInfo())

## ---- eval=TRUE---------------------------------------------------------------
myOBO = system.file("./cv/psi-ms.obo", package="rmzqc") ## we will use a local file, but you can point to anything you have (even URI's)
CV$setData(getCVDictionary("custom", myOBO))
cat("Number of entries in custom CV: ", nrow(getCVSingleton()$getCV()), "\n")
print(getCVInfo())

## you may want to change the URI (and version?) manually, before creating an mzQC file:
CV$data$URI = "https://myURI.com"
CV$data$version = "9.9.2"
print(getCVInfo())




