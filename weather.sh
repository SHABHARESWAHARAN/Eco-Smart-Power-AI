#!/bin/bash

cd "/home/$(whoami)/EcoSmart AI Power/data base/"

LOCATION=$(echo -e "$(awk '/location/ {print $3}' $(ls))")
cd "/home/$(whoami)/EcoSmart AI Power/temp"
cat >> "location.txt" << EOF
$LOCATION
EOF

LOCATION="$(awk 'NR==3 {print $1}' location.txt)"

COUNTRY="IN"

cd "/home/$(whoami)/EcoSmart AI Power/data base/"

OPEN_WEATHER=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=$LOCATION&appid=117bc715fa9ed05406bb0393238a8c24" | jq '.sys.country')
echo -e "$(echo "Country: $OPEN_WEATHER")"

OPEN_WEATHER=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=$LOCATION,$COUNTRY&appid=117bc715fa9ed05406bb0393238a8c24" | jq '.name')
echo -e "$(echo "Location: $OPEN_WEATHER")"

OPEN_WEATHER=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=$LOCATION,$COUNTRY&appid=117bc715fa9ed05406bb0393238a8c24" | jq '.main.temp')
echo -e "$(echo "Temperature: $OPEN_WEATHER")"
cat >> "$LOCATION,$COUNTRY.txt" << EOF
$(echo "Temperature: $OPEN_WEATHER")
EOF

OPEN_WEATHER=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=$LOCATION,$COUNTRY&appid=117bc715fa9ed05406bb0393238a8c24" | jq '.main.pressure')
echo -e "$(echo "Pressure: $OPEN_WEATHER")"
cat >> "$LOCATION,$COUNTRY.txt" << EOF
$(echo "Pressure: $OPEN_WEATHER")
EOF

OPEN_WEATHER=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=$LOCATION,$COUNTRY&appid=117bc715fa9ed05406bb0393238a8c24" | jq '.main.humidity')
echo -e "$(echo "Humidity: $OPEN_WEATHER")"
cat >> "$LOCATION,$COUNTRY.txt" << EOF
$(echo "Humidity: $OPEN_WEATHER")
EOF

OPEN_WEATHER=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=$LOCATION,$COUNTRY&appid=117bc715fa9ed05406bb0393238a8c24" | jq '.visibility')
echo -e "$(echo "Visibility: $OPEN_WEATHER")"
cat >> "$LOCATION,$COUNTRY.txt" << EOF
$(echo "Visibility: $OPEN_WEATHER")
EOF

OPEN_WEATHER=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=$LOCATION,$COUNTRY&appid=117bc715fa9ed05406bb0393238a8c24" | jq '.wind.speed')
echo -e "$(echo "Wind speed: $OPEN_WEATHER")"
cat >> "$LOCATION,$COUNTRY.txt" << EOF
$(echo "Wind speed: $OPEN_WEATHER")
EOF


OPEN_WEATHER=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=$LOCATION,$COUNTRY&appid=117bc715fa9ed05406bb0393238a8c24" | jq '.wind.deg')
echo -e "$(echo "Wind direction: $OPEN_WEATHER")"
cat >> "$LOCATION,$COUNTRY.txt" << EOF
$(echo "Wind direction: $OPEN_WEATHER")
EOF

cd "/home/$(whoami)/EcoSmart AI Power/temp"
gio trash "location.txt"

sleep 15
