Class {
	#name : 'SlmdPresenter',
	#superclass : 'CpPresenter',
	#classVars : [
		'TraceLevel'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'accessing' }
SlmdPresenter class >> traceLevel [

	^ TraceLevel ifNil: [ TraceLevel := 3 ]
]

{ #category : 'accessing' }
SlmdPresenter class >> traceLevel: anObject [
	"
	self traceLevel: 5.
	self traceLevel: 4.
	self traceLevel: 3.
	self traceLevel: 2.
	self traceLevel: 1.
	"

	^ TraceLevel := anObject
]

{ #category : 'events' }
SlmdPresenter >> dispatchUserEvent: anObject [
	| type |

	type := anObject parameterAt: #userActionType.
	type ifNil: [ ^ self ].

	type = SlmdUserAction userActionTypeNav
		ifTrue: [ self handleNav: anObject ]
		ifFalse: [ self handleAction: anObject ]
]

{ #category : 'events' }
SlmdPresenter >> doRefresh: anObject [

	self logTrace: self printString, '<==', anObject printString aspect: 'handleRefresh:' level: 3.

	self layout pane1 paneContent valueChanged.
	self layout pane1 valueChanged.

]

{ #category : 'events' }
SlmdPresenter >> handleAction: anObject [

	"self logTrace5: anObject printString method: 'handleAction:'."

]

{ #category : 'events' }
SlmdPresenter >> handleNav: anObject [

	"self logTrace5: anObject printString method: 'handleNav:'"
]

{ #category : 'accessing - model' }
SlmdPresenter >> layout [

	^ self application layout
]

{ #category : 'logging' }
SlmdPresenter >> log: aString [

	self traceCr: aString
]

{ #category : 'logging' }
SlmdPresenter >> logError: aString [

	self log: '[Error] ', aString
]

{ #category : 'logging' }
SlmdPresenter >> logTrace5: aString [

	self logTrace: aString aspect: nil level: 5
]

{ #category : 'logging' }
SlmdPresenter >> logTrace5: aString method: methodName [

	self logTrace: aString aspect: self class name, '>>', methodName level: 5
]

{ #category : 'logging' }
SlmdPresenter >> logTrace: aString [

	self logTrace: aString aspect: nil
]

{ #category : 'logging' }
SlmdPresenter >> logTrace: aString aspect: aspect [

	self logTrace: aString aspect: aspect level: 3
]

{ #category : 'logging' }
SlmdPresenter >> logTrace: aString aspect: aspect level: level [

	self class traceLevel < level ifTrue: [
		^ self ].

	aspect
		ifNil: [ self log: aString ]
		ifNotNil: [ self log: '[', aspect, '] ', aString ]
]

{ #category : 'logging' }
SlmdPresenter >> logTrace: aString method: methodName [

	self logTrace: aString aspect: self class name, '>>', methodName
]

{ #category : 'events' }
SlmdPresenter >> subscribeToActionRequest [

	self view when: SlmdUserEvent actionRequest send: #dispatchUserEvent: to: self
]

{ #category : 'view' }
SlmdPresenter >> viewCreated [

	self view logTraceMethod: 'viewCreated'.
	super viewCreated
]

{ #category : 'view' }
SlmdPresenter >> viewInitialized [

	self view logTraceMethod: 'viewInitialized'.
	super viewInitialized
]
