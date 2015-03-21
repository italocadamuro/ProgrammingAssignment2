## Put comments here that give an overall description of what your
## functions do:

## Write a short comment describing this function
## Input a matrix that can be inverted
## output a number of functions that can be used to manipolate the passed matrix.
## output function: 
##    get() returns the passed matrix
##    getInv() returns the Inverted matrix of x
##    setInv(matrix that can be inverted) cache the inverted matrix of the paramter.
##
makeCacheMatrix <- function(x = matrix()) {
  m <<- NULL
  toInv <<- x
  
  get <- function(){
    toInv
  }
  
  
  setInv <- function(passM) {
    ## Return a matrix that is the inverse of 'x'
    
    ##  compare if the object are identical
    if (identical(toInv,passM)) {
      m <<- solve(toInv)
    } else {
       print ('Error')
       m
    }
  }
  



  getInv <- function(){
       m
  }
  
  list(getInv = getInv, setInv = setInv, get = get)
}


## Write a short comment describing this function
## casheSolve : returns the cached inverted matrix for the matrix passed to 
##              makeCacheMatrix function
##              if no cache is available, the interface to create the inverted martix 
##              is called in makeCacheMatrix and then the cached inverted matrix is called.  
## input  : the object created with makeCacheMatrix
## output : the inverted matrix for the matrix passed to makeCacheMatrix
## 

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  cachedOriginalMatrix <- x$getInv()
  if (!is.null(cachedOriginalMatrix)){
    ## print ("return cache")
    cachedOriginalMatrix
    
  } else {
    ## print (x$get())
    originalMatrix <- x$get()
    InvertedMatrix<-x$setInv(originalMatrix)
  }
  ## intern1 <- makeCacheMatrix(x) 
  ## intern1$setInv(x)
  ## intern1$getInv()
}
