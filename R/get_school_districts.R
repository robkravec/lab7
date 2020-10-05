library(jsonlite)

# Get full records
records <- fromJSON("https://data.okc.gov/services/portal/api/map/layers/School%20District%20Boundaries?mapScale=9&minLatitude=34.941302026489964&maxLatitude=36.054838874406286&minLongitude=-98.44757080078125&maxLongitude=-96.55242919921875&_=1601902316177")

# Extract features
features_df <- as.data.frame(records$Features)

# Save file
saveRDS(features_df, file = "data/school_district_boundaries.rds")
