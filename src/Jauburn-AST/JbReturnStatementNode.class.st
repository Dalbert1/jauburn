"
The JbReturnStatementNode class for the AST.
"
Class {
	#name : #JbReturnStatementNode,
	#superclass : #Object,
	#instVars : [
		'expression'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #api }
JbReturnStatementNode >> executeIn: environment [

| newVar |

newVar := expression evaluateIn: environment.

^newVar

]

{ #category : #accessing }
JbReturnStatementNode >> expression [
	^ expression
]

{ #category : #accessing }
JbReturnStatementNode >> expression: anObject [
	expression := anObject
]
