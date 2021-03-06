% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/trakt.user.following.R
\name{trakt.user.following}
\alias{trakt.user.following}
\title{Get a user's followings}
\usage{
trakt.user.following(user = getOption("trakt.username"))
}
\arguments{
\item{user}{Target user. Defaults to \code{getOption("trakt.username")}}
}
\value{
A \code{data.frame} containing user information.
}
\description{
\code{trakt.user.following} pulls a user's followings.
Since no OAuth2 methods are supported yet, the specified user mustn't be private.
}
\note{
See \href{http://docs.trakt.apiary.io/reference/users/following/get-following}{the trakt API docs for further info}
}
\examples{
\dontrun{
get_trakt_credentials() # Set required API data/headers
trakt.user.following("jemus42")
}
}
\seealso{
Other user: \code{\link{trakt.user.collection}};
  \code{\link{trakt.user.followers}};
  \code{\link{trakt.user.friends}};
  \code{\link{trakt.user.ratings}};
  \code{\link{trakt.user.stats}};
  \code{\link{trakt.user.watched}};
  \code{\link{trakt.user.watchlist}}
}

