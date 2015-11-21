## makeCacheMatrix allows the user to cache a matrix and its inverse.
## When a new matrix is set, the cached inverted matrix is nulled. 
## Setting and getting functions within makeCacheMatrix are intended to be
## called by function cacheSolve.

makeCacheMatrix <- function(mat = matrix()) {
	invmat <- NULL
	setmatrix <- function(matinput) {
		mat <<- matinput
		invmat <<- NULL
	}
	getmatrix <- function() mat
	setinvmatrix <- function(invmatinput) invmat <<- invmatinput
	getinvmatrix <- function() invmat
	list(setmatrix = setmatrix, getmatrix = getmatrix,
		setinvmatrix = setinvmatrix,
		getinvmatrix = getinvmatrix)
}


## cacheSolve can be used to set the cached matrix and calculate and
## cache the matrix inverse in the function makeCacheMatrix. Before
## calculating the matrix inverse the function checks to see if the currently
## cached inverted matrix belongs to the cached matrix. This assumes that only
## cacheSolve is calling the setinvmatrix subfunction.

cacheSolve <- function(mat, ...) {
	invmat <- mat$getinvmatrix()
	if(!is.null(invmat)) {
		message("getting cached data")
		return(invmat)
	}
	tosolve <- mat$getmatrix()<
	invmat <- solve(tosolve)
	mat$setinvmatrix(invmat)
	invmat
}
