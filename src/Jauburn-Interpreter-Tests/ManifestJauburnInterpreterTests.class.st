"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestJauburnInterpreterTests,
	#superclass : #PackageManifest,
	#category : #'Jauburn-Interpreter-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestJauburnInterpreterTests class >> ruleRBMultiplePeriodsTerminatingStatementRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#JbInterpreterTest #testBooleanExpression #false)) #'2019-10-06T18:33:42.143469-05:00') )
]
