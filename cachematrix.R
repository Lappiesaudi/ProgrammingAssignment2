## The following incldues functions that creates and manipulates a special "matrix" object that puts previously calculated inverse values in a cache.

## Creates a special "matrix" object.

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    setmatrix <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    getmatrix <- function() x
    setinverse <- function(i) inverse <<- i
    getinverse <- function() inverse
    list(setmatrix = setmatrix, getmatrix = getmatrix,
    setinverse = setinverse, getinverse = getinverse)
}


## This calculates the inverse of the special "matrix" object and caches the inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- ob$getinverse()
        if(!is.null(i)) {
            message("getting cached data")
            return(i)
        }
        mat <- ob$getmatrix()
        i <- solve(mat)
        ob$setinverse(i)
        return(i)
}
