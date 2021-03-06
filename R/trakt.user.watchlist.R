#' Get a user's watchlist
#'
#' \code{trakt.user.watchlist} pulls a user's watchlist.

#' @param user Target user. Defaults to \code{getOption("trakt.username")}
#' @param type Either \code{shows} (default) or \code{movies}
#' @return A \code{data.frame} containing stats.
#' @export
#' @note See \href{http://docs.trakt.apiary.io/#reference/users/ratings/get-watchlist}{the trakt API docs for further info}
#' @family user
#' @examples
#' \dontrun{
#' get_trakt_credentials() # Set required API data/headers
#' mystats   <- trakt.user.watchlist() # Defaults to your username if set
#' seanstats <- trakt.user.watchlist(user = "sean")
#' }
trakt.user.watchlist <- function(user = getOption("trakt.username"), type = "shows"){
  if (is.null(user) && is.null(getOption("trakt.username"))){
    stop("No username is set.")
  }

  # Please R CMD check
  show  <- NULL
  ids   <- NULL
  movie <- NULL

  # Construct URL, make API call
  baseURL  <- "https://api-v2launch.trakt.tv/users"
  url      <- paste0(baseURL, "/", user, "/watchlist/", type)
  response <- trakt.api.call(url = url)

  if (type == "show"){
    response <- cbind(subset(response, select = -show), response$show)
    response <- cbind(subset(response, select = -ids), response$ids)
  } else if (type == "movies"){
    response <- cbind(subset(response, select = -movie), response$movie)
    response <- cbind(subset(response, select = -ids), response$ids)
  }
  return(response)
}
