\name{lossFunction}
\alias{lossFunction}

\title{
calcute the loss of log maximum likelihood
}

\description{
\code{lossFunction} calcute the loss of log maximum likelihood

\usage{
  \method{lossFunction}(X, w, y, L2 = FALSE, alpha = 1,\dots)
}

\arguments{
  \item{X}{matrix of independent variable}
  \item{y}{matrix of class}
  \item{w}{initial coefficients array}
  \item{L2}{with L2 norm or not}
  \item{alpha}{coefficient of L2 norm}
  \item{\dots}{other arguments not used by this function.}
}
\examples{
# import dataset
data("breast_cancer_wisconsin")
df = breast_cancer_wisconsin
# generate input
X = df[0:600, 2:10]
X = as.matrix(X)
X = cbind(X, c(1)) # create bias
colnames(X)[10] = "intercept"
y = df[11] # class
set.seed(1)
w = as.matrix(rnorm(10)) # init w

# calcute the loss of log maximum likelihood
loss = lossFunction(X,y,w)
}
