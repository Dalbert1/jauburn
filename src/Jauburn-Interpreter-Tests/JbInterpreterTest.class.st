"
A test class for the JbInterpreter.
"
Class {
	#name : #JbInterpreterTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter',
		'parser'
	],
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #utilities }
JbInterpreterTest >> interpret: aString [

	| ast |
	ast :=  parser parse: aString.
	^interpreter interpret: ast.
	
]

{ #category : #running }
JbInterpreterTest >> setUp [ 

	parser := JbParser new.
	interpreter := JbInterpreter new
]

{ #category : #running }
JbInterpreterTest >> testDeclarationBindsVariableToExpressionValue [

	self interpret: 'var x = 3 + 2 * 8;'.
	self assert: (interpreter environment at: 'x') equals: 19.
	
	self interpret: 'var x = 6;var y = 2*x;'.
	self assert: (interpreter environment at: 'y') equals: 12.
	
	self interpret: 'var x = 2;var y = 2/x;'.
	self assert: (interpreter environment at: 'y') equals: 1.
	
	self interpret: 'var x = 2;var y = 2-x;'.
	self assert: (interpreter environment at: 'y') equals: 0.
	
	self interpret: 'var x = 5; var y = x <= x;'.
	self assert: (interpreter environment at: 'y') equals: true.
	
	self interpret: 'var x = 5; var y = 5 >= x;'.
	self assert: (interpreter environment at: 'y') equals: true.
	
	
	
	self interpret: 'var x = 5; var y = 1 > x;'.
	self assert: (interpreter environment at: 'y') equals: false.
	

	
	self interpret: 'var x = 5; var y = 15 < x;'.
	self assert: (interpreter environment at: 'y') equals: false.
]

{ #category : #running }
JbInterpreterTest >> testDeclarationCreatesVariable [

	self interpret: 'var x = 99;'.
	self assert: (interpreter environment includesKey: 'x')
]
