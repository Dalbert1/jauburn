"
A class for the JBWhileLoop node.
"
Class {
	#name : #JbWhileLoopNode,
	#superclass : #Object,
	#instVars : [
		'condition',
		'trueStatements'
	],
	#category : #'Jauburn-AST'
}

{ #category : #accessing }
JbWhileLoopNode >> condition [
	^ condition
]

{ #category : #accessing }
JbWhileLoopNode >> condition: anObject [
	condition := anObject
]

{ #category : #api }
JbWhileLoopNode >> executeIn: anEnvironment [

[condition evaluateIn: anEnvironment] whileTrue: [trueStatements do:[ :each | each executeIn: anEnvironment]]
]

{ #category : #accessing }
JbWhileLoopNode >> trueStatements [
	^ trueStatements
]

{ #category : #accessing }
JbWhileLoopNode >> trueStatements: anObject [
	trueStatements := anObject
]
