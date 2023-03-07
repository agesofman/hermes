#-------------------------------------------------------------------------------
# Model Creation
# Created by: Ioannis Oikonomidis
#-------------------------------------------------------------------------------

# Database
region <- Region(name = "nebraska", type = "us state")
database <- new("Database", region = region)

# Data products
df_var <- data.frame(Product  = c("Quickstats", "Daymet", "Daymet", "Daymet", "Daymet", "Daymet", "Mod09ga"),
                     Variable = c("progress",   "dayl",   "gdd",    "prcp",   "swe",    "vp",     "ndvi_smooth_wt1"))

# Read data
data <- read(database, df_var, "QsProgressList")
data <- mutate(data, vars = c("gdd", "dayl", "prcp", "swe", "vp"), fun = cumsum)
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
Class <- "PersephoneMixedCumLink"

# Formula
formula <- c(global = "Stage ~ Time + agdd * adayl + aprcp + avp + aswe + ndvi_smooth_wt1",
             hazard = "Stage ~ Time + agdd * adayl + aprcp + avp + aswe",
             base   = "Stage ~ Time + agdd * adayl")

# Approximation
nAGQ <- 10L

# Link
link <- c("logistic")

# Parameters
prm <- combine(Class = Class,
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
