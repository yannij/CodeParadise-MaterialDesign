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

	self crTrace: aString
]

{ #category : 'logging' }
SlmdLog class >> logError: aString [

	self log: '[Error] ', aString
]

{ #category : 'logging' }
SlmdLog class >> logTrace5: aString [

	self logTrace: aString aspect: nil level: 5
]

{ #category : 'logging' }
SlmdLog class >> logTrace5: aString method: methodName [

	self logTrace: aString aspect: self class name, '>>', methodName level: 5
]

{ #category : 'logging' }
SlmdLog class >> logTrace: aString [

	self logTrace: aString aspect: nil
]

{ #category : 'logging' }
SlmdLog class >> logTrace: aString aspect: aspect [

	self logTrace: aString aspect: aspect level: 3
]

{ #category : 'logging' }
SlmdLog class >> logTrace: aString aspect: aspect level: level [

	self traceLevel < level ifTrue: [
		^ self ].

	aspect
		ifNil: [ self log: aString ]
		ifNotNil: [ self log: '[', aspect, '] ', aString ]
]

{ #category : 'logging' }
SlmdLog class >> logTrace: aString method: methodName [

	self logTrace: aString aspect: self class name, '>>', methodName
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
