# Class
Class <- "PersephoneMixedCumLink"

# Formula
formula <- c(Global = "Stage ~ Time + agdd * adayl + aprcp + avp + aswe + ndvi_smooth_wt1",
             Hazard = "Stage ~ Time + agdd * adayl + aprcp + avp + aswe",
             Base   = "Stage ~ Time + agdd * adayl")

# Approximation
nAGQ <- 10L

# Link
link <- c("logistic")

# Parameters
prm <- list(Class = Class, formula = formula, link = link)
