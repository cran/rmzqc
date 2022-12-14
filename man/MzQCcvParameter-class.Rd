% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mzQC.R
\docType{class}
\name{MzQCcvParameter-class}
\alias{MzQCcvParameter-class}
\alias{MzQCcvParameter}
\title{A controlled vocabulary parameter, as detailed in the OBO file}
\description{
A controlled vocabulary parameter, as detailed in the OBO file
}
\section{Fields}{

\describe{
\item{\code{accession}}{Accession number identifying the term within its controlled vocabulary.}

\item{\code{name}}{Name of the controlled vocabulary term describing the parameter.}

\item{\code{value}}{(optional) Value of the parameter.}

\item{\code{description}}{(optional) Definition of the controlled vocabulary term.}
}}


\examples{
  MzQCcvParameter$new("MS:4000070",
                      "retention time acquisition range",
                      c(0.2959, 5969.8172))
  isValidMzQC(MzQCcvParameter$new("MS:0000000"))

}
