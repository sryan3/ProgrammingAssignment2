## Put comments here that give an overall description of what your
## functions do

## creates a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
    get <- function() x
    setmatrix <- function(matrix) m <<- matrix
    getmatrix <- function() m
    list(set = set, get = get,
         setmatrix = setmatrix,
         getmatrix = getmatrix)
}


## computes inverse matrix, uses from cache if available

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  
    m <- x$getmatrix()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data <- x$get()
    m <- solve(data) ## returns inverse
    x$setmatrix(m)
    m
  
}
