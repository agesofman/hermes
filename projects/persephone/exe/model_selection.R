#-------------------------------------------------------------------------------
# Model Selection
# Created by: Ioannis Oikonomidis
#-------------------------------------------------------------------------------

# Create the object
prm <- "MixedBin"
dts <- "complete"
files <- PersephoneFiles(prm = prm, dts = dts)
object <- create(files)

# Fit
object <- fit(object)

# Contrast models
list_rank <- contrast(object, save = FALSE, path = get_path_hermes())

# Summary
summary(object)

# Plot
persephone::plot(object[[4]], cumulative = TRUE, seasons = 2021, save = FALSE,
                 dir = agesofman::get_path_hermes(), file = "crop_progress.pdf", height = 9)

# Calculate metrics
object <- crossval(object)
plot_metrics(object)

# Create reports
report(object, path = agesofman::get_path_hermes())



# Create the object
prm <- "MixedBin"
dts <- "complete"
files <- PersephoneFiles(prm = prm, dts = dts)
object <- create(files)
for (i in 1:5) {
  object[[i]] <- crossval(object[[i]], maxsam = 50)
  print(object[[i]]@metrics$armspe)
}
