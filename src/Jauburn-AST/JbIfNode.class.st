"
The JbIfNode class for our AST.
"
Class {
	#name : #JbIfNode,
	#superclass : #Object,
	#instVars : [
		'condition',
		'trueStatements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbIfNode >> condition [
	^ condition
]

{ #category : #accessing }
JbIfNode >> condition: anObject [
	condition := anObject
]

{ #category : #'as yet unclassified' }
JbIfNode >> executeIn: anEnvironment [

(condition evaluateIn: anEnvironment)
	ifTrue: [ ^ trueStatements do: [ :each | each executeIn: anEnvironment ]]
			"(each isKindOf: JbReturnStatementNode)
 			ifTrue: [ each executeIn: anEnvironment ]
			ifFalse: [ each evaluateIn: anEnvironment]]]."
]

{ #category : #accessing }
JbIfNode >> trueStatements [
	^ trueStatements
]

{ #category : #accessing }
JbIfNode >> trueStatements: anObject [
	trueStatements := anObject
]
