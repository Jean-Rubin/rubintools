% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/label.R
\name{recode_from_dict}
\alias{recode_from_dict}
\title{Change vector values using a data dictionary}
\usage{
recode_from_dict(dataframe, dict)
}
\arguments{
\item{dataframe}{Data frame.}

\item{dict}{Data dictionary in the form of a list of named vectors. Each item
of the list corresponds to the dictionary of a variable. Names of the list
should match the name of the variables in the data frame.}
}
\value{
A data frame where the values of variables inside the data dictionary
are modified accordingly.
}
\description{
Change vector values using a data dictionary
}
\examples{
dict <- list(
  x = c("a" = "A", "b" = "B", "c" = "C"),
  y = c("d" = "D", "e" = "E", "f" = "F")
)
df_ex <- data.frame(
  x = c("a", "b"),
  y = c("d", "e")
)

recode_from_dict(df_ex, dict)
}
