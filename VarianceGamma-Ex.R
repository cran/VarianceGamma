pkgname <- "VarianceGamma"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('VarianceGamma')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("VarianceGamma")
### * VarianceGamma

flush(stderr()); flush(stdout())

### Name: VarianceGammaDistribution
### Title: The Variance Gamma Distribution
### Aliases: dvg pvg qvg rvg ddvg vgBreaks

### ** Examples

## Use the following rules for vgCalcRange when plotting graphs for dvg,
## ddvg and pvg.
## if nu < 2, use:
##   maxDens <- dvg(vgMode(param = c(vgC, sigma, theta, nu)),
##   param = c(vgC, sigma, theta, nu), log = FALSE)
##   vgRange <- vgCalcRange(param = c(vgC, sigma, theta, nu),
##     tol = 10^(-2)*maxDens, density = TRUE)

## if nu >= 2 and theta < 0, use:
##   vgRange <- c(vgC-2,vgC+6)
## if nu >= 2 and theta > 0, use:
##   vgRange <- c(vgC-6,vgC+2)
## if nu >= 2 and theta = 0, use:
##   vgRange <- c(vgC-4,vgC+4)

# Example 1 (nu < 2)
## For dvg and pvg
param <- c(0,0.5,0,0.5)
maxDens <- dvg(vgMode(param = param), param = param, log = FALSE)
## Or to specify parameter values individually, use:
maxDens <- dvg(vgMode(0,0.5,0,0.5), 0,0.5,0,0.5, log = FALSE)

vgRange <- vgCalcRange(param = param, tol = 10^(-2)*maxDens, density = TRUE)
par(mfrow = c(1,2))
curve(dvg(x, param = param), from = vgRange[1], to = vgRange[2], n = 1000)
title("Density of the Variance Gamma Distribution")
curve(pvg(x, param = param), from = vgRange[1], to = vgRange[2], n = 1000)
title("Distribution Function of the Variance Gamma Distribution")

## For rvg
dataVector <- rvg(500, param = param)
curve(dvg(x, param = param), range(dataVector)[1], range(dataVector)[2],
      n = 500)
hist(dataVector, freq = FALSE, add =TRUE)
title("Density and Histogram of the Variance Gamma Distribution")
logHist(dataVector, main =
   "Log-Density and Log-Histogramof the Generalized Hyperbolic Distribution")
curve(log(dvg(x, param = param)), add = TRUE,
      range(dataVector)[1], range(dataVector)[2], n = 500)

## For dvg and ddvg
par(mfrow = c(2,1))
curve(dvg(x, param = param), from = vgRange[1], to = vgRange[2],
      n = 1000)
title("Density of the Variance Gamma Distribution")
curve(ddvg(x, param = param), from = vgRange[1], to = vgRange[2],
      n = 1000)
title("Derivative of the Density of the Variance Gamma Distribution")

# Example 2 (nu > 2 and theta = 0)
## For dvg and pvg
param <- c(0,0.5,0,3)
vgRange <- c(0-4,0+4)
par(mfrow = c(1,2))
curve(dvg(x, param = param), from = vgRange[1], to = vgRange[2],
      n = 1000)
title("Density of the Variance Gamma Distribution")
curve(pvg(x, param = param), from = vgRange[1], to = vgRange[2],
      n = 1000)
title("Distribution Function of the Variance Gamma Distribution")

## For rvg
dataVector <- rvg(500, param = param)
curve(dvg(x, param = param), range(dataVector)[1], range(dataVector)[2],
      n = 500)
hist(dataVector, freq = FALSE, add =TRUE)
title("Density and Histogram of the Variance Gamma Distribution")
logHist(dataVector, main =
   "Log-Density and Log-Histogramof the Generalized Hyperbolic Distribution")
curve(log(dvg(x, param = param)), add = TRUE,
      range(dataVector)[1], range(dataVector)[2], n = 500)

## For dvg and ddvg
par(mfrow = c(2,1))
curve(dvg(x, param = param), from = vgRange[1], to = vgRange[2],
      n = 1000)
title("Density of the Variance Gamma Distribution")
curve(ddvg(x, param = param), from = vgRange[1], to = vgRange[2],
      n = 1000)
title("Derivative of the Density of the Variance Gamma Distribution")



## Use the following rules for vgCalcRange when plotting graphs for vgBreaks.
## if (nu < 2), use:
##   maxDens <- dvg(vgMode(param =c(vgC, sigma, theta, nu)),
##     param = c(vgC, sigma, theta, nu), log = FALSE)
##   vgRange <- vgCalcRange(param = param, tol = 10^(-6)*maxDens, density = TRUE)
## if (nu >= 2) and theta < 0, use:
##    vgRange <- c(vgC-2,vgC+6)
## if (nu >= 2) and theta > 0, use:
##    vgRange <- c(vgC-6,vgC+2)
## if (nu >= 2) and theta = 0, use:
##    vgRange <- c(vgC-4,vgC+4)

## Example 3 (nu < 2)
## For vgBreaks
param <- c(0,0.5,0,0.5)
maxDens <- dvg(vgMode(param = param), param = param, log = FALSE)
vgRange <- vgCalcRange(param = param, tol = 10^(-6)*maxDens, density = TRUE)
curve(dvg(x, param = param), from = vgRange[1], to = vgRange[2],
      n = 1000)
bks <- vgBreaks(param = param)
abline(v = bks)
title("Density of the Variance Gamma Distribution with breaks")

## Example 4 (nu > 2 and theta = 0)
## For vgBreaks
param <- c(0,0.5,0,3)
vgRange <- c(0-4,0+4)
curve(dvg(x, param = param), from = vgRange[1], to = vgRange[2],
      n = 1000)
bks <- vgBreaks(param = param)
abline(v = bks)
title("Density of the Variance Gamma Distribution with breaks")  



graphics::par(get("par.postscript", pos = 'CheckExEnv'))
cleanEx()
nameEx("summary.vgFit")
### * summary.vgFit

flush(stderr()); flush(stdout())

### Name: summary.vgFit
### Title: Summarizing Variance Gamma Distribution Fit
### Aliases: summary.vgFit print.summary.vgFit

### ** Examples

### Continuing the  vgFit(.) example:
param <- c(0,0.5,0,0.5)
dataVector <- rvg(500, param = param)
fit <- vgFit(dataVector)
print(fit)
summary(fit)          



cleanEx()
nameEx("vgCalcRange")
### * vgCalcRange

flush(stderr()); flush(stdout())

### Name: vgCalcRange
### Title: Range of a Variance Gamma Distribution
### Aliases: vgCalcRange

### ** Examples


## Use the following rules for vgCalcRange when plotting graphs for dvg,
## ddvg and pvg.
## if nu < 2, use:
##   maxDens <- dvg(vgMode(param = c(vgC, sigma, theta, nu)),
##   param = c(vgC, sigma, theta, nu), log = FALSE)
##   vgRange <- vgCalcRange(param = c(vgC, sigma, theta, nu),
##     tol = 10^(-2)*maxDens, density = TRUE)

## if nu >= 2 and theta < 0, use:
##   vgRange <- c(vgC-2,vgC+6)
## if nu >= 2 and theta > 0, use:
##   vgRange <- c(vgC-6,vgC+2)
## if nu >= 2 and theta = 0, use:
##   vgRange <- c(vgC-4,vgC+4)

param <- c(0,0.5,0,0.5)
maxDens <- dvg(vgMode(param = param), param = param)
vgRange <- vgCalcRange(param = param, tol = 10^(-2)*maxDens)
vgRange
curve(dvg(x, param = param), vgRange[1], vgRange[2])
curve(dvg(x, param = param), vgRange[1], vgRange[2])

param <- c(2,2,0,3)
vgRange <- c(2-4,2+4)
vgRange
curve(dvg(x, param = param), vgRange[1], vgRange[2])
## Not run: vgCalcRange(param = param, tol = 10^(-3), density = FALSE)



cleanEx()
nameEx("vgChangePars")
### * vgChangePars

flush(stderr()); flush(stdout())

### Name: vgChangePars
### Title: Change Parameterizations of the Variance Gamma Distribution
### Aliases: vgChangePars

### ** Examples

param1 <- c(2,2,1,3)                   # Parameterization 1
param2 <- vgChangePars(1, 2, param1)   # Convert to parameterization 2
param2                                 # Parameterization 2
vgChangePars(2, 1, as.numeric(param2)) # Convert back to parameterization 1

param3 <- c(1,2,0,0.5)                 # Parameterization 3
param1 <- vgChangePars(3, 1, param3)   # Convert to parameterization 1
param1                                 # Parameterization 1
vgChangePars(1, 3, as.numeric(param1)) # Convert back to parameterization 3



cleanEx()
nameEx("vgCheckPars")
### * vgCheckPars

flush(stderr()); flush(stdout())

### Name: vgCheckPars
### Title: Check Parameters of the Variance Gamma Distribution
### Aliases: vgCheckPars
### Keywords: distribution

### ** Examples

 vgCheckPars(c(0,1,0,1))      # normal
 vgCheckPars(c(0,0,0,1))      # error
 vgCheckPars(c(0,1,0,-2))     # error
 vgCheckPars(c(0,1,0))        # error



cleanEx()
nameEx("vgFit")
### * vgFit

flush(stderr()); flush(stdout())

### Name: vgFit
### Title: Fit the Variance Gamma to Data
### Aliases: vgFit print.vgFit plot.vgFit

### ** Examples

param <- c(0,0.5,0,0.5)
dataVector <- rvg(500, param = param)
## See how well vgFit works
vgFit(dataVector)
vgFit(dataVector, plots = TRUE)
fit <- vgFit(dataVector)
par(mfrow = c(1,2))
plot(fit, which = c(1,3))

## Use nlm instead of default
param <- c(0,0.5,0,0.5)
dataVector <- rvg(500, param = param)
vgFit(dataVector, method = "nlm", hessian = TRUE)


## Use BFGS instead of deault
param <- c(0,0.5,0,0.5)
dataVector <- rvg(500, param = param)
vgFit(dataVector, method = "BFGS", hessian = TRUE)



graphics::par(get("par.postscript", pos = 'CheckExEnv'))
cleanEx()
nameEx("vgFitStart")
### * vgFitStart

flush(stderr()); flush(stdout())

### Name: vgFitStart
### Title: Find Starting Values for Fitting a Variance Gamma Distribution
### Aliases: vgFitStart vgFitStartMoM

### ** Examples

param <- c(0,0.5,0,0.5)
dataVector <- rvg(500, param = param)
vgFitStart(dataVector,startValues="SL")
vgFitStartMoM(dataVector)
vgFitStart(dataVector,startValues="MoM")



cleanEx()
nameEx("vgMeanVarMode")
### * vgMeanVarMode

flush(stderr()); flush(stdout())

### Name: Variance Gamma Mean, Variance, Skewness, Kurtosis and Mode
### Title: Moments and Mode of the Variance Gamma Distribution
### Aliases: vgMean vgVar vgSkew vgKurt vgMode

### ** Examples

param <- c(2,2,2,0.5)
vgMean(param = param)
## Or to specify parameter values individually, use:
vgMean (2,2,2,0.5)
  
vgVar(param = param)
vgSkew(param = param)
vgKurt(param = param)
vgMode(param = param)
maxDens <- dvg(vgMode(param = param), param = param)
vgRange <- vgCalcRange(param = param, tol = 10^(-2)*maxDens)
curve(dvg(x, param = param), vgRange[1], vgRange[2])
abline(v = vgMode(param = param), col = "blue")
abline(v = vgMean(param = param), col = "red")



cleanEx()
nameEx("vgMom")
### * vgMom

flush(stderr()); flush(stdout())

### Name: vgMom
### Title: Calculate Moments of the Variance Gamma Distribution
### Aliases: vgMom
### Keywords: distribution

### ** Examples

  ### Raw moments of the VG distribution
  vgMom(3, param=c(2,1,2,1), momType = "raw")

  ### Mu moments of the VG distribution
  vgMom(2, param=c(2,1,2,1), momType = "mu")

  ### Central moments of the VG distribution
  vgMom(4, param=c(2,1,2,1), momType = "central")

  ### Moments about any locations
  vgMom(4, param=c(2,1,2,1), about = 1)



cleanEx()
nameEx("vgParam")
### * vgParam

flush(stderr()); flush(stdout())

### Name: vgParam
### Title: Parameter Sets for Variance Gamma Distribution
### Aliases: vgSmallShape vgLargeShape vgSmallParam vgLargeParam

### ** Examples

data(vgParam)
## Testing the accuracy of vgMean
for (i in 1:nrow(vgSmallParam)) {
    param <- vgSmallParam[i,]
    x <- rvg(10000,param = param)
    sampleMean <- mean(x)
    funMean <- vgMean(param = param)
    difference <- abs(sampleMean - funMean)
    print(difference)
}




cleanEx()
nameEx("vgPlots")
### * vgPlots

flush(stderr()); flush(stdout())

### Name: VarianceGammaPlots
### Title: Variance Gamma Quantile-Quantile and Percent-Percent Plots
### Aliases: qqvg ppvg

### ** Examples


## Example 1: the parameter values are known
par(mfrow = c(1,2))
y <- rvg(200, param = c(2,2,1,2))
qqvg(y, param = c(2,2,1,2),line = FALSE)
abline(0, 1, col = 2)
ppvg(y, param = c(2,2,1,2))

## Example 2: the parameter values are unknown
par(mfrow = c(1,2))
y <- rvg(200, param = c(2,2,1,2))
qqvg(y, line = FALSE)
abline(0, 1, col = 2)
ppvg(y)



graphics::par(get("par.postscript", pos = 'CheckExEnv'))
### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
