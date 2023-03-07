#-------------------------------------------------------------------------------
# Model Creation
# Created by: Ioannis Oikonomidis
#-------------------------------------------------------------------------------

# Database
region <- Region(name = "nebraska", type = "us state")
date <- date_seq("2002-01-01", "2021-12-31")

# Dependent Variable
x <- new("Quickstats", region = region, date = date)
variable <- "progress"

# Predictors
Product  <- c("Daymet", "Daymet", "Daymet", "Daymet", "Daymet", "Mod09ga")
Variable <- c("dayl",   "gdd",    "prcp",   "swe",    "vp",     "ndvi_smooth_wt1")
predictors <- data.frame(Product = Product, Variable = Variable)

# Read data
data <- read(x, variable, predictors)
data <- modify(data, vars = c("gdd", "dayl", "prcp", "swe", "vp"), fun = cumsum)
data$`Winter Wheat` <- dplyr::filter(data$`Winter Wheat`, Season %in% 2003:2021)

#data <- mutate(data, vars = c("Time", "agdd", "adayl", "aprcp", "avp"), fun = cumsum)
# for (crop in crops) {
#   data[[crop]] <- data[[crop]] %>%
#     dplyr::mutate(Time = Time / 10,
#                   agdd = agdd / 10,
#                   adayl = adayl / 1e6,
#                   aprcp = aprcp / 10,
#                   avp = avp / 1e4,
#                   ndvi_smooth_wt1 = ndvi_smooth_wt1 * 10)
#
# }

# Class
Class <- "ProgressCLM"

# Formula
formula <- c(Global = "Stage ~ Time + agdd * adayl + aprcp + avp + aswe + ndvi_smooth_wt1",
             Hazard = "Stage ~ Time + agdd * adayl + aprcp + avp + aswe",
             Base   = "Stage ~ Time + agdd * adayl")

# Link
link <- c("logit", "probit", "cauchit", "cloglog")

# Parameters
prm <- cronus::combine(Class = Class,
               formula = formula,
               link = link,
               region = list(region),
               data = data)

# Crop
prm$crop <- names(prm$data)

# Label
prm$label <- paste(prm$crop, names(prm$formula), prm$link)

# Create the object
object <- create(prm)
