# Class
Class <- "PersephoneMixedBin"

# Formula
formula <- c(Global = "CumPercentage ~ Time + agdd * adayl + aprcp + avp + ndvi_smooth_wt1 + (1 | Season)",
             Hazard = "CumPercentage ~ Time + agdd * adayl + aprcp + avp + (1 | Season)",
             Base   = "CumPercentage ~ Time + agdd * adayl + (1 | Season)")

# Approximation
nAGQ <- 10L

# Link
link <- c("logit", "probit")

# Parameters
prm <- list(Class = Class, formula = formula, nAGQ = nAGQ, link = link)
