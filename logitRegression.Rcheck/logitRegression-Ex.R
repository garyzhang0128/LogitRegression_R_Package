pkgname <- "logitRegression"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
base::assign(".ExTimings", "logitRegression-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('logitRegression')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("logitRegression")
### * logitRegression

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: logitRegression
### Title: Solve Logistic Regression
### Aliases: logitRegression

### ** Examples

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
logitRegresion(X,w,y,method = "gradDesc",L2 = FALSE,alpha = 1,iter = 100000,lamda = 0.0001,eps = 0.001)

# solve Logit Regression with Gradient Descent Method and L2 norm
logitRegresion(X,w,y,method = "gradDesc",L2 = TRUE,alpha = 1,iter = 100000,lamda = 0.0001,eps = 0.001)

# solve Logit Regression with Newton's Method
logitRegresion(X,w,y,method = "nesGrad",L2 = FALSE,alpha = 1,iter = 1000,lamda = 0.1,eps = 0.001)

# solve Logit Regression with Newton's Method and L2 norm
logitRegresion(X,w,y,method = "nesGrad",L2 = TRUE,alpha = 1,iter = 1000,lamda = 0.1,eps = 0.001)

# solve Logit Regression with (Nesterov) Acclerated Gradient Method
logitRegresion(X,w,y,method = "newton",L2 = FALSE,alpha = 1,iter = 1000000,lamda = 0.0001,eps = 0.001)

# solve Logit Regression with (Nesterov) Acclerated Gradient Method and L2 norm
logitRegresion(X,w,y,method = "newton",L2 = TRUE,alpha = 1,iter = 1000000,lamda = 0.0001,eps = 0.001)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("logitRegression", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("predict")
### * predict

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: predict
### Title: Predict a data set using Logistic Regression
### Aliases: predict

### ** Examples

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

# solve Logit Regression with Gradient Descent Method
w = logitRegresion(X,w,y,method = "gradDesc",L2 = FALSE,alpha = 1,iter = 100000,lamda = 0.0001,eps = 0.001)

# predict
newdata = as.matrix(df[601:699, 2:10])
predict(newdata,w)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("predict", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
