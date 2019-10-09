"
Just a place to house a few sample programs
"
Class {
	#name : #JbSamplePrograms,
	#superclass : #Object,
	#category : #'Jauburn-Interpreter-SamplePrograms'
}

{ #category : #'as yet unclassified' }
JbSamplePrograms class >> GCD [

^
'var test = println("hello world");
var euclid = function(a, b) {return mod(a, b);};
var input1 = 100;
var input2 = 3;
var q = euclid(input1, input2);

var program = if(q == 0) {var done = println(q);} 
else {var x = euclid(input2, mod(input1, input2));};

var test2 = println(q);'
]

{ #category : #'as yet unclassified' }
JbSamplePrograms class >> SquareRootProgram [
		"self run: #SquareRootProgram"
^ 
'var x0 = 1;
var inputFunc = function(newInput) {return input("Enter a number for sq root calculation: ");};
var printFunc = function(newPrintVal) {return print(newPrintVal);};
var testInput = print(inputFunc(5));
var testPrint = printFunc(x0);
var f = function(x) {return x * x - 2;};
var fprime = function(x) {return 2 * x;};
var epsilon = 1/10000000000000;
var tolerance = 1/1000;
var maxCount = 100;
var loopCondition = false;
var checkCondition = false;

while(loopCondition == checkCondition) {

var y = f(x0);
yPrime = fprime(x0);
var absoluteY = abs(yPrime);

if(absoluteY < epsilon) {var v = print("Error"); loopCondition = true;}

var x1 = y / yPrime + x0;
var absoluteNewtonCalc = abs(x1 - x0);
var printApproxStep = println(absoluteNewtonCalc);

if(absoluteNewtonCalc <= tolerance) {var finalItr = println("Solution: "); loopCondition = true;}

x0 = x1;
if(maxCount < 1) {var finalItr = println("Final Iteration"); loopCondition = true;}
maxCount = maxCount - 1;}
var final = println(x0);'

"
var epsilon = 1/10000000000000;
var tolerance = 1/1000000;
var testPrint = print(x0);x
if(absoluteY < epsilon) {var printQuit = print(quit);};
if(absolute <= tolerance) {var printLast = print(done);};
var testInput = print(inputFunc(5));
"
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
