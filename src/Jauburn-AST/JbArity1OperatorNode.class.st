"
A Node for Arity1 operations.
"
Class {
	#name : #JbArity1OperatorNode,
	#superclass : #Object,
	#instVars : [
		'operator',
		'operand'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbArity1OperatorNode >> evaluateIn: environment [

	| evaldOp |
	evaldOp := self operand evaluateIn: environment.
	
	^ ( evaldOp negated ).
]

{ #category : #accessing }
JbArity1OperatorNode >> operand [
	^ operand
]

{ #category : #accessing }
JbArity1OperatorNode >> operand: anObject [
	operand := anObject
]

{ #category : #accessing }
JbArity1OperatorNode >> operator [
	^ operator
]

{ #category : #accessing }
JbArity1OperatorNode >> operator: anObject [
	operator := anObject
]
