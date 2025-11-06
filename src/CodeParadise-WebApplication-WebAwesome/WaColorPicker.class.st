Class {
	#name : 'WaColorPicker',
	#superclass : 'WaFormControl',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'properties' }
WaColorPicker >> disabled [

	^ self propertyAt: #disabled
]

{ #category : 'properties' }
WaColorPicker >> disabled: aBoolean [

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'properties' }
WaColorPicker >> disabledBeOff [

	self disabled: false
]

{ #category : 'properties' }
WaColorPicker >> disabledBeOn [

	self disabled: true
]

{ #category : 'properties' }
WaColorPicker >> disabledIsOff [

	^ (self propertyAt: #disabled) not
]

{ #category : 'properties' }
WaColorPicker >> disabledIsOn [

	^ self propertyAt: #disabled
]

{ #category : 'slots' }
WaColorPicker >> hint [

	^ self firstChildAtSlotNamed: #hint
]

{ #category : 'slots' }
WaColorPicker >> hint: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #hint
]

{ #category : 'slots' }
WaColorPicker >> label [

	^ self firstChildAtSlotNamed: #label
]

{ #category : 'slots' }
WaColorPicker >> label: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #label
]
