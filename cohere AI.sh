#!/bin/bash

while :
do
cd "/home/$(whoami)/EcoSmart AI Power/data base/"
if [[ "$(pwd)" == "/home/$(whoami)/EcoSmart AI Power/data base" ]] ; then
API_KEY="J1Iu9bmxTP81kA2anBJ2Un3Jgw5FdjvSqbojt48E"
if [[ "$(ls)" != "" ]] ; then
INPUT_PROMPT="$(echo -e $(cat $(ls))), according to this power plant data & climatic condition which power plant we can operated effeciently for maximum demand of 250MW"
API_URL="https://api.cohere.ai/v1/generate"
JSON_PAYLOAD=$(cat << EOF
{
    "model": "command-xlarge-nightly",
    "prompt": "$INPUT_PROMPT",
    "max_tokens": 300,
    "temperature": 0.75
}
EOF
)
response=$(curl -s \
  -X POST \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d "$JSON_PAYLOAD" \
  $API_URL)
if [[ "$response" != "" ]] ; then
echo -e "Generated Text: $response"
cd "/home/$(whoami)/EcoSmart AI Power/history/"
cat >> "AI Response.txt" << EOF
User: $(whoami)
Date: $(date)

$(whoami): $INPUT_PROMPT
Cohere AI: $response
--------------------------------------------------------

EOF
else
clear
echo "Error code: 003"
sleep 2
clear
fi
else
clear
echo "Error code: 002"
sleep 2
clear
fi
else
clear
echo "Error code: 001"
sleep 2
clear
fi
echo
done
