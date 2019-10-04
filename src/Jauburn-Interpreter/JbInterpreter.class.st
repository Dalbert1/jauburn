"
I am an interpreter for programs written in the Jauburn language.  My principle API methods are:

	interpret: anAST -- given an abstract syntax tree, interpret it
	run: aString -- parse and interpret the supplied string
"
Class {
	#name : #JbInterpreter,
	#superclass : #Object,
	#instVars : [
		'environment',
		'primitives'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #accessing }
JbInterpreter >> environment [ 

	^environment
]

{ #category : #evaluating }
JbInterpreter >> evalFunction: func in: anEnvironment [
	^ PFunction new
		parameters: func second;
		body: func third;
		environment: anEnvironment
]

{ #category : #initialization }
JbInterpreter >> initialize [ 

	super initialize.
	environment := JbEnvironment new.
]

{ #category : #api }
JbInterpreter >> interpret: ast [

	^ast executeIn: environment 
]

{ #category : #printing }
JbInterpreter >> printBinding [
^#print --> [:value | Transcript show: value printString] .
]

{ #category : #api }
JbInterpreter >> run: programString [

	| parser |
	parser := JbParser new.
	self interpret: (parser parse: programString)
]
