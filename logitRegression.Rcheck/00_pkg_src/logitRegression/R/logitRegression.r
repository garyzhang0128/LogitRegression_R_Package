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
      gradDesc(X, w, y, L2, alpha, iter, lamda, eps)
    }
    if (method == "newton") {
      newton(X, w, y, L2, alpha, iter, lamda, eps)
    }
    if (mathod == "nesGrad") {
      nesGrad(X, w, y, L2, alpha, iter, lamda, eps)
    }
  }