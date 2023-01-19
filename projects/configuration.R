#-------------------------------------------------------------------------------
# Configuration
# Created by: Ioannis Oikonomidis
#-------------------------------------------------------------------------------

# Load agesofman
library(agesofman)

# Choose the default database directory

## Headquartes
path_parent <- file.path("D:", "Εθνικό & Καποδιστριακό Πανεπιστήμιο Αθηνών")
path_demeter <- file.path(path_parent, "Ages of Man - Demeter")
path_hermes <- file.path(path_parent, "Ages of Man - Documents", "hermes")

## Lavacron
path_parent <- file.path("C:", "Users", "John", "National and Kapodistrian University of Athens")
path_demeter <- file.path(path_parent, "Ages of Man - Demeter")
path_hermes <- file.path(path_parent, "Ages of Man - Documents", "hermes")

# Set the default startup behavior
set_agesofman(path_demeter, path_hermes, level = "user")

# Check the files
usethis::edit_r_environ("user")
usethis::edit_r_environ("project")
