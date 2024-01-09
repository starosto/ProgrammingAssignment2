## Below are two functions that are used to create a special object
## that stores an invertible matrix and cache's its inverse.

## The first function, makeCacheMatrix creates a special "vector",
## which is really a list containing a function to

## set the value of the matrix

## get the value of the matrix

## set the value of the inverse

## get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  set <- function(y) {
    x <<- y
  }
  get <- function() x
  setinv <- function(inv) i <<- inv
  getinv <- function() i
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)

}


## The following function calculates the inverse of the special "vector"
## created with the above function. However, it first checks to see
## if the inverse has already been calculated. If so, it gets the inverse
## from the cache and skips the computation.

cacheSolve <- function(x) {
  i <- x$getinv()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinv(i)
  ## Return a matrix that is the inverse of 'x'
  i
}

# Example
test <- matrix(c(2,6,1,4), nrow = 2, ncol=2)
test

i <- NULL
i <- cacheSolve(makeCacheMatrix(test))
i
i <- cacheSolve(makeCacheMatrix(test))
i

# Example 2
test2 <- matrix(c(1,2,2,2,4,1,0,1,0), nrow = 3, ncol=3)
test2

i <- NULL
i <- cacheSolve(makeCacheMatrix(test2))
i
i <- cacheSolve(makeCacheMatrix(test))
i
