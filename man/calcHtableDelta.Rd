\name{calcHtableDelta}
\alias{calcHtableDelta}
\title{Calculate data.frame differences}
\usage{
calcHtableDelta(old, new, zeroIndex = TRUE)
}
\arguments{
  \item{old}{The old data.frame}

  \item{new}{The new data.frame}
}
\value{
A matrix in which each row represents a change from the old
to the new matrix in the form of [row, col, newVal,
oldVal].
}
\description{
Calculate the differences in the data.frames provided
}
\author{
Jeff Allen \email{jeff@trestletech.com}
}

