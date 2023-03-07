#-------------------------------------------------------------------------------
# Model Evaluation
# Created by: Ioannis Oikonomidis
#-------------------------------------------------------------------------------

# Fit
object <- fit(object)

# Summary
summary(object)

# Plot
plot(object, seasons = 2021, save = FALSE, file = "crop_progress.pdf", height = 9)

# Evaluate
object <- evaluate(object)
plot_rmspe(object)

# Create report
report(object)
