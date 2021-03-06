#' Get a single person's details
#'
#' \code{trakt.people.summary} pulls show people data.
#'
#' Get a single person's details, like their various ids. If \code{extended} is \code{"full"},
#' there will also be biographical data if available.
#' @param target The \code{id} of the person requested. Either the \code{slug}
#' (e.g. \code{"bryan-cranston"}), \code{trakt id} or \code{IMDb id}
#' @param extended Whether extended info should be provided.
#' Defaults to \code{"min"}, can either be \code{"min"} or \code{"full"}
#' @return A \code{data.frame}s with person details.
#' @export
#' @note See \href{http://docs.trakt.apiary.io/reference/people/summary/get-a-single-person}{the trakt API docs for further info}
#' @family people
#' @examples
#' \dontrun{
#' get_trakt_credentials() # Set required API data/headers
#' person <- trakt.people.summary("bryan-cranston")
#' }
trakt.people.summary <- function(target, extended = "min"){

  # Construct URL, make API call
  baseURL  <- "https://api-v2launch.trakt.tv/people/"
  url      <- paste0(baseURL, target, "?extended=", extended)
  response <- trakt.api.call(url = url)

  # Flatten the data.frame
  ids  <- as.data.frame(response$ids)
  data <- response[names(response) != "ids"]
  # Fix NULLs (screw up data.frame conversion)
  data[unlist(lapply(data, is.null))] <- NA
  data <- as.data.frame(data)
  data <- cbind(data, ids)

  return(data)
}

#' Get a single person's movie credits
#'
#' \code{trakt.people.movies} pulls show people data.
#'
#' Returns all movies where this person is in the cast or crew.
#' @param target The \code{id} of the person requested. Either the \code{slug}
#' (e.g. \code{"bryan-cranston"}), \code{trakt id} or \code{IMDb id}
#' @param extended Whether extended info should be provided.
#' Defaults to \code{"min"}, can either be \code{"min"} or \code{"full"}
#' @return A \code{data.frame}s with person details.
#' @export
#' @note See \href{http://docs.trakt.apiary.io/reference/people/movies/get-movie-credits}{the trakt API docs for further info}
#' @family people
#' @examples
#' \dontrun{
#' get_trakt_credentials() # Set required API data/headers
#' person <- trakt.people.movies("bryan-cranston")
#' }
trakt.people.movies <- function(target, extended = "min"){

  # Construct URL, make API call
  baseURL  <- "https://api-v2launch.trakt.tv/people/"
  url      <- paste0(baseURL, target, "/movies?extended=", extended)
  response <- trakt.api.call(url = url)

  # Flattening cast
  if ("movie" %in% names(response$cast)){
    response$cast$movie <- cbind(response$cast$movie[names(response$cast$movie) != "ids"],
                                 response$cast$movie$ids)
    response$cast       <- cbind(response$cast[names(response$cast) != "movie"],
                                 response$cast$movie)
    response$cast       <- convert_datetime(response$cast)
  }

  return(response)
}

#' Get a single person's show credits
#'
#' \code{trakt.people.shows} pulls show people data.
#'
#' Returns all shows where this person is in the cast or crew.
#' @param target The \code{id} of the person requested. Either the \code{slug}
#' (e.g. \code{"bryan-cranston"}), \code{trakt id} or \code{IMDb id}
#' @param extended Whether extended info should be provided.
#' Defaults to \code{"min"}, can either be \code{"min"} or \code{"full"}
#' @return A \code{data.frame}s with person details.
#' @export
#' @note See \href{http://docs.trakt.apiary.io/reference/people/shows/get-show-credits}{the trakt API docs for further info}
#' @family people
#' @examples
#' \dontrun{
#' get_trakt_credentials() # Set required API data/headers
#' person <- trakt.people.shows("bryan-cranston")
#' }
trakt.people.shows <- function(target, extended = "min"){

  # Construct URL, make API call
  baseURL  <- "https://api-v2launch.trakt.tv/people/"
  url      <- paste0(baseURL, target, "/shows?extended=", extended)
  response <- trakt.api.call(url = url)

  # Flattening cast
  if ("show" %in% names(response$cast)){
    response$cast$show  <- cbind(response$cast$show[names(response$cast$show) != "ids"],
                                 response$cast$show$ids)
    response$cast       <- cbind(response$cast[names(response$cast) != "show"],
                                 response$cast$show)
    response$cast       <- convert_datetime(response$cast)
  }

  return(response)
}
