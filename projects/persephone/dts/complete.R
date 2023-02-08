# Region
region <- Region(name = "nebraska", type = "us state",
                 div = c(country = "United States", state = "Nebraska"))

# Data
database <- new("Database", region = region)
df_var <- data.frame(Product = c("Quickstats", rep("Daymet", 5), "Mod09ga"),
                     Variable = c("progress", "dayl", "gdd", "prcp", "swe",
                                  "vp", "ndvi_smooth_wt1"))
data <- read(database, df_var)

data$`Winter Wheat` <- dplyr::filter(data$`Winter Wheat`, Season %in% 2003:2021)

# Crops
crops <- names(data)

# Calculate cumulative environmental factors
for (crop in crops) {
  data[[crop]] <- data[[crop]] %>%
    dplyr::group_by(Season, Stage) %>%
    dplyr::mutate(adayl = cumsum(dayl),
                  agdd = cumsum(gdd),
                  aprcp = cumsum(prcp),
                  aswe = cumsum(swe),
                  avp = cumsum(vp)) %>%
    dplyr::ungroup()

  data[[crop]] <- data[[crop]] %>%
    dplyr::mutate(Time = Time / 10,
                  agdd = agdd / 10,
                  adayl = adayl / 1e6,
                  aprcp = aprcp / 10,
                  avp = avp / 1e4,
                  ndvi_smooth_wt1 = ndvi_smooth_wt1 * 10)

}

crops <- crops[c(2)]

# Dataset
dts <- list(region = list(region), data = data[crops])
