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
		'printer',
		'uiManager'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #primitives }
JbInterpreter >> absBinding [

^#abs -> [ :v | v abs ]
]

{ #category : #primitives }
JbInterpreter >> concatBinding [

^#concat -> [ :s1 :s2 | (s1 , ' ', s2) ]
]

{ #category : #accessing }
JbInterpreter >> environment [ 

	^environment
]

{ #category : #initialization }
JbInterpreter >> initialize [ 

	super initialize.
	environment := JbEnvironment new.
	(self class selectors select: [ :each | each endsWith: 'Binding' ])
		do: [ :s | 
				| binding |
				binding := self perform: s.
				environment at: binding key put: (JbPrimitive new block: binding value; yourself) ]
]

{ #category : #primitives }
JbInterpreter >> inputBinding [

^#input -> [ :question | uiManager input: question].
]

{ #category : #api }
JbInterpreter >> interpret: ast [

	^ast executeIn: environment 
]

{ #category : #testing }
JbInterpreter >> isNotBinding [
	^ #not -> [ :a | a not ]
]

{ #category : #testing }
JbInterpreter >> isNullBinding [
	^ #isNull -> [ :l | l = #() ]
]

{ #category : #primitives }
JbInterpreter >> lengthBinding [

^ #length -> [ :v | (v size) ]. 
]

{ #category : #primitives }
JbInterpreter >> modBinding [

^#mod -> [ :a :b | a \\ b ]
]

{ #category : #primitives }
JbInterpreter >> notBinding [

^#not -> [ :v | v not ]
]

{ #category : #primitives }
JbInterpreter >> printBinding [
^#print -> [:value | (value isString) 
		ifTrue: [ printer show: value ]
		ifFalse: [ printer show: value printString. ]]
]

{ #category : #accessing }
JbInterpreter >> printer [
	^ printer ifNil: [Transcript]
]

{ #category : #accessing }
JbInterpreter >> printer: aPrinter [
	printer := aPrinter.
]

{ #category : #primitives }
JbInterpreter >> printlnBinding [
^#println -> "[:value | printer show: value printString; cr.]"
		[ :value | (value isString)
		ifTrue: [ printer show: value; cr. ]
		ifFalse: [ printer show: value printString; cr. ]]
]

{ #category : #api }
JbInterpreter >> run: programString [

	| parser |
	parser := JbParser new.
	self interpret: (parser parse: programString)
]

{ #category : #accessing }
JbInterpreter >> uiManager [ 
	^ uiManager ifNil: [UIManager default]
]

{ #category : #accessing }
JbInterpreter >> uiManager: aUIManager [
	uiManager := aUIManager.
]
