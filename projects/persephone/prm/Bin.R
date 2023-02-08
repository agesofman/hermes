# Class
Class <- "PersephoneBin"

# Formula
formula <- c(Global = "CumPercentage ~ Time + agdd * adayl + aprcp + avp + aswe + ndvi_smooth_wt1",
             Hazard = "CumPercentage ~ Time + agdd * adayl + aprcp + avp + aswe",
             Base   = "CumPercentage ~ Time + agdd * adayl")

# Link
link <- c("logit", "probit", "cauchit", "cloglog")

# Parameters
prm <- list(Class = Class, formula = formula, link = link)
