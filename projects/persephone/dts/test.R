# Region
region <- Region(name = "nebraska", type = "us state",
                 div = c(country = "United States", state = "Nebraska"))

# Data
database <- new("Database", region = region, date = as.Date("2002-01-01"))
df_var <- data.frame(Product = c("Quickstats", rep("Daymet", 6), "Mod09ga"),
                     Variable = c("progress", "dayl", "gdd", "prcp", "srad", "swe", "vp", "ndvi_smooth_wt1"))
data <- read(database, df_var)

data$`Winter Wheat` <- dplyr::filter(data$`Winter Wheat`, Season %in% 2003:2021)

# Calculate cumulative environmental factors
for (crop in names(data)) {
  data[[crop]] <- data[[crop]] %>%
    dplyr::group_by(Season, Stage) %>%
    dplyr::mutate(adayl = cumsum(dayl),
                  agdd = cumsum(gdd),
                  aprcp = cumsum(prcp),
                  asrad = cumsum(srad),
                  aswe = cumsum(swe),
                  avp = cumsum(vp)) %>%
    dplyr::ungroup()

  data[[crop]] <- data[[crop]] %>%
    dplyr::mutate(adayl = adayl / 1e5,
                  aprcp = aprcp / 10,
                  asrad = asrad / 1e3,
                  avp = avp / 1e3,
                  ndvi_smooth_wt1 = ndvi_smooth_wt1 * 10)

}

# Dataset
dts <- list(region = lapply(1:length(data), FUN = function(x) {region}),
            crop = names(data),
            data = data)
