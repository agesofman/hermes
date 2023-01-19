#-------------------------------------------------------------------------------
# MODIS
# Created by: Ioannis Oikonomidis
#-------------------------------------------------------------------------------

# ----------------------------------
# Download MOD09GA product      ----

# Create objects
x <- new("Mod09ga", region = region, date = date)

# Download
download(x, ringname)

# ----------------------------------
# Derive ndvi and cloudmask     ----

# Create objects
x <- new("Mod09ga", region = region, date = date)

# Derive ndvi and cloudmask
derive(x, "ndvi")
derive(x, "cloudmask")

# Fill gaps
fillgaps(x, "ndvi")
fillgaps(x, "cloudmask")

# ----------------------------------
# Apply cloud mask              ----

# Create objects
x <- new("Mod09ga", region = region, date = date)

# Mask
mask(x, "ndvi", "cloudmask")

# ----------------------------------
# Smooth                        ----

# Create objects
x <- new("Mod09ga", region = region, date = date)

# Smooth
pre <- NULL
post <- NULL
smoothout(x, "ndvi", pre = pre, post = post)

# ----------------------------------
# Compose                       ----

# Create objects
x <- new("Mod09ga", region = region, date = date)
y <- new("Cropmaps", region = region, date = date)

a <- compose(x, y, variablex = "ndvi_smooth_wt1", variabley = "cdl_recoded", fun = "mean")
