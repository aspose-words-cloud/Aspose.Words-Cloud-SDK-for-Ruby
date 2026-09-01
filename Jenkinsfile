properties([
	gitLabConnection('gitlab'),
	[$class: 'ParametersDefinitionProperty', 
		parameterDefinitions: [
			[$class: 'StringParameterDefinition', name: 'branch', defaultValue: 'master', description: 'the branch to build'],
			[$class: 'StringParameterDefinition', name: 'apiUrl', defaultValue: 'https://api-qa.aspose.cloud', description: 'api url'],
			[$class: 'BooleanParameterDefinition', name: 'debugMode', defaultValue: 'false', description: 'debug mode'],
            [$class: 'BooleanParameterDefinition', name: 'ignoreCiSkip', defaultValue: false, description: 'ignore CI Skip'],
            [$class: 'StringParameterDefinition', name: 'credentialsId', defaultValue: '6839cbe8-39fa-40c0-86ce-90706f0bae5d', description: 'credentials id'],
            [$class: 'BooleanParameterDefinition', name: 'packageTesting', defaultValue: false, description: 'Testing package from repository without local sources. Used for prodhealthcheck'],
		]
	]
])

def runtests(dockerImageVersion)
{
    def needToBuild = false

    dir(dockerImageVersion){
        try {
            stage('checkout'){
				checkout([$class: 'GitSCM', branches: [[name: params.branch]], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'LocalBranch', localBranch: "**"]], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '361885ba-9425-4230-950e-0af201d90547', url: 'https://git.auckland.dynabic.com/words-cloud/words-cloud-ruby.git']]])
                
                sh 'git show -s HEAD > gitMessage'
                def commitMessage = readFile('gitMessage').trim()
                echo commitMessage
                needToBuild = params.ignoreCiSkip || !commitMessage.contains('[ci skip]')               
                sh 'git clean -fdx'
                
                if (needToBuild) {
                    withCredentials([usernamePassword(credentialsId: params.credentialsId, passwordVariable: 'ClientSecret', usernameVariable: 'ClientId')]) {
                        sh 'mkdir -p Settings'
                        sh 'echo "{\\"ClientId\\": \\"$ClientId\\",\\"ClientSecret\\": \\"$ClientSecret\\", \\"BaseUrl\\": \\"$apiUrl\\", \\"Debug\\" : $debugMode}" > Settings/servercreds.json'
                    }
                }
            }
            
            if (needToBuild) {
                // Root is needed so gem/bundler can write to the image's own gem dir, but it leaves
                // root-owned files in the mounted workspace that cleanWs() cannot delete. Capture the
                // agent's ids here and hand ownership back before leaving the container.
                def agentUid = sh(script: 'id -u', returnStdout: true).trim()
                def agentGid = sh(script: 'id -g', returnStdout: true).trim()
                docker.image('ruby:' + dockerImageVersion).inside('-u root'){
                    try {
                if (params.packageTesting) {
                            sh "mv GemfileTest Gemfile"
                    }
                    stage('build'){
                            sh "mkdir testReports"
                            sh "gem install bundler -v 2.0.2 && bundle install"
                    }
                
                    stage('tests'){   
                        try{
                            sh 'rake test'
                        } finally{
                            junit 'testReports/report/*.xml'
                        }
                    }
                
                    stage('bdd-tests'){
                        
                    }
                    
                    stage('clean-compiled'){
                        sh "rm -rf %s"
                    }
                    } finally {
                        sh "chown -R ${agentUid}:${agentGid} ."
                    }
                }   
            }
        } finally {
			cleanWs()
        }
    }
}

node('words-linux') {        	
	stage('oldruby'){
		try {
			runtests("3.1") 
		} finally {
			cleanWs()
		}
 	}
	
	stage('newruby'){
		try {
			runtests("3.4") 
		} finally {
			cleanWs()
		}
 	}
}