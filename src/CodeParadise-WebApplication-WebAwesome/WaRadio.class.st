Class {
	#name : 'WaRadio',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'properties' }
WaRadio >> appearance [

	^ self propertyAt: #appearance
]

{ #category : 'properties' }
WaRadio >> appearance: anObject [

	self propertyAt: #appearance put: anObject
]

{ #category : 'properties' }
WaRadio >> appearanceBeButton [

	self appearance: #button
]

{ #category : 'properties' }
WaRadio >> appearanceBeDefault [

	self appearance: #default
]

{ #category : 'properties' }
WaRadio >> disabled [

	^ self propertyAt: #disabled
]

{ #category : 'properties' }
WaRadio >> disabled: aBoolean [

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'properties' }
WaRadio >> disabledBeOff [

	self disabled: false
]

{ #category : 'properties' }
WaRadio >> disabledBeOn [

	self disabled: true
]

{ #category : 'properties' }
WaRadio >> disabledIsOff [

	^ (self propertyAt: #disabled) not
]

{ #category : 'properties' }
WaRadio >> disabledIsOn [

	^ self propertyAt: #disabled
]

{ #category : 'properties' }
WaRadio >> form [

	^ self propertyAt: #form
]

{ #category : 'properties' }
WaRadio >> form: anObject [

	self propertyAt: #form put: anObject
]

{ #category : 'slots' }
WaRadio >> label [

	^ self firstChildAtSlotNamed: nil
]

{ #category : 'slots' }
WaRadio >> label: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]

{ #category : 'properties' }
WaRadio >> size [

	^ self propertyAt: #size
]

{ #category : 'properties' }
WaRadio >> size: anObject [

	self propertyAt: #size put: anObject
]

{ #category : 'properties' }
WaRadio >> sizeBeLarge [

	self size: #large
]

{ #category : 'properties' }
WaRadio >> sizeBeMedium [

	self size: #medium
]

{ #category : 'properties' }
WaRadio >> sizeBeSmall [

	self size: #small
]

{ #category : 'properties' }
WaRadio >> value [

	^ self propertyAt: #value
]

{ #category : 'properties' }
WaRadio >> value: anObject [

	self propertyAt: #value put: anObject
]
