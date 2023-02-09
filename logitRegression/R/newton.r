library(MASS)
newton <- function(X,
                   w,
                   y,
                   L2 = FALSE,
                   alpha = 1,
                   iter = 1000,
                   lamda = 0.1,
                   eps = 0.001) {
  for (i in 1:iter) {
    loss = lossFunction(X, w, y, L2, alpha)
    grad = gradient(X, w, y, L2, alpha)
    hess = hessian(X, w, L2, alpha)
    if (sqrt(sum(grad ^ 2)) < eps) {
      print(paste("iteration:", i))
      return(w)
    }
    w = w - ginv(hess) %*% grad * lamda
  }
  print(paste("iteration:", i))
  return(w)
}