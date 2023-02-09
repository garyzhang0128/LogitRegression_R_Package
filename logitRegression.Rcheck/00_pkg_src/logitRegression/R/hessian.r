hessian <- function(X, w, L2 = FALSE, alpha = 1) {
  n = dim(X)[1]
  S = matrix(0, n, n)
  
  for (i in 1:n) {
    miu_i = 1 / (1 + exp(-X %*% w))[i]
    S[i, i] = miu_i * (1 - miu_i)
  }
  
  if (L2) {
    return(t(X) %*% S %*% X + 2 * alpha)
  }
  else{
    return(t(X) %*% S %*% X)
  }
}