## Return the inverse of matrix A, or calculate & return if cache is empty

## makeCacheMatrix takes a square matrix A as input and calculates & stores its
## inverse in A1

makeCacheMatrix <- function(A = matrix()) {
  A1 <- NULL
  set <- function(y) {
    A <<- y
    A1 <<- NULL
}
  get <- function() A
  setinv <- function(solve) A1 <<- solve
  getinv <- function() A1
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

## cacheSolve returns the cached inverse of matrix A (if it exists), 
## otherwise it generates the inverse of matrix A 

cacheSolve <- function(A, ...) { ## I guess you replaced the x with A
        ## Return a matrix that is the inverse of 'A'
    A1 <- A$getinv() 
    if(!is.null(A1)) {
      message("getting cached data")
      return(A1)
    }
    data <- A$get()
    A1 <- solve(data, ...)
    A$setinv(A1)
    A1
  
}
