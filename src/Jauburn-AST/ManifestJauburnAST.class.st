"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestJauburnAST,
	#superclass : #PackageManifest,
	#category : #'Jauburn-AST-Manifest'
}

{ #category : #'code-critics' }
ManifestJauburnAST class >> ruleRBLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#JbArity2OperatorNode)) #'2019-10-03T20:43:03.652479-05:00') )
]

{ #category : #'code-critics' }
ManifestJauburnAST class >> ruleRBNoClassCommentRuleV1FalsePositive [
	^ #(#(#(#RGPackage #(#'Jauburn-AST')) #'2019-07-26T16:07:56.982481-04:00') )
]
