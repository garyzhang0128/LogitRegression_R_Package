predict <- function(X, w, threshold = 0.5) {
  X = cbind(X, c(1))
  p_1 = 1 / (1 + exp(-X %*% w))
  prediction = cbind(p_1, c(0))
  for (i in 1:dim(p_1)[1]) {
    if (p_1[i, 1] > 0.5) {
      prediction[i, 2] = 1
    }
  }
  colnames(prediction) = c("P(y=1|w)", "Class_Predicted")
  return(prediction)
}