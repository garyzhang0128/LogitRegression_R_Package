gradient <- function(X, w, y, L2 = FALSE, alpha = 1) {
  grad = t(X) %*% as.matrix(1 / (1 + exp(-X %*% w)) - y)
  if (L2) {
    return(grad + alpha * 2 * w)
  }
  else{
    return(grad)
  }
  
}