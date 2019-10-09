"
A mock user interface for testing JbInterpreter.
"
Class {
	#name : #MockJbUserInterface,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #'Jauburn-Interpreter'
}

{ #category : #accessing }
MockJbUserInterface >> contents [
	^ contents
]

{ #category : #accessing }
MockJbUserInterface >> contents: anObject [
	contents := anObject
]

{ #category : #initialization }
MockJbUserInterface >> initialize [ 

super initialize.

^self
]

{ #category : #accessing }
MockJbUserInterface >> input: querystring [

^contents


]
