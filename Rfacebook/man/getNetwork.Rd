\name{getNetwork}
\alias{getNetwork}
\title{Extract network of friends of authenticated user}
\usage{
getNetwork(token, format = "edgelist", verbose = TRUE)
}
\arguments{
  \item{token}{Either a temporary access token created at
  \url{https://developers.facebook.com/tools/explorer} or
  the OAuth token created with \code{fbOAuth}.}

  \item{format}{Either "edgelist" for a list of edges in
  the network or "adj.matrix" for an adjacenty matrix of
  dimensions (n x n), with n being the number of friends,
  and 0 or 1 indicating whether friend i is also friends
  with friend j.}

  \item{verbose}{logical, default is \code{TRUE}, which
  will print additional information on the console.}
}
\description{
\code{getNetwork} retrieves list of mutual friendships and
returns the adjacency matrix or edge list for the network
representing the neighborhood of the authenticated user.
}
\details{
This function requires the use of an OAuth token with
extended permissions.
}
\examples{
\dontrun{
## See examples for fbOAuth to know how token was created.
## Getting my network of friends
 load("fb_oauth")
 mat <- getNetwork(token=fb_oauth, format="adj.matrix")
 library(igraph)
 network <- graph.adjacency(mat, mode="undirected")
 pdf("network_plot.pdf")
 plot(network)
 dev.off()
}
}
\author{
Pablo Barbera \email{pablo.barbera@nyu.edu}
}
\seealso{
\code{\link{getFriends}}, \code{\link{fbOAuth}}
}

