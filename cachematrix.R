## The overall objective of this excerise is to reduce computation effort 
thereby increase speed using the concept of lexical scoping.
Lexical scoping is used by R to retrieve values from objects depending on 
how they are nested when the functions are being written.## 



## Write a short comment describing this function

The function makeCacheMatrix specifies and builds a list of functions that it returns 
to the parental environment within a list. Thus makeCacheMatrix has access to the list of 
functions in it and also the entire environment defined by makeCachMatrix, including the 
original argument.

<<- assigns the value on the right of the operator to the value of an object inthe parent 
environementon named by the object left of the operator.##



makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setinverse <- function(solve) m <<- solve
      getinverse <- function() m
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}


## Write a short comment describing this function

Solve is a function that is used specially to inverse square matrices in R. 
cacheSolve calculates the inverse of the matrix calculated in the previous function.
It looks for the value of the object specified in the parent environment, if found it takes
that values and skips the computation process and returns the inverted matrix.## 

cacheSolve <- function(x, ...) {
      m <- x$getinverse()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$setinverse(m)
      m
}

a<- matrix(1:4,2,2)

CachedMatrix <- makeCacheMatrix(a)
cacheSolve(CachedMatrix)
