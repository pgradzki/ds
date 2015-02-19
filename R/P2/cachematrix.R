
# Function for creating the inverse matrix cache
makeCacheMatrix <- function(x = matrix()) {
  
  cache_x_inv <- NULL 
  
  # set the "input" matrix
  set <- function(y) {
    x <<- y
    cache_x_inv <<- NULL # new matrix set, set cache to NULL
  }
  
  # return the "input" matrix
  get <- function() x 
  
  # set the inverse matrix
  setInvMtrx <- function(inv) cache_x_inv <<- inv 
  
  # return the inverse matrix
  getInvMtrx <- function() cache_x_inv 
  
  
  list(set = set, get = get,
       setInvMtrx = setInvMtrx,
       getInvMtrx = getInvMtrx)
}

# Function computes the inverse of the special "matrix" returned by 
# makeCacheMatrix above. If the inverse has already been calculated 
# (and the matrix has not changed), then the cachesolve should retrieve 
# the inverse from the cache.
cacheSolve <- function(x, ...) {
  m <- x$getInvMtrx() 
  
  # Check if we have already cached the inverse matrix
  if(!is.null(m)) { 
    message("Return cached data")
    return(m) 
  }
  
  message("Not cached yet, computing...")
  
  # Inverse matrix not cached yet - compute it and put into the cache.
  data <- x$get() 
  
  m <- solve(data)
  
  x$setInvMtrx(m) 
}

# Some testing here:
# Generate a random 5x5 square, non-singular matrix
test <- matrix(runif(25,1,100),5,5)
# generate the makeCacheMatrix object with this matrix
testCached <- makeCacheMatrix(test)
# from now on calculate or retrieve calculated inversion using the cacheSolve function

testInv <- cacheSolve(testCached)
testInv <- cacheSolve(testCached)
testInv <- cacheSolve(testCached)

# Generate new matrix
test <- matrix(runif(25,1,100),5,5)
# generate the new makeCacheMatrix object
testCached <- makeCacheMatrix(test)
# and check that it's not yet cached
testInv <- cacheSolve(testCached)
testInv <- cacheSolve(testCached)


