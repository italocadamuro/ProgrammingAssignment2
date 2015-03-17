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
## input  : an Object created with makeCacheMatrix
## output : the inverted matrix for the matrix passed to makeCacheMatrix
## if the Inverted Matrix is already present in the object passed as paramter returns it
## Otherwise the interface to create a Inverted matrix is called and the Inverted matrix 
## is returned.
## 

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  mm <- x$getInv()
  if (!is.null(mm)){
    print ("return cache")
    mm
    
  } else {
    print (x$get())
    mmm <- x$get()
    m<-x$setInv(mmm)
  }
  ## intern1 <- makeCacheMatrix(x) 
  ## intern1$setInv(x)
  ## intern1$getInv()
}
