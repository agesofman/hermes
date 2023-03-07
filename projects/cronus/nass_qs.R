#-------------------------------------------------------------------------------
# NASS Quick Stats
# Created by: Ioannis Oikonomidis
#-------------------------------------------------------------------------------

# ----------------------------------
# Download                      ----

# Create object
x <- new("Quickstats", region = region, date = date)
variable <- "Progress"

# Download
data <- download(x, variable, ringname)

# Read saved data
data <- read(x, variable)

# Plot
plot(data, crops = "Winter Wheat", year = 2021)

# ----------------------------------
