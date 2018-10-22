#!/bin/bash

STORAGE_KEY=$1

az group deployment create \
    --resource-group datafactory \
    --template-file ADFARM.json \
    --parameters '{
      "dataFactoryName": {
        "value": "kodatafactory"
      },    
      "dataFactoryLocation": {
        "value": "East US"
      },
      "storageAccountName": {
        "value": "kodatafactorystorage"
      },
      "storageAccountKey": {
          "value": "'$STORAGE_KEY'"
      },
      "blobContainer": {
        "value": "files"
      },
      "inputBlobFolder": {
        "value": "input"
      },
      "inputBlobName": {
        "value": "blob.txt"
      },
      "outputBlobFolder": {
        "value": "output"
      },
      "outputBlobName": {
        "value": "outputblob.txt"
      }
    }'
    