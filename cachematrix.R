## Stores functions to cache and retrieve 
## an inverse matrix

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function (y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInv <- function (inverse) m <<- inverse
    getInv <- function() m
    list (set = set, get = get,
          setInv = setInv,
          getInv = getInv)
}


## Returns a matrix that is the inverse of 'x'
## checks first if it has been calculated

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
    m <- x$getInv()
    if (!is.null(m)) {
        message ("getting cached data")
        return (m)
    }
    
    data <- x$get()
    m <- solve (data, ...)
    x$setInv(m)
    m
}

