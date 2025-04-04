% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mzQC.R
\docType{class}
\name{MzQCcontrolledVocabulary-class}
\alias{MzQCcontrolledVocabulary-class}
\alias{MzQCcontrolledVocabulary}
\title{A controlled vocabulary document, usually pointing to an .obo file}
\description{
A controlled vocabulary document, usually pointing to an .obo file
}
\section{Fields}{

\describe{
\item{\code{name}}{Full name of the controlled vocabulary.}

\item{\code{uri}}{Publicly accessible URI of the controlled vocabulary.}

\item{\code{version}}{(optional) Version of the controlled vocabulary.}
}}


\examples{
  MzQCcontrolledVocabulary$new(
    "Proteomics Standards Initiative Quality Control Ontology",
    "https://github.com/HUPO-PSI/psi-ms-CV/releases/download/v4.1.129/psi-ms.obo",
    "4.1.129")

}
