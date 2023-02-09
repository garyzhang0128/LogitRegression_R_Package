logitRegression <-
  function(X,
           w,
           y,
           method,
           L2 = FALSE,
           alpha = 1,
           iter = 100000,
           lamda = 0.001,
           eps = 0.001) {
    if (method == "gradDesc") {
      return(gradDesc(X, w, y, L2, alpha, iter, lamda, eps))
    }
    if (method == "newton") {
      return(newton(X, w, y, L2, alpha, iter, lamda, eps))
    }
    if (method == "nesGrad") {
      return(nesGrad(X, w, y, L2, alpha, iter, lamda, eps))
    }
  }
