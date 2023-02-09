prox <-
  function(X,
           v,
           y,
           L2 = FALSE,
           alpha = 1,
           lamda = 0.01) {
    grad = gradient(X, v, y, L2, alpha)
    return(v - lamda * grad)
  }