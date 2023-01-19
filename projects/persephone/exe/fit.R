#-------------------------------------------------------------------------------
# Model Fitting
# Created by: Ioannis Oikonomidis
#-------------------------------------------------------------------------------

# ----------------------------------
# Create the object             ----

files <- PersephoneFiles(prm = "test", dts = "test")
object <- create(files)

# ----------------------------------
# Fit                           ----

object <- fit(object)
summary(object)
plot(object, cumulative = TRUE, seasons = 2002)

# ----------------------------------
# Calculate metrics             ----

object <- crossval(object, maxsam = 10, seed = 1)
plot_metrics(object)

# ----------------------------------
# Create reports                ----

report(object, name = "myreport", path = agesofman::get_path_hermes())
