# Class
Class <- "PersephoneBin"

# Formula
formula <- c(Global = "CumPercentage ~ Time + agdd * adayl + aprcp + avp + aswe + ndvi_smooth_wt1",
             Base   = "CumPercentage ~ Time + agdd * adayl")

# Link
link <- c("logit", "probit")

# Parameters
prm <- list(Class = Class, formula = formula, link = link)
