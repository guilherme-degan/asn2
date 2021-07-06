library(plumber)

p <- plumb("endpoints.R")

p$run(port = 8080, host = "0.0.0.0")

