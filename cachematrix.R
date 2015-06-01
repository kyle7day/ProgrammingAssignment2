##The two functions below allow you cache the inverse of a matrix
##so that you don't need to recalculate the inverse every time 
##you need to use it.

##makeCacheMatrix is a list containing a function to
    ##set the value of the matrix
    ##get the value of the matrix
    ##set the value of the inverse
    ##get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {

} s <- NULL
set <- function(y) {
  x <<- y
  s <<- NULL
}
get <- function() x
setsolve <- function(solve) s <<- solve
getsolve <- function() s
list(set = set, get = get,
     setsolve = setsolve,
     getsolve = getsolve)
}

## cacheSolve realies on the 4 functions in makeCacheMatrix.
## it first grabs the current getsolve function and evaluates.
## if null, then it will go about pulling the functions to
## get the matrix, solve for the inverse and finally set the
## value for future use, if not null then it returns the current 
## value.

cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
  
}
