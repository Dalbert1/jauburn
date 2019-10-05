"
A mock transcript for the JbInterpreter tests.
"
Class {
	#name : #JbTranscript,
	#superclass : #Object,
	#instVars : [
		'writeStream'
	],
	#category : #'Jauburn-Interpreter'
}

{ #category : #accessing }
JbTranscript >> contents [ 

^writeStream contents
]

{ #category : #'stop conditions' }
JbTranscript >> cr [
	^ writeStream cr.
]

{ #category : #initialization }
JbTranscript >> initialize [ 

super initialize.

writeStream := WriteStream on: String new.

^self
]

{ #category : #streaming }
JbTranscript >> show: anObject [

writeStream nextPutAll: anObject.
]
