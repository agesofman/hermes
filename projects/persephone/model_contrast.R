#-------------------------------------------------------------------------------
# Model Contrast
# Created by: Ioannis Oikonomidis
#-------------------------------------------------------------------------------

# Fit
object <- fit(object)

# Evaluate
object <- aicc(object)

# Contrast models
df_contrast <- contrast(object)
df_contrast

plot_contrast(df_contrast, object[[1]])
