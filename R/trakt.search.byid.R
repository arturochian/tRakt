#' Lookup a show via id
#'
#' \code{trakt.search.byid} pulls show stats and returns it compactly.
#' 
#' @param id The keyword used for the search. Should be as URL-compatible as possible.
#' @param id_type The type of \code{id}. Defaults to \code{trakt-show}, can be 
#' \code{trakt-movie}, \code{trakt-show}, \code{trakt-episode}, \code{imdb}, 
#' \code{tmdb}, \code{tvdb}, \code{tvrage}
#' @return A \code{data.frame} containing a single search result. Hopefully the one you wanted.
#' If no result is foun, the return value is \code{list(error = "Nothing found")} and a \code{warning}
#' @export
#' @importFrom jsonlite fromJSON
#' @import httr
#' @note See \href{http://docs.trakt.apiary.io/reference/search/id-lookup/get-id-lookup-results}{the trakt API docs for further info}
#' @examples
#' \dontrun{
#' get_trakt_credentials() # Set required API data/headers
#' breakingbad <- trakt.search.byid(1388, "trakt-show")
#' }
trakt.search.byid <- function(id, id_type = "trakt-show"){
  if (is.null(getOption("trakt.headers"))){
    stop("HTTP headers not set, see ?get_trakt_credentials")
  }
  # Setting values required for API call
  headers  <- getOption("trakt.headers")
  query    <- as.character(query) # Just to make sure…
  query    <- URLencode(query)    # URL normalization
  baseURL  <- "https://api-v2launch.trakt.tv/search"
  url      <- paste0(baseURL, "?id_type=", id_type, "&id=", id)
  
  # Actual API call
  response    <- httr::GET(url, headers)
  httr::stop_for_status(response) # In case trakt fails
  response    <- httr::content(response, as = "text")
  response    <- jsonlite::fromJSON(response)
  
  # Check if response is empty (nothing found)
  if (identical(response, list())){
    warning("No result, sorry.")
    return(list(error = "Nothing found"))
  }
  show <- response$show
  return(show)
}