% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/memory.R
\name{memory_ls}
\alias{memory_ls}
\title{Display the sorted sizes of objects in current environment}
\usage{
memory_ls(env = parent.frame(n = 1L), units = "auto")
}
\arguments{
\item{env}{Environment to inspect.}

\item{units}{Units to be used in formatting and printing the size.
Allowed values are \code{"b"}, \code{"Kb"}, \code{"Mb"}, \code{"Gb"}, \code{"Tb"}, \code{"Pb"},
\code{"B"}, \code{"KB"}, \code{"MB"}, \code{"GB"}, \code{"TB"}, \code{"PB"},
\code{"KiB"}, \code{"MiB"}, \code{"GiB"}, \code{"TiB"}, \code{"PiB"}, \code{"Eib"}, \code{"Zib"}, \code{"Yib"}.
It is also possible to select \code{units = "auto"}.}
}
\description{
Display the sorted sizes of objects in current environment
}
