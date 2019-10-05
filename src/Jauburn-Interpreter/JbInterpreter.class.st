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
		'primitives',
		'transcript',
		'uiManager'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #accesing }
JbInterpreter class >> primitives [

"This code returns the complete list of primitive names."

^ #(#'>=' #* #cdr #cons #/ #car #isNull #+ #not #< #equal #- #str #length #print #println #input #stringtonum)
]

{ #category : #accessing }
JbInterpreter >> environment [ 

	^environment
]

{ #category : #evaluating }
JbInterpreter >> evalFunction: func in: anEnvironment [
	^ JbFunction new
		parameters: func second;
		body: func third;
		environment: anEnvironment
]

{ #category : #initialization }
JbInterpreter >> initialize [ 

	super initialize.
	environment := JbEnvironment new.
	primitives := Set new.
	
	self initializeEnvBindings
]

{ #category : #initialization }
JbInterpreter >> initializeEnvBindings [
	(self class selectors select: [ :each | each endsWith: 'Binding' ])
		do: [ :s | 
				| binding |
				binding := self perform: s.
				primitives add: binding key.
				environment at: binding key put: binding value ]
]

{ #category : #api }
JbInterpreter >> interpret: ast [

	^ast executeIn: environment 
]

{ #category : #printing }
JbInterpreter >> printBinding [
^#print -> [:value | Transcript show: value printString] .
]

{ #category : #enumerating }
JbInterpreter >> printlnBinding [

^#println -> [ :v | self transcript show: (v asPhsycheString); cr].
]

{ #category : #api }
JbInterpreter >> run: programString [

	| parser |
	parser := JbParser new.
	self interpret: (parser parse: programString)
]

{ #category : #primitives }
JbInterpreter >> strBinding [

^#str -> [ :each | each asPhsycheString ]
]

{ #category : #accessing }
JbInterpreter >> transcript [
	^ transcript ifNil: [Transcript]
]

{ #category : #accessing }
JbInterpreter >> transcript: aTranscript [
	transcript := aTranscript
]

{ #category : #accessing }
JbInterpreter >> uiManager [ 
	^ uiManager ifNil: [UIManager default]
]

{ #category : #accessing }
JbInterpreter >> uiManager: aUIManager [
	uiManager := aUIManager.
]
