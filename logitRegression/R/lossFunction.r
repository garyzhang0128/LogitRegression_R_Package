lossFunction <- function(X, w, y, L2 = FALSE, alpha = 1) {
  loss_vector = -X %*% w * y + log(1 + exp(X %*% w))
  loss_sum = sum(loss_vector)
  if (L2) {
    return((loss_sum + alpha * t(w) %*% w)[1, 1])
  }
  else{
    return(loss_sum)
  }
}
