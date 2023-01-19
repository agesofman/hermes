#-------------------------------------------------------------------------------
# Configuration
# Created by: Ioannis Oikonomidis
#-------------------------------------------------------------------------------

# Notes:
# 1. It is assumed that the user has an appropriate keyring and is logged-in.
# 2. It is assumed that the user has set the path_demeter environment variable.
# 3. It is assumed that the user has defined variables region and date.
# 4. Sections are separated by dashed lines and can be executed independently
#    of one another.
#
# Consult the documentation for more information.

# Region
region <- Region(name = "nebraska", type = "us state",
                 div = c(country = "United States", state = "Nebraska"))

# Date
date <- date_seq("2002-01-01", "2021-12-31")

# Keyring
#log_in(ringname, password)
