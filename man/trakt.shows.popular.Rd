% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/trakt.shows.popular.R
\name{trakt.shows.popular}
\alias{trakt.shows.popular}
\title{Get popular shows}
\usage{
trakt.shows.popular(limit = 10, page = 1, extended = "min")
}
\arguments{
\item{limit}{Number of shows to return. Is coerced to \code{integer} and must be greater than 0.}

\item{page}{Page to return (default is \code{1})
for \href{http://docs.trakt.apiary.io/#introduction/pagination}{pagination}.}

\item{extended}{Whether extended info should be provided.
Defaults to \code{"min"}, can either be \code{"min"} or \code{"full"}.}
}
\value{
A \code{data.frame} containing popular shows with their name and ids
}
\description{
\code{trakt.shows.popular} returns a list of the most popular shows on trakt.tv.
According to the API docs, opularity is calculated based both ratings and number of ratings.
}
\note{
See \href{http://docs.trakt.apiary.io/#reference/shows/get-popular-shows}{the trakt API docs for further info}
}
\examples{
\dontrun{
get_trakt_credentials() # Set required API data/headers
trakt.shows.popular(5)
}
}
\seealso{
Other aggregate: \code{\link{trakt.movies.popular}};
  \code{\link{trakt.movies.related}};
  \code{\link{trakt.movies.trending}};
  \code{\link{trakt.shows.related}};
  \code{\link{trakt.shows.trending}}

Other show: \code{\link{trakt.getEpisodeData}};
  \code{\link{trakt.getFullShowData}};
  \code{\link{trakt.seasons.season}};
  \code{\link{trakt.seasons.summary}};
  \code{\link{trakt.show.people}};
  \code{\link{trakt.show.ratings}};
  \code{\link{trakt.show.stats}};
  \code{\link{trakt.show.summary}};
  \code{\link{trakt.shows.related}};
  \code{\link{trakt.shows.trending}}
}

