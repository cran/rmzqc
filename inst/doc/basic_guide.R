## ---- eval=FALSE--------------------------------------------------------------
#  library(rmzqc)
#  raw_file = "c:\\data\\special.raw"
#  file_format = getCVTemplate(accession = filenameToCV(raw_file))
#  ptxqc_software = toAnalysisSoftware(id = "MS:1003162", version = "1.0.13")
#  run1_qc = MzQCrunQuality$new(metadata = MzQCmetadata$new(label = raw_file,
#                                                          inputFiles =
#                                                            list(MzQCinputFile$new(basename(raw_file),
#                                                                                   raw_file,
#                                                                                   file_format)),
#                                                       analysisSoftware = list(ptxqc_software)),
#                           qualityMetrics = list(toQCMetric(id = "MS:4000059", value = 13405) ## number of MS1 scans
#                                                 )
#                           )
#  
#  mzQC_document = MzQCmzQC$new(version = "1.0.0",
#                               creationDate = MzQCDateTime$new(),
#                               contactName = Sys.info()["user"],
#                               contactAddress = "test@user.info",
#                               description = "A minimal mzQC test document with bogus data",
#                               runQualities = list(run1_qc),
#                               setQualities = list(),
#                               controlledVocabularies = list(getDefaultCV()))
#  
#  ## write it out
#  mzqc_filename = paste0(getwd(), "/test.mzQC")
#  writeMZQC(mzqc_filename, mzQC_document)
#  cat(mzqc_filename, "written to disk!")

