% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GAPIT.SUPER.GS.R
\name{GAPIT.SUPER.GS}
\alias{GAPIT.SUPER.GS}
\title{GAPIT.SUPER.GS}
\usage{
GAPIT.SUPER.GS(
  Y,
  GD = NULL,
  GM = NULL,
  KI = NULL,
  Z = NULL,
  CV = NULL,
  GK = NULL,
  kinship.algorithm = NULL,
  bin.from = 10000,
  bin.to = 10000,
  bin.by = 1000,
  inclosure.from = 10,
  inclosure.to = 10,
  inclosure.by = 10,
  group.from = 1e+06,
  group.to = 1e+06,
  group.by = 10,
  kinship.cluster = "average",
  kinship.group = "Mean",
  PCA.total = 0,
  GT = NULL,
  PC = NULL,
  GI = NULL,
  Timmer = NULL,
  Memory = NULL,
  model = "",
  sangwich.top = NULL,
  sangwich.bottom = NULL,
  QC = TRUE,
  GTindex = NULL,
  LD = 0.05,
  file.output = TRUE,
  cutOff = 0.01
)
}
\arguments{
\item{Y}{Phenotype data.frame,}

\item{GD}{= NULL,}

\item{GM}{= NULL,}

\item{KI}{= NULL,}

\item{Z}{= NULL,}

\item{CV}{= NULL,}

\item{GK}{= NULL,}

\item{kinship.algorithm}{= NULL,}

\item{bin.from}{= 10000,}

\item{bin.to}{= 10000,}

\item{bin.by}{= 1000,}

\item{inclosure.from}{= 10,}

\item{inclosure.to}{= 10,}

\item{inclosure.by}{= 10,}

\item{group.from}{= 1000000,}

\item{group.to}{= 1000000,}

\item{group.by}{= 10,}

\item{kinship.cluster}{= "average",}

\item{kinship.group}{= 'Mean',}

\item{PCA.total}{= 0,}

\item{GT}{= NULL,}

\item{PC}{= NULL,}

\item{GI}{= NULL,}

\item{Timmer}{=  NULL,}

\item{Memory}{=  NULL,}

\item{model}{= "",}

\item{sangwich.top}{= NULL,}

\item{sangwich.bottom}{= NULL,}

\item{QC}{= TRUE,}

\item{GTindex}{= NULL,}

\item{LD}{= 0.05,}

\item{file.output}{= TRUE,}

\item{cutOff}{= 0.01}
}
\description{
Perform GPS with SUPER and Compress method.
}
\author{
Zhiwu Zhang and Jiabo Wang
}
