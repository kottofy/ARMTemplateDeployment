pipeline {
  agent any

      parameters {
        string(name: 'STORAGE_KEY', defaultValue: 'STORAGE_KEY', description: 'STORAGE KEY')
      }

  stages {
   
    stage('login') {
      steps {
        withCredentials(bindings: [azureServicePrincipal('Kristins Azure ARMTemplatePractice')]) {
          sh '''
            az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID
            az account set -s $AZURE_SUBSCRIPTION_ID
          '''
        }
      }
    }

    stage('deploy') {
      steps {
        // echo "${params.STORAGE_KEY} !"

        
          chmod +x "${WORKSPACE}/ADFARMscript.sh"
          "${WORKSPACE}/ADFARMscript.sh ${params.STORAGE_KEY}"
      
      }
    }

  }
}
