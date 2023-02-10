# Region
region <- Region(name = "nebraska", type = "us state",
                 div = c(country = "United States", state = "Nebraska"))

# Data
data <- persephone::progress_ne

# Dataset
dts <- list(region = list(region), data = data)
