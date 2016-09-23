## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## x is a special square matrix.
## It is a list containing functions to
##      1. set the matrix
##      2. get the matrix
##      3. set the inverse
##      4. get the inverse
## The list is used as the input for casheSolve()


makeCacheMatrix <- function(x = matrix()) {
    in <- NULL
    set <- function(y){
           x <<- y
           in <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) in <<- inverse
    getinverse <- function() in
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function

## The following function calculates the inverse of the special "matrix" returned
## by makeCacheMatrix above. It first checks to see if the inverse has already been
## been calculated. If so, it gets the inverse from the cache and skips the computation.
## Otherwise, it calculates the inverse of the data and sets the value of the inverse 
## in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
    in <- x$getinverse()
    if(!is.null(in)){
          message("getting cached data") 
          return(in)
    }  
    my_data <- x$get()
    in <- inverse(my_data, ...)
    x$setinverse(in)
    in
}
