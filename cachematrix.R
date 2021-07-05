## makeCacheMatrix creates a special "matrix", which is really a list containing a function to
  # set the value of the vector
  # get the value of the vector
  # set the value of the mean
  # get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    x <<- y
    i <<- NULL 
  }
  get <- function() {
    x}
  setinverse <- function(inverse) {
    i <<- inverse}
  getinverse <- function() {
    i}
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## The following function calculates the inverse of the special "matrix" created with the above function.

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- inverse(data, ...)
  x$setinverse(i)
  i
}
