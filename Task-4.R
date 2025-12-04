###########################################################
# SAMPLE TRAFFIC ACCIDENT ANALYSIS CODE (NO REAL DATA NEEDED)
###########################################################

# Sample Dataset Creation
accidents <- data.frame(
  Hour = sample(0:23, 500, replace = TRUE),
  Weather = sample(c("Clear", "Fog", "Rain", "Snow", "Cloudy"), 500, replace = TRUE),
  Road = sample(c("Dry", "Wet", "Snowy", "Icy"), 500, replace = TRUE),
  Severity = sample(1:4, 500, replace = TRUE),
  Lat = runif(500, 30.0, 50.0),     # random latitude
  Lon = runif(500, -120, -70)      # random longitude
)
# View dataset
print(accidents)
summary(accidents)

head(accidents)
library(ggplot2)
ggplot(accidents, aes(Hour)) +
  geom_histogram(binwidth = 1, fill="orange",color="black") +
  labs(title="Sample Plot: Accidents by Hour",
       x="Hour of Day", y="Frequency") +
  theme_minimal()
ggplot(accidents, aes(Weather)) +
  geom_bar(fill="tomato") +
  labs(title="Sample Plot: Weather Impact on Accidents",
       x="Weather Condition", y="Number of Accidents") +
  theme_minimal()
library(viridis)

ggplot(accidents, aes(Road, fill=as.factor(Severity))) +
  geom_bar(position="dodge") +
  scale_fill_viridis(discrete = TRUE) +
  labs(title="Sample Plot: Road Condition vs Severity",
       x="Road Condition", y="Accident Frequency",
       fill="Severity Level") +
  theme_minimal()
library(leaflet)

leaflet(accidents) %>%
  addTiles() %>%
  addCircleMarkers(lat = ~Lat, lng = ~Lon,
                   radius = 3, color="red", popup="Accident",
                   fillOpacity = 0.5) %>%
  addLegend("bottomright", colors="darkred", labels="Accident Point",
            title="Sample Hotspot Map")
accidents$Month <- sample(month.abb, 500, replace = TRUE)

ggplot(accidents, aes(Month)) +
  geom_bar(fill="purple") +
  labs(title="Sample Monthly Accident Trend",
       x="Month", y="Total Accidents") +
  theme_minimal()
# Add cluster ID to dataset
accidents$Cluster <- as.factor(km$cluster)

# Plot cluster hotspots
ggplot(accidents, aes(Lon, Lat, color = Cluster)) +
  geom_point(size = 2, alpha = 0.7) +
  labs(title="Hotspot Detection Using K-Means Clustering",
       x="Longitude", y="Latitude") +
  theme_minimal()

