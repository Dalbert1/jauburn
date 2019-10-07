"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestJauburnInterpreter,
	#superclass : #PackageManifest,
	#category : #'Jauburn-Interpreter-Manifest'
}

{ #category : #'code-critics' }
ManifestJauburnInterpreter class >> ruleRBCodeCruftLeftInMethodsRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#JbInterpreter)) #'2019-10-04T19:28:28.732158-05:00') )
]

{ #category : #'code-critics' }
ManifestJauburnInterpreter class >> ruleRBCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#JbInterpreter #initializeEnvBindings #false)) #'2019-10-04T19:26:14.686384-05:00') )
]

{ #category : #'code-critics' }
ManifestJauburnInterpreter class >> ruleRBRefersToClassRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#JbInterpreter #initialize #false)) #'2019-10-04T20:11:15.266091-05:00') )
]

{ #category : #'code-critics' }
ManifestJauburnInterpreter class >> ruleRBSendsUnknownMessageToGlobalRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#JbInterpreter)) #'2019-10-04T20:11:13.131052-05:00') )
]
