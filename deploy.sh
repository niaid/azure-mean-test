export AZ_ACR_USERNAME='jjestertestmean'
echo $AZ_ACR_USERNAME

export AZ_ACR_PASSWORD=$(az acr credential show --resource-group jjester-test-mean --name jjestertestmean | jq -r '.passwords[0].value')
echo $AZ_ACR_PASSWORD

docker login jjestertestmean.azurecr.io --username $AZ_ACR_USERNAME --password $AZ_ACR_PASSWORD
docker build -t jjestertestmean.azurecr.io/mean-test .

docker push jjestertestmean.azurecr.io/mean-test:latest

az acr repository list -n jjestertestmean

az webapp restart --name mean-test --resource-group jjester-test-mean