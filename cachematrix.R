## Put comments here that give an overall description of what your
## functions do:
## makeCacheMatrix : given as parameter matrix that can be inverted, 
##                   caches the inverted of the matrix. 
##                   Returns : an object with interfaces: 
##                   get, setInv, getInv
## cacheSolve      : takes as param an object created by the procedure above 
##                   and returns the cached Inverted matrix  

## Write a short comment describing this function
## Input a matrix that can be inverted
## output a number of functions that can be used to manipolate the passed matrix.
## output function: 
##    get() returns the passed matrix
##    getInv() returns the Inverted matrix of the passed matrix
##    setInv(matrix that can be inverted) caches the inverted matrix of the parameter passed.
##
makeCacheMatrix <- function(x = matrix()) {
  
  ## CachedInvertMatrix
  CachedInvertMatrix <<- NULL
  
  ## MatrixParam
  MatrixParam <<- x
  
  ##    get() returns the passed matrix
  get <- function(){
    ## 
    MatrixParam
  }
  
  
  ##    setInv(matrix that can be inverted) caches the inverted matrix of the parameter passed.
  ##          after verifying that the passed parameter is identical to the one stored
  setInv <- function(passM) {
    ## Return a matrix that is the inverse of 'x'
    
    ##  compare if the object are identical
    if (identical(MatrixParam,passM)) {
      CachedInvertMatrix <<- solve(MatrixParam)
    } else {
       print ('Error')
       stop ( ' Passed Matrix is not identical with the one used to create this object' )
    }
  }
  



  ##    getInv() returns the Inverted matrix of the passed matrix
  ##       ot the value: NULL if the Inverted Matrix is not available.
  getInv <- function(){
       CachedInvertMatrix
  }
  
  ## this func. returns a pointer to the procedures defined above
  ## 
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
    print ("return cache")
    cachedOriginalMatrix
    
  } else {
    print ("creating a cache")
    ## print (x$get())
    originalMatrix <- x$get()
    InvertedMatrix<-x$setInv(originalMatrix)
  }
  ## intern1 <- makeCacheMatrix(x) 
  ## intern1$setInv(x)
  ## intern1$getInv()
}
