% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FateID_functions.R
\name{compdr}
\alias{compdr}
\title{Computation of dimensional reduction representations}
\usage{
compdr(x, z = NULL, m = c("tsne", "cmd", "dm", "lle"), k = c(2, 3),
  lle.n = 30, dm.sigma = 1000, dm.distance = "euclidean",
  tsne.perplexity = 30, seed = 12345)
}
\arguments{
\item{x}{expression data frame with genes as rows and cells as columns. Gene IDs should be given as row names and cell IDs should be given as column names. This can be a reduced expression table only including the features (genes) to be used in the analysis.}

\item{z}{Matrix containing cell-to-cell distances to be used in the fate bias computation. Default is \code{NULL}. In this case, a correlation-based distance is computed from \code{x} by \code{1 - cor(x)}}

\item{m}{a vector of dimensional reduction representations to be computed. By default, the following representations are computed: \code{lle} (locally-linear embedding), \code{cmd} (classical multidimensional scaling), \code{dm} (diffusion map), \code{tsne} (t-SNE map). The default value of m is \code{c("lle","cmd","dm","tsne")}. Any subset of these methods can be selected.}

\item{k}{vector of integers representing the dimensions for which the dimensional reduction representations will be computed. Default value is \code{c(2,3)}.}

\item{lle.n}{integer number for the number of neighbours used in the \code{lle} algorithm. Default value is 30.}

\item{dm.sigma}{parameter for the computation of the diffusion maps with the destiny package. See \url{https://bioconductor.org/packages/devel/bioc/html/destiny.html}. Default value is 1000.}

\item{dm.distance}{parameter for the computation of the diffusion maps with the destiny package. See \url{https://bioconductor.org/packages/devel/bioc/html/destiny.html}. Default value is \code{euclidean}.}

\item{tsne.perplexity}{positive number. Perplexity used in the t-SNE computation. Default value is 30.}

\item{seed}{integer seed for initialization. If equal to \code{NULL} then each run will yield slightly different results due to the randomness of the random forest algorithm. Default is \code{NULL}}
}
\value{
A two-dimensional list with the dimensional reduction representation stored as data frames as components. Component names for the first dimension are given by one of the following algorithms:
  \item{lle}{locally linear embedding calculated by the lle function from the \pkg{lle} package.}
  \item{cmd}{classical multidimensional scaling computed by the \code{cmdscale} function of the \pkg{stats} package.}
  \item{dm}{diffusion map computed by the \code{DiffusionMap} function of the \pkg{destiny} package.}
  \item{tsne}{t-SNE map computed by the \code{Rtsne} function of the \pkg{Rtsne} package.}

Component names of the second dimension are a concatenation of a capital D and an integer number of the dimension. There is one component for each dimension in \code{k}.
}
\description{
This function computes dimensional reduction representations to a specified number of dimensions using a number of different algorithms: t-SNE, cmd, lle, diffusion maps
}
\examples{

x <- intestine$x
dr <- compdr(x,z=NULL,m="cmd",k=2,lle.n=30,dm.sigma=1000,dm.distance="euclidean",tsne.perplexity=30)
plot(dr[["cmd"]][["D2"]],pch=20,col="grey")

}
