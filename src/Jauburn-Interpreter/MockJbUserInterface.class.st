"
A mock user interface for testing JbInterpreter.
"
Class {
	#name : #MockJbUserInterface,
	#superclass : #Object,
	#category : #'Jauburn-Interpreter'
}

{ #category : #initialization }
MockJbUserInterface >> initialize [ 

super initialize.

^self
]

{ #category : #accessing }
MockJbUserInterface >> input: querystring [

^UIManager default request: querystring


]
