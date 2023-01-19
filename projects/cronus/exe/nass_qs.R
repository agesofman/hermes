#-------------------------------------------------------------------------------
# NASS Quick Stats
# Created by: Ioannis Oikonomidis
#-------------------------------------------------------------------------------

# ----------------------------------
# Download                      ----

# Create object
x <- new("Quickstats", region = region, date = date)
variable <- "progress"

# Download
data <- download(x, variable, ringname)

# Plot
plot(x, variable, crops = "Winter Wheat", year = 2021)

# ----------------------------------
