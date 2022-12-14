% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/templates.R
\name{getCVTemplate}
\alias{getCVTemplate}
\title{Fills a MzQCcvParameter object with id(accession) and name.
The value (if any) needs to be set afterwards.}
\usage{
getCVTemplate(accession, mzcv_dict = CV_$new()$data)
}
\arguments{
\item{accession}{The ID (=accession) of the term in the CV}

\item{mzcv_dict}{A CV dictionary, as obtained by getCVDictionary(); defaults to a singleton, which needs to be filled manually beforehand}
}
\value{
An instance of MzQCcvParameter
}
\description{
Fills a MzQCcvParameter object with id(accession) and name.
The value (if any) needs to be set afterwards.
}
