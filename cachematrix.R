## These functions work in conjunction to create an object that represents a
## matrix and provides functions to manipulate or access information about said matrix. 

## A function that creates an object that represents a matrix. 
## Technically a list of functions that returns a matrix or its inverse.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL

  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  get <- function() x
  setInv <- function(y) {inv <<- y} 
  getInv <- function() {inv} 
  
  list(set = set, get = get,
       setInv = setInv, getInv = getInv)
}


## CacheSolve takes in a 'matrix' and returns its inverse. 
## Will retrieve if already available but otherwise will calculate the inverse. 

cacheSolve <- function(x, ...) {
  if(!is.null(x$getInv()))
  {
    print("inv already set")
    x$getInv()
  }  else {
    x$setInv(solve(x$get()))    
  }
  x$getInv()
}
 
