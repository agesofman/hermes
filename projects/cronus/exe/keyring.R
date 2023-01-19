#-------------------------------------------------------------------------------
# Keyring Management
# Created by: Ioannis Oikonomidis
#-------------------------------------------------------------------------------

ringname <- "my_ringname"
password <- "my_password"

create_keyring(ringname, password)

log_in(ringname, password)

add_key(ringname = ringname,
        provider = "nass",
        username = NULL,
        password = "password")

add_key(ringname = ringname,
        provider = "usgs",
        username = "username",
        password = "password")

add_key(ringname = ringname,
        provider = "earthdata",
        username = "username",
        password = "password")

add_key(ringname = ringname,
        provider = "scihub",
        username = "username",
        password = "password")

log_out(ringname)
