#-------------------------------------------------------------------------------
# ORNL Daymet
# Created by: Ioannis Oikonomidis
#-------------------------------------------------------------------------------

# ----------------------------------
# Download                      ----

# Create object
x <- new("Daymet", region = region, date = date)

# Download
download(x, variable = "tmin")

# Plot the raster for chosen dates
plot(x, "tmin", "2002-01-01")

# ----------------------------------
# Derive gdd                    ----

# Create objects
x <- new("Daymet", region = region, date = date)
y <- new("Cropmaps", region = region, date = date)

# Create parameters (cardinal temperatures)
z <- new("Parameters", region = region, date = date)
tb_ct <- read(z, "default")$tb_ct

# Derive gdd (take a look at the gdd function)
derive(x, y, "gdd", varxy = c("tmin", "tmax", "cdl_default"), tb_ct = tb_ct)

# Plot the raster for chosen dates
plot(x, "gdd", "2002-06-01")

# ----------------------------------
# Compose                       ----

# Create objects
x <- new("Daymet", region = region, date = date)
y <- new("Cropmaps", region = region, date = date)

# Compose
a <- compose(x, y, variablex = "gdd",  variabley = "cdl_default", fun = "mean")
b <- compose(x, y, variablex = "prcp", variabley = "cdl_default", fun = "mean")
c <- compose(x, y, variablex = "dayl", variabley = "cdl_default", fun = "mean")
d <- compose(x, y, variablex = "srad", variabley = "cdl_default", fun = "mean")
e <- compose(x, y, variablex = "swe",  variabley = "cdl_default", fun = "mean")
f <- compose(x, y, variablex = "vp",   variabley = "cdl_default", fun = "mean")
