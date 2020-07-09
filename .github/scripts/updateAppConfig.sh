token=$(az account get-access-token --resource=https://management.azure.com | jq -r .accessToken)
configInput=$(cat ./templates/.github/scripts/$1)
echo ">> $1"
echo ">> $2"
echo ">> $configInput"
curl -X PATCH -H "Authorization: Bearer $token" -H "Content-type: application/json" https://management.azure.com/$2?api-version=2019-08-01 --data "$configInput"
