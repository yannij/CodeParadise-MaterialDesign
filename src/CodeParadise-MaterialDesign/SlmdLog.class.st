Class {
	#name : 'SlmdLog',
	#superclass : 'Object',
	#classVars : [
		'TraceLevel'
	],
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'logging' }
SlmdLog class >> log: aString [

	self traceCr: aString
]

{ #category : 'logging' }
SlmdLog class >> log: aString level: level [

	self traceLevel < level ifTrue: [
		^ self ].

	self traceCr: aString
]

{ #category : 'logging' }
SlmdLog class >> logError: aString [

	self log: '[Error] ', aString
]

{ #category : 'logging' }
SlmdLog class >> logInfo: aString [

	self log: '[Info] ', aString
]

{ #category : 'logging' }
SlmdLog class >> logTrace: aString [
	| senderString index methodString |

	self traceLevel < 3 ifTrue: [
		^ self ].

	"On client side, the sender printString includes the stack trace, so trim it off."
	senderString := thisContext sender printString.
	index := senderString indexOf: Character lf.
	index := index = 0 ifTrue: [ senderString size ] ifFalse: [ index - 1 ].
	methodString := senderString copyFrom: 1 to: index.

	self log: aString, ' [', methodString, ']'
]

{ #category : 'logging' }
SlmdLog class >> logTrace: aString level: level [
	| senderString index methodString |

	self traceLevel < level ifTrue: [
		^ self ].

	"On client side, the sender printString includes the stack trace, so trim it off."
	senderString := thisContext sender printString.
	index := senderString indexOf: Character lf.
	index := index = 0 ifTrue: [ senderString size ] ifFalse: [ index - 1 ].
	methodString := senderString copyFrom: 1 to: index.

	self log: aString, ' [', methodString, ']'
]

{ #category : 'logging' }
SlmdLog class >> logWarn: aString [

	self log: '[Warn] ', aString
]

{ #category : 'accessing' }
SlmdLog class >> traceLevel [

	^ TraceLevel ifNil: [ TraceLevel := 3 ]
]

{ #category : 'accessing' }
SlmdLog class >> traceLevel: anObject [
	"
	self traceLevel: 5.
	self traceLevel: 4.
	self traceLevel: 3.
	self traceLevel: 2.
	self traceLevel: 1.
	"

	^ TraceLevel := anObject
]
