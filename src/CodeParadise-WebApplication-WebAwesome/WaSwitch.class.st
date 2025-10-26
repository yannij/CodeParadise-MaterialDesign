Class {
	#name : 'WaSwitch',
	#superclass : 'WaFormControl',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'instance creation' }
WaSwitch class >> label: object1 [ 

	^ self new 
		label: object1;
		yourself
]

{ #category : 'properties' }
WaSwitch >> checked [

	^ (self attributeAt: #checked) notNil
]

{ #category : 'properties' }
WaSwitch >> checked: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #checked ]
		ifFalse: [ self removeAttributeAt: #checked ]
]

{ #category : 'properties' }
WaSwitch >> checkedBeOff [

	self checked: false
]

{ #category : 'properties' }
WaSwitch >> checkedBeOn [

	self checked: true
]

{ #category : 'properties' }
WaSwitch >> checkedIsOff [

	^ (self propertyAt: #checked) not
]

{ #category : 'properties' }
WaSwitch >> checkedIsOn [

	^ self propertyAt: #checked
]

{ #category : 'properties' }
WaSwitch >> disabled [

	^ (self attributeAt: #disabled) notNil
]

{ #category : 'properties' }
WaSwitch >> disabled: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #disabled ]
		ifFalse: [ self removeAttributeAt: #disabled ]
]

{ #category : 'properties' }
WaSwitch >> disabledBeOff [

	self disabled: false
]

{ #category : 'properties' }
WaSwitch >> disabledBeOn [

	self disabled: true
]

{ #category : 'properties' }
WaSwitch >> disabledIsOff [

	^ (self propertyAt: #disabled) not
]

{ #category : 'properties' }
WaSwitch >> disabledIsOn [

	^ self propertyAt: #disabled
]

{ #category : 'css custom properties' }
WaSwitch >> height [

	^ self customPropertyAt: #height
]

{ #category : 'css custom properties' }
WaSwitch >> height: aString [

	self customPropertyAt: #height put: aString
]

{ #category : 'properties' }
WaSwitch >> hint [

	^ self propertyAt: #hint
]

{ #category : 'properties' }
WaSwitch >> hint: anObject [

	self propertyAt: #hint put: anObject
]

{ #category : 'slots' }
WaSwitch >> label [

	^ self firstChildAtSlotNamed: nil
]

{ #category : 'slots' }
WaSwitch >> label: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]

{ #category : 'properties' }
WaSwitch >> required [

	^ (self attributeAt: #required) notNil
]

{ #category : 'properties' }
WaSwitch >> required: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #required ]
		ifFalse: [ self removeAttributeAt: #required ]
]

{ #category : 'properties' }
WaSwitch >> requiredBeOff [

	self required: false
]

{ #category : 'properties' }
WaSwitch >> requiredBeOn [

	self required: true
]

{ #category : 'properties' }
WaSwitch >> requiredIsOff [

	^ (self propertyAt: #required) not
]

{ #category : 'properties' }
WaSwitch >> requiredIsOn [

	^ self propertyAt: #required
]

{ #category : 'properties' }
WaSwitch >> size [

	^ self propertyAt: #size
]

{ #category : 'properties' }
WaSwitch >> size: anObject [

	self propertyAt: #size put: anObject
]

{ #category : 'properties' }
WaSwitch >> sizeBeLarge [

	self size: #large
]

{ #category : 'properties' }
WaSwitch >> sizeBeMedium [

	self size: #medium
]

{ #category : 'properties' }
WaSwitch >> sizeBeSmall [

	self size: #small
]

{ #category : 'css custom properties' }
WaSwitch >> thumbSize [

	^ self customPropertyAt: #'thumb-size'
]

{ #category : 'css custom properties' }
WaSwitch >> thumbSize: aString [

	self customPropertyAt: #'thumb-size' put: aString
]

{ #category : 'css custom properties' }
WaSwitch >> width [

	^ self customPropertyAt: #width
]

{ #category : 'css custom properties' }
WaSwitch >> width: aString [

	self customPropertyAt: #width put: aString
]
