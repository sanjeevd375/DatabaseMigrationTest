node {
    def PROJECT_PATH = 'C:\\Users\\Sanjeev.Das\\DatabaseMigrationTest'
    def TEST_PROJECT_PATH = 'C:\\Users\\Sanjeev.Das\\VoiceOfTheDBA.Tests'
 
    def BUILD_ARTIFACT_PACKAGE_ID = 'CLCPackage'
    def BUILD_ARTIFACT_PACKAGE_VERSION = "1.0.${env.BUILD_NUMBER}"
    def BUILD_ARTIFACT_FILE = "${BUILD_ARTIFACT_PACKAGE_ID}.${BUILD_ARTIFACT_PACKAGE_VERSION}.nupkg"
 
    def INTEGRATION_INSTANCE = 'localhost\\SQLEXPRESS'
    def INTEGRATION_DATABASE = 'Integration'
 
    def ACCEPTANCE_INSTANCE = 'localhost\\SQLEXPRESS'
    def ACCEPTANCE_DATABASE = 'Acceptance'
 
    def PRODUCTION_INSTANCE = 'localhost\\SQLEXPRESS'
    def PRODUCTION_DATABASE = 'Production'
 
    def RELEASE_ARTIFACT_PATH = 'Release'
    
    def username = 'Sanjeev.Das'
    def password = 'scorpio@123'
    
    def jobName = currentBuild.fullDisplayName
    def mailToRecepients = 'sanjeevd375@gmail.com'
    def useremail = 'sanjeevdas.bokaro@gmail.com'
 
    stage ('Build') {
 	checkout scm       
 
        powershell(label: 'Database build', script: """
            \$ErrorActionPreference = "Stop"
 
            \$validatedProject = Invoke-DatabaseBuild -InputObject ${PROJECT_PATH}
            \$buildArtifact = New-DatabaseBuildArtifact -InputObject \$validatedProject -PackageId ${BUILD_ARTIFACT_PACKAGE_ID} -PackageVersion ${BUILD_ARTIFACT_PACKAGE_VERSION}
            Export-DatabaseBuildArtifact -InputObject \$buildArtifact -Path .
        """)
 
        archiveArtifacts label: 'Archive build artifact', artifacts: "${BUILD_ARTIFACT_FILE}"
    }
 
    stage ('Deploy to integration') {
        powershell(label: 'Deploy to integration', script: """
            \$ErrorActionPreference = "Stop"
 
            \$buildArtifact = Import-DatabaseBuildArtifact -Path ${BUILD_ARTIFACT_FILE}
            \$integrationDatabaseConnection = New-DatabaseConnection -ServerInstance ${INTEGRATION_INSTANCE} -Database ${INTEGRATION_DATABASE} -Username $username -Password $password
            \$releaseArtifact = New-DatabaseReleaseArtifact -Source \$buildArtifact -Target \$integrationDatabaseConnection
            Use-DatabaseReleaseArtifact -InputObject \$releaseArtifact -DeployTo \$integrationDatabaseConnection
        """)
    }
    
    stage ('Deploy to acceptance') {
        powershell(label: 'Create release artifact', script: """
            \$ErrorActionPreference = "Stop"
 
            \$buildArtifact = Import-DatabaseBuildArtifact -Path ${BUILD_ARTIFACT_FILE}
            \$acceptanceDatabaseConnection = New-DatabaseConnection -ServerInstance ${ACCEPTANCE_INSTANCE} -Database ${ACCEPTANCE_DATABASE} -Username $username -Password $password
            \$releaseArtifact = New-DatabaseReleaseArtifact -Source \$buildArtifact -Target \$acceptanceDatabaseConnection
            Export-DatabaseReleaseArtifact -InputObject \$releaseArtifact -Path "${RELEASE_ARTIFACT_PATH}${env.BUILD_NUMBER}"
        """)
 
        powershell(label: 'Deploy to acceptance', script: """
            \$ErrorActionPreference = "Stop"
 
            \$releaseArtifact = Import-DatabaseReleaseArtifact -Path "${RELEASE_ARTIFACT_PATH}${env.BUILD_NUMBER}"
            \$acceptanceDatabaseConnection = New-DatabaseConnection -ServerInstance ${ACCEPTANCE_INSTANCE} -Database ${ACCEPTANCE_DATABASE} -Username $username -Password $password
            Use-DatabaseReleaseArtifact -InputObject \$releaseArtifact -DeployTo \$acceptanceDatabaseConnection
        """)
 
    }
 
    stage ('Email Approval') {
        def userAborted = false
        
        emailext body: '''
        Please go to console output of ${BUILD_URL} input to approve or reject.<br>
        ''',
        mimeType: 'text/html',
        subject: "Waiting for your Approval! Job: '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
        from: "${useremail}",
        to: "${mailToRecepients}",
        recipientProviders: [[$class: 'CulpritsRecipientProvider']]
        
        try{
            userInput = input submitter: 'vagrant', message: 'Do you approve?'
        } catch( org.jenkinsci.plugins.workflow.steps.FlowInterruptedException e) {
            cause = e.causes.get(0)
            echo "Aborted by " + cause.getUser().toString()
            userAborted = true
            echo "Build Aborted"
        }
        if (userAborted) {
            currentBuild.result = 'ABORTED'
        } else {
            echo "Proceeding forward for Production deployemt ..."
        }
    }
 
    stage ('Deploy to production') {
        powershell(label: 'Deploy to production', script: """
            \$ErrorActionPreference = "Stop"
 
            \$releaseArtifact = Import-DatabaseReleaseArtifact -Path "${RELEASE_ARTIFACT_PATH}${env.BUILD_NUMBER}"
            \$productionDatabaseConnection = New-DatabaseConnection -ServerInstance ${PRODUCTION_INSTANCE} -Database ${PRODUCTION_DATABASE} -Username $username -Password $password
            Use-DatabaseReleaseArtifact -InputObject \$releaseArtifact -DeployTo \$productionDatabaseConnection
        """)
    }
}