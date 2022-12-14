% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mzQC.R
\name{isValidMzQC}
\alias{isValidMzQC}
\title{Checks validity (= completeness) of mzQC objects - or lists (JSON arrays) thereof}
\usage{
isValidMzQC(x, ...)
}
\arguments{
\item{x}{An mzQC refclass (or list of them), each will be subjected to \code{isValidMzQC()}}

\item{...}{Ellipsis, for recursive argument splitting}
}
\description{
Note: Returns TRUE for empty lists!
}
\details{
You can pass multiple arguments, which are all checked individually.
All of them need to be valid, for TRUE to be returned.
The reason for combining both list support for arguments and ellipsis (...) into this function is that
JSON arrays are represented as lists and you can simply pass them as a single argument
(without the need for do.call()) and get the indices of invalid objects (if any).
The ellipsis is useful to avoid clutter,
i.e.
if (!isValidMzQC(a) || !isValidMzQC(b)) doStuff()
is harder to read than
if (!isValidMzQC(a,b)) doStuff()
}
\examples{
  isValidMzQC(MzQCcvParameter$new("MS:4000059"))       # FALSE
  isValidMzQC(MzQCcvParameter$new("MS:4000059", "Number of MS1 spectra")) # TRUE
  isValidMzQC(list(MzQCcvParameter$new("MS:4000059"))) # FALSE
  isValidMzQC(list(MzQCcvParameter$new("MS:4000059", "Number of MS1 spectra"))) # TRUE
  isValidMzQC(list(MzQCcvParameter$new("MS:4000059", "Number of MS1 spectra")),
              MzQCcvParameter$new()) # FALSE

}
