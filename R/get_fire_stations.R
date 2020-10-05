library(jsonlite)

# Get full records
records <- fromJSON("https://data.okc.gov/services/portal/api/map/layers/Fire%20Stations?mapScale=9&minLatitude=34.85119335222885&maxLatitude=36.14360815319074&minLongitude=-98.13308715820312&maxLongitude=-96.86691284179688&_=1601903737969")

# Extract features
features_df <- as.data.frame(records$Features)

# Save file
saveRDS(features_df, file = "data/fire_stations.rds")
