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
	interpreter := JbInterpreter new.

]

{ #category : #tests }
JbInterpreterTest >> testAbsoluteValue [

      self interpret: 'var y = abs(-5);'.
		self assert: (interpreter environment at: 'y') equals: 5.
		
	   self interpret: 'var y = abs(-10000);'.
		self assert: (interpreter environment at: 'y') equals: 10000.
]

{ #category : #tests }
JbInterpreterTest >> testBooleanExpression [

	self interpret: 'var x = true;var z = false;'.
	self assert: (interpreter environment at: 'z') equals: false.
	
	self interpret: 'var x = false;var z = true;'.
	self assert: (interpreter environment at: 'z') equals: true.
	

]

{ #category : #tests }
JbInterpreterTest >> testConcat [

	self interpret: 'var y = concat("abc", "123");'.
	self assert: (interpreter environment at: 'y') equals: 'abc 123'.
]

{ #category : #running }
JbInterpreterTest >> testDeclarationBindsVariableToExpressionValue [
	
	self interpret: 'var x = -86;var y = -x;'.
	self assert: (interpreter environment at: 'y') equals: 86.
	
	self interpret: 'var x = 28;var y = -x;'.
	self assert: (interpreter environment at: 'y') equals: -28.
	
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
	
	self interpret: 'var x = 5; var y = 15 == x;'.
	self assert: (interpreter environment at: 'y') equals: false.
	
	self interpret: 'var x = 5; var y = 5 == x;'.
	self assert: (interpreter environment at: 'y') equals: true.
	
	self interpret: 'var x = 15; var y = 5 != x;'.
	self assert: (interpreter environment at: 'y') equals: true.

	self interpret: 'var x = 5; var y = 5 != x;'.
	self assert: (interpreter environment at: 'y') equals: false.

]

{ #category : #running }
JbInterpreterTest >> testDeclarationCreatesVariable [

	self interpret: 'var x = 99;'.
	self assert: (interpreter environment includesKey: 'x')
]

{ #category : #tests }
JbInterpreterTest >> testFunctionCall [

	self interpret: 'var x = function(a, b, c) {return a * b * c;};y = x(1, 2, 3);'.
	
	self assert: (interpreter environment at: 'y') equals: 6.
]

{ #category : #tests }
JbInterpreterTest >> testFunctionDefinition [

	self interpret: 'var x = function(a, b, c) {};'.
	
	self assert: (interpreter environment at: 'x') parameters size equals: 3.
	
	self assert: (interpreter environment at: 'x') body size equals: 0.
	
	self assert: (interpreter environment at: 'x') environment equals: interpreter environment.
]

{ #category : #tests }
JbInterpreterTest >> testGCD [

	| sample ui |
	ui :=  MockJbUserInterface new.
	interpreter printer: Transcript.
	interpreter uiManager: ui.
	sample := JbSamplePrograms GCD.
	self interpret: sample.
]

{ #category : #tests }
JbInterpreterTest >> testIf [
	
	self interpret: 'var x = 5;if(2 < 5) {x = 20;};'.
	
	self assert: (interpreter environment at: 'x') equals: 20.
]

{ #category : #tests }
JbInterpreterTest >> testIfElse [
	
	self interpret: 'var x = 5;if(2 > 5) {var x = 20;} else {var x = 99;};'.
	self assert: (interpreter environment at: 'x') equals: 99.
	
	self interpret: 'var x = 5;if(2 < 5) {var x = 20;} else {var x = 99;};'.
	self assert: (interpreter environment at: 'x') equals: 20.
]

{ #category : #tests }
JbInterpreterTest >> testInput [
	| ui |
	ui := MockJbUserInterface new.
	interpreter uiManager: ui.
	
	ui contents: '42'.
	self interpret: 'var y = input("Enter 42: ");'.
	self assert: (interpreter environment at: 'y') equals: '42'.
	

]

{ #category : #tests }
JbInterpreterTest >> testLength [

      self interpret: 'var y = length("hello");'.
		self assert: (interpreter environment at: 'y') equals: 5.
	
]

{ #category : #tests }
JbInterpreterTest >> testModulo [

      self interpret: 'var y = mod(4, 2);'.
		self assert: (interpreter environment at: 'y') equals: 0.
		
      self interpret: 'var y = mod(4, 3);'.
		self assert: (interpreter environment at: 'y') equals: 1.
]

{ #category : #tests }
JbInterpreterTest >> testNotBinding [

	self interpret: 'var x = true;var z = not(x);'.
	self assert: (interpreter environment at: 'z') equals: false.
]

{ #category : #tests }
JbInterpreterTest >> testPrint [
	| mt |
	
	mt := JbTranscript new.
	interpreter printer: mt.
	
	self interpret: 'var y = print("hello");'.
	self assert: mt contents equals: 'hello'.
]

{ #category : #tests }
JbInterpreterTest >> testPrintln [

	| mt |
	
	mt := JbTranscript new.
	interpreter printer: mt.
	self interpret: 'var y = println("hello");'.
	self assert: (interpreter environment at: 'y') contents equals: 'hello
'.

	self assert: mt contents equals: 'hello
'.


]

{ #category : #tests }
JbInterpreterTest >> testSquareRoot [

	| sample ui |
	ui :=  MockJbUserInterface new.
	interpreter printer: Transcript.
	interpreter uiManager: ui.
	sample := JbSamplePrograms SquareRootProgram.
	self interpret: sample.
]

{ #category : #tests }
JbInterpreterTest >> testWhile [ 

	self interpret: 'var x = 10;var y = 0;while(x > 0) {y = y + x; x = x - 1;}'.
	self assert: (interpreter environment at: 'y') equals: 55.

	self interpret: 'var y = 0;while(y < 10) {y = y + 1;}'.
	self assert: (interpreter environment at: 'y') equals: 10.
	
	self interpret: 'var y = 100;while(y >= 1) {y = y - 1;}'.
	self assert: (interpreter environment at: 'y') equals: 0.
]
