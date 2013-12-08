#' @rdname getCheckins
#' @export
#'
#' @title 
#' Extract list of checkins of a Facebook friend
#'
#' @description
#' \code{getCheckins} retrieves information about a friend's checkins
#'
#' @details
#' 
#' This function requires the use of an OAuth token with the following
#' permissions: user_status, user_checkins, friends_status, friends_checkins
#'
#' @author
#' Pablo Barbera \email{pablo.barbera@@nyu.edu}
#' @seealso \code{\link{getFriends}}
#'
#' @param token A temporary access token created at
#' \url{https://developers.facebook.com/tools/explorer}
#'
#' @param user A user ID or screen name.
#'
#' @param n Maximum number of checkins to return for each user.
#'
#' @examples \dontrun{
#'  token <- 'XXXXX'
#'  my_checkins <- getCheckins(user="me", token=token)
#' }
#'

getCheckins <- function(user, n=10, token){
	query <- paste0('https://graph.facebook.com/', user, 
		'?fields=checkins.limit(', n, ').fields(created_time,',
			'place.fields(id,name,location))')
	content <- callAPI(query, token)
	df <- checkinDataToDF(content$checkins$data)
	return(df)
}
