"
A Node for evaluation of Arity2 arithmetic operations.
"
Class {
	#name : #JbArity2OperatorNode,
	#superclass : #Object,
	#instVars : [
		'operator',
		'lhs',
		'rhs'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbArity2OperatorNode >> lhs [
	^ lhs
]

{ #category : #accessing }
JbArity2OperatorNode >> lhs: anObject [
	lhs := anObject
]

{ #category : #accessing }
JbArity2OperatorNode >> operator [
	^ operator
]

{ #category : #accessing }
JbArity2OperatorNode >> operator: anObject [
	operator := anObject
]

{ #category : #accessing }
JbArity2OperatorNode >> rhs [
	^ rhs
]

{ #category : #accessing }
JbArity2OperatorNode >> rhs: anObject [
	rhs := anObject
]
