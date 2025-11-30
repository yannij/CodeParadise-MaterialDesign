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

	self log: '[Error] ', aString, ' [', (self trimSenderString: thisContext sender printString), ']'
]

{ #category : 'logging' }
SlmdLog class >> logInfo: aString [

	self log: '[Info] ', aString
]

{ #category : 'logging' }
SlmdLog class >> logTrace5: aString [
	"Emit aString to log.

	This code is equivalent to #logTrace:level:, but is coded here
	so that 'thisContext sender' will answer the correct sender
	from the stack for logging."

	self traceLevel < 5 ifTrue: [
		^ self ].

	self log: aString, ' [', (self trimSenderString: thisContext sender printString), ']'
]

{ #category : 'logging' }
SlmdLog class >> logTrace: aString [
	"Emit aString to log.

	This code is equivalent to #logTrace:level:, but is coded here
	so that 'thisContext sender' will answer the correct sender
	from the stack for logging."

	self traceLevel < 3 ifTrue: [
		^ self ].

	self log: aString, ' [', (self trimSenderString: thisContext sender printString), ']'
]

{ #category : 'logging' }
SlmdLog class >> logTrace: aString level: level [
	| methodString |

	self traceLevel < level ifTrue: [
		^ self ].

	methodString := self trimSenderString: thisContext sender printString.
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

{ #category : 'logging' }
SlmdLog class >> trimSenderString: senderString [
	"Answer the sender string with the stack trace trimmed off.
	
	On client side, the sender printString includes the stack trace, so trim it off."
	| index methodString |

	index := senderString indexOf: Character lf.
	index := index = 0 ifTrue: [ senderString size ] ifFalse: [ index - 1 ].
	methodString := senderString copyFrom: 1 to: index.

	^ methodString
]
