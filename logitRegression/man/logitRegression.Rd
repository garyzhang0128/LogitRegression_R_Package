\name{logitRegression}
\alias{logitRegression}
\title{Solve Logistic Regression}
\usage{
logitRegression(X,w,y,method = c("gradDesc","nesGrad","newton"),L2 = FALSE,alpha = 1,iter = 100000,lamda = 0.001,eps = 0.001,\dots)
}
\description{
Solve logistic regression models and logistic regression models with L2 norm regularization. Solving algorithms include gradient descent, accelerated gradient, and Newton methods, return coefficients array.
}
\arguments{
  \item{X}{matrix of independent variable}
  \item{y}{matrix of class}
  \item{w}{initial coefficients array}
  \item{method}{solving algorithm used}
  \item{L2}{with L2 norm or not}
  \item{alpha}{coefficient of L2 norm}
  \item{iter}{max iteration}
  \item{lamda}{step size}
  \item{eps}{terminational condition of iteration}
  \item{\dots}{other arguments not used by this function.}
}
\examples{
# import dataset
data("breast_cancer_wisconsin")

# generate input
X = df[, 2:10]
X = as.matrix(X)
X = cbind(X, c(1)) # create bias
colnames(X)[10] = "intercept"
y = df[11] # class
set.seed(1)
w = as.matrix(rnorm(10)) # init w

# solve Logit Regression with Gradient Descent Method
logitRegression(X,w,y,method = "gradDesc",L2 = FALSE,alpha = 1,iter = 100000,lamda = 0.0001,eps = 0.001)

# solve Logit Regression with Gradient Descent Method and L2 norm
logitRegression(X,w,y,method = "gradDesc",L2 = TRUE,alpha = 1,iter = 100000,lamda = 0.0001,eps = 0.001)

# solve Logit Regression with Newton's Method
logitRegression(X,w,y,method = "nesGrad",L2 = FALSE,alpha = 1,iter = 10000,lamda = 0.0001,eps = 0.001)

# solve Logit Regression with Newton's Method and L2 norm
logitRegression(X,w,y,method = "nesGrad",L2 = TRUE,alpha = 1,iter = 10000,lamda = 0.0001,eps = 0.001)

# solve Logit Regression with (Nesterov) Acclerated Gradient Method
logitRegression(X,w,y,method = "newton",L2 = FALSE,alpha = 1,iter = 1000,lamda = 0.1,eps = 0.001)

# solve Logit Regression with (Nesterov) Acclerated Gradient Method and L2 norm
logitRegression(X,w,y,method = "newton",L2 = TRUE,alpha = 1,iter = 1000,lamda = 0.1,eps = 0.001)
}
