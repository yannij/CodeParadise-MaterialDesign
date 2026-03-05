Class {
	#name : 'WaTab',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'properties' }
WaTab >> disabled [

	^ self propertyAt: #disabled
]

{ #category : 'properties' }
WaTab >> disabled: aBoolean [

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'properties' }
WaTab >> disabledBeOff [

	self disabled: false
]

{ #category : 'properties' }
WaTab >> disabledBeOn [

	self disabled: true
]

{ #category : 'properties' }
WaTab >> disabledIsOff [

	^ (self propertyAt: #disabled) not
]

{ #category : 'properties' }
WaTab >> disabledIsOn [

	^ self propertyAt: #disabled
]

{ #category : 'properties' }
WaTab >> panel [

	^ self propertyAt: #panel
]

{ #category : 'properties' }
WaTab >> panel: anObject [

	self propertyAt: #panel put: anObject
]
