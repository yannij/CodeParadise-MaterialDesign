Class {
	#name : 'WaTabPanel',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'properties' }
WaTabPanel >> active [

	^ self propertyAt: #active
]

{ #category : 'properties' }
WaTabPanel >> active: aBoolean [

	self propertyAt: #active put: aBoolean
]

{ #category : 'properties' }
WaTabPanel >> activeBeOff [

	self active: false
]

{ #category : 'properties' }
WaTabPanel >> activeBeOn [

	self active: true
]

{ #category : 'properties' }
WaTabPanel >> activeIsOff [

	^ (self propertyAt: #active) not
]

{ #category : 'properties' }
WaTabPanel >> activeIsOn [

	^ self propertyAt: #active
]

{ #category : 'properties' }
WaTabPanel >> name [

	^ self propertyAt: #name
]

{ #category : 'properties' }
WaTabPanel >> name: anObject [

	self propertyAt: #name put: anObject
]
