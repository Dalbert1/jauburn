"
Just a place to house a few sample programs
"
Class {
	#name : #JbSamplePrograms,
	#superclass : #Object,
	#category : #'Jauburn-Interpreter-SamplePrograms'
}

{ #category : #'as yet unclassified' }
JbSamplePrograms class >> SquareRootProgram [
		"self run: #SquareRootProgram"
^ 
'var x0 = 1;
var inputFunc = function(newInput) {return input("Enter a number for sq root calculation: ");};
var printFunc = function(newPrintVal) {return print(newPrintVal);};

var f = function(x) {return x * x - 2;};
var fprime = function(x) {return 2 * x;};

var epsilon = 1/1000000000000;
var tolerance = 1/1000000;
var new = print(x0);
var maxCount = 10000;
while(maxCount > 0) {maxCount = maxCount - 1; 
var y = f(x0);

var yPrime = fprime(x0);
var absoluteY = abs(yPrime);
if(absoluteY < epsilon) { var printQuit = print("quit");};

var x1 = y / yPrime + x0;
var absolute = abs(x1 - x0);

if(absolute <= tolerance) { var printLast = print("done") ;};

x0 = x1;};'

"

var testInput = print(inputFunc(5));
var testPrint = printFunc(x0);"
]

{ #category : #'sample programs' }
JbSamplePrograms class >> noFunctions [
	"self run: #noFunctions"

	^'var x = 1;
var y = 10 * x - 1;
if (y == 9) { 
   x = 16;
}
'
]

{ #category : #utilities }
JbSamplePrograms class >> run: method [
	"Look at sample programs for examples of using this method."

	^JbInterpreter new run: (self perform: method)
]
