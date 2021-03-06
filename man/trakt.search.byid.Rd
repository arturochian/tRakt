% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/trakt.search.byid.R
\name{trakt.search.byid}
\alias{trakt.search.byid}
\title{Lookup a show via id}
\usage{
trakt.search.byid(id, id_type = "trakt-show")
}
\arguments{
\item{id}{The id used for the search. Will be \code{URLencode}'d.}

\item{id_type}{The type of \code{id}. Defaults to \code{trakt-show}, can be
\code{trakt-movie}, \code{trakt-show}, \code{trakt-episode}, \code{imdb},
\code{tmdb}, \code{tvdb}, \code{tvrage}}
}
\value{
A \code{data.frame} containing a single search result. Hopefully the one you wanted.
If no result is found, the return value is \code{list(error = "Nothing found")} and a \code{warning}
}
\description{
\code{trakt.search.byid} pulls show stats and returns it compactly.
}
\note{
See \href{http://docs.trakt.apiary.io/reference/search/id-lookup/get-id-lookup-results}{the trakt API docs for further info}
}
\examples{
\dontrun{
get_trakt_credentials() # Set required API data/headers
breakingbad <- trakt.search.byid(1388, "trakt-show")
}
}
\seealso{
Other API, search: \code{\link{trakt.search}}
}

