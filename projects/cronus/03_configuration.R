#-------------------------------------------------------------------------------
# Configuration
# Created by: Ioannis Oikonomidis
#-------------------------------------------------------------------------------

# Notes:
# 1. It is assumed that the user has an appropriate keyring and is logged-in.
#    Check the keyring.R script for an example.
# 2. It is assumed that the user has set the path_demeter and path_hermes
#    environment variables. Check the path.R script for an example.
# Consult the documentation for more information.

# Region
region <- Region(name = "nebraska",
                 type = "us state",
                 div = c(country = "United States",
                         state = "Nebraska"))

# Date
date <- date_seq("2002-01-01", "2021-12-31")
