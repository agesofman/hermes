#-------------------------------------------------------------------------------
# NASS Cropland Data Layer
# Created by: Ioannis Oikonomidis
#-------------------------------------------------------------------------------

# ----------------------------------
# Download                      ----

# Create objects
x <- new("Cropmaps", region = region, date = date)
variable <- "cdl"

# Download
download(x, variable)

# Plot
plot(x, variable, crop = c("Soybeans", "Winter Wheat"), year = 2002)

# ----------------------------------
# Reproject                     ----

# Create objects
x <- new("Cropmaps", region = region, date = date)
y <- new("Daymet", region = region, date = date)

# Project
project(x, y, variablex = "cdl", variabley = "tmin", "cdl_projected")

# ----------------------------------
# Recode and summarize          ----

# Create objects
x <- new("Cropmaps", region = region, date = date)

# Recode and summarize
recode(x, "cdl_projected", mdname = "default", newvarname = "cdl_recoded")

# Summarize
a <- summarize(x, "cdl_recoded")
