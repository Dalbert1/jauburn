"
The JbIfElseNode class for our AST.
"
Class {
	#name : #JbIfElseNode,
	#superclass : #JbIfNode,
	#instVars : [
		'falseStatements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #api }
JbIfElseNode >> executeIn: anEnvironment [

(condition evaluateIn: anEnvironment)
	ifTrue: [ ^ trueStatements do: [ :each | each executeIn: anEnvironment ]]
	ifFalse: [ ^ falseStatements do: [ :each | each executeIn: anEnvironment ]]
]

{ #category : #accessing }
JbIfElseNode >> falseStatements [
	^ falseStatements
]

{ #category : #accessing }
JbIfElseNode >> falseStatements: anObject [
	falseStatements := anObject
]
