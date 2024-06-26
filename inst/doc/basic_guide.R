## ----eval=TRUE----------------------------------------------------------------
library(rmzqc)
data = readMZQC(system.file("./testdata/test.mzQC", package = "rmzqc", mustWork = TRUE))
cat("This file has ", length(data$runQualities), " runqualities\n")
cat("  - file: ", data$runQualities[[1]]$metadata$inputFiles[[1]]$name, "\n")
cat("  - # of metrics: ", length(data$runQualities[[1]]$qualityMetrics), "\n")
cat("    - metric #1 name: ", data$runQualities[[1]]$qualityMetrics[[1]]$name, "\n")
cat("    - metric #1 value: ", data$runQualities[[1]]$qualityMetrics[[1]]$value, "\n")


## ----eval=TRUE----------------------------------------------------------------
library(rmzqc)
## we need a proper URI (i.e. no backslashes and a scheme, e.g. 'file:')
## otherwise writing will fail
raw_file = localFileToURI("c:\\data\\special.raw", FALSE)

file_format = getCVTemplate(accession = filenameToCV(raw_file))
ptxqc_software = toAnalysisSoftware(id = "MS:1003162", version = "1.0.13") ## you could use 'version = packageVersion("PTXQC")' to automate further
run1_qc = MzQCrunQuality$new(metadata = MzQCmetadata$new(label = raw_file,
                         inputFiles = list(MzQCinputFile$new(basename(raw_file),
                                                             raw_file,
                                                            file_format)),
                         analysisSoftware = list(ptxqc_software)),
                         qualityMetrics = list(toQCMetric(id = "MS:4000059", value = 13405) ## number of MS1 scans
                                               )
                         )

mzQC_document = MzQCmzQC$new(version = "1.0.0", 
                             creationDate = MzQCDateTime$new(), 
                             contactName = Sys.info()["user"], 
                             contactAddress = "test@user.info", 
                             description = "A minimal mzQC test document with bogus data",
                             runQualities = list(run1_qc),
                             setQualities = list(), 
                             controlledVocabularies = list(getCVInfo()))

## write it out
mzqc_filename = paste0(getwd(), "/test.mzQC")
writeMZQC(mzqc_filename, mzQC_document)
cat(mzqc_filename, "written to disk!\n")

## read it again
mq = readMZQC(mzqc_filename)

## print some basic stats
gettextf("This mzQC was created on %s and has %d quality metric(s) in total.", dQuote(mq$creationDate$datetime), length(mq$runQualities) + length(mq$setQualities))


