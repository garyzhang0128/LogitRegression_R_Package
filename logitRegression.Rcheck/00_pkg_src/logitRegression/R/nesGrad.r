nesGrad <-
  function(X,
           w,
           y,
           L2 = FALSE,
           alpha = 1,
           iter = 1000000,
           lamda = 0.0001,
           eps = 0.001) {
    i = 1
    v = w
    w_ori = w
    w = prox(X, v, y, L2, alpha, lamda)
    for (i in 2:iter) {
      loss = lossFunction(X, w, y, L2, alpha)
      grad = gradient(X, w, y, L2, alpha)
      if (sqrt(sum(grad ^ 2)) < eps) {
        print(paste("iteration:", i))
        return(w)
      }
      v = w + (i - 2) / (i + 1) * (w - w_ori)
      w_ori = w
      w = prox(X, v, y, L2, alpha, lamda)
    }
    print(paste("iteration:", i))
    return(w)
  }