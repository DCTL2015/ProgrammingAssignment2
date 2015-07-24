## This assignment is to write a pair of functions that will cache the inverse of a matrix.

# The function below will create a "matrix" object that can cache its inverse.

> makeCacheMatrix<-function(x=matrix()){
+ inv<-NULL
+ set<-function(y){
+ x<<-y
+ inv<<-NULL
+ }
+ get<-function()x
+ setinverse<-function(inverse) inve<<- inverse
+ getinverse<-function()inv
+ list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
+ }

## This function will calculate the inverse of the "matrix" returned by using the above makeCacheMatrix function.
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

> cacheSolve<-function(x,...){
+ inv<-x$getinverse()
+ if(!is.null(inv)){
+ message("grabbing cached data")
+ return(inv)
+ }
+ data<-x$get()
+ inv<-solve(data)
+ x$setinverse(inv)
+ inv
+ }

## Return a matrix that is the inverse of 'x'
## TEST RUN
> x=rbind(c(1,10),c(10,1))
> m=makeCacheMatrix(x)
> m$get()
     [,1] [,2]
[1,]    1   10
[2,]   10    1
## No cache
> cacheSolve(m)
            [,1]        [,2]
[1,] -0.01010101  0.10101010
[2,]  0.10101010 -0.01010101
> 
## Retrieving cache
