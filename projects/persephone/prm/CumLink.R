# Class
Class <- "PersephoneCumLink"

# Formula
formula <- c(Global = "Stage ~ Time + agdd * adayl + aprcp + avp + aswe + ndvi_smooth_wt1")

# Approximation

# Link
link <- c("logit")

# Parameters
prm <- list(Class = Class, formula = formula, link = link)
