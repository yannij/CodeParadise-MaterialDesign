Class {
	#name : 'WaCheckbox',
	#superclass : 'WaFormControl',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'instance creation' }
WaCheckbox class >> label: object1 [ 

	^ self new 
		label: object1;
		yourself
]

{ #category : 'properties' }
WaCheckbox >> checked [

	^ self propertyAt: #checked
]

{ #category : 'properties' }
WaCheckbox >> checked: aBoolean [

	self propertyAt: #checked put: aBoolean
]

{ #category : 'properties' }
WaCheckbox >> checkedBeOff [

	self checked: false
]

{ #category : 'properties' }
WaCheckbox >> checkedBeOn [

	self checked: true
]

{ #category : 'properties' }
WaCheckbox >> checkedIsOff [

	^ (self propertyAt: #checked) not
]

{ #category : 'properties' }
WaCheckbox >> checkedIsOn [

	^ self propertyAt: #checked
]

{ #category : 'properties' }
WaCheckbox >> disabled [

	^ self propertyAt: #disabled
]

{ #category : 'properties' }
WaCheckbox >> disabled: aBoolean [

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'properties' }
WaCheckbox >> disabledBeOff [

	self disabled: false
]

{ #category : 'properties' }
WaCheckbox >> disabledBeOn [

	self disabled: true
]

{ #category : 'properties' }
WaCheckbox >> disabledIsOff [

	^ (self propertyAt: #disabled) not
]

{ #category : 'properties' }
WaCheckbox >> disabledIsOn [

	^ self propertyAt: #disabled
]

{ #category : 'css custom properties' }
WaCheckbox >> height [

	^ self customPropertyAt: #height
]

{ #category : 'css custom properties' }
WaCheckbox >> height: aString [

	self customPropertyAt: #height put: aString
]

{ #category : 'properties' }
WaCheckbox >> hint [

	^ self propertyAt: #hint
]

{ #category : 'properties' }
WaCheckbox >> hint: anObject [

	self propertyAt: #hint put: anObject
]

{ #category : 'properties' }
WaCheckbox >> indeterminate [

	^ self propertyAt: #indeterminate
]

{ #category : 'properties' }
WaCheckbox >> indeterminate: aBoolean [

	self propertyAt: #indeterminate put: aBoolean
]

{ #category : 'properties' }
WaCheckbox >> indeterminateBeOff [

	self indeterminate: false
]

{ #category : 'properties' }
WaCheckbox >> indeterminateBeOn [

	self indeterminate: true
]

{ #category : 'properties' }
WaCheckbox >> indeterminateIsOff [

	^ (self propertyAt: #indeterminate) not
]

{ #category : 'properties' }
WaCheckbox >> indeterminateIsOn [

	^ self propertyAt: #indeterminate
]

{ #category : 'slots' }
WaCheckbox >> label [

	^ self firstChildAtSlotNamed: nil
]

{ #category : 'slots' }
WaCheckbox >> label: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]

{ #category : 'properties' }
WaCheckbox >> required [

	^ self propertyAt: #required
]

{ #category : 'properties' }
WaCheckbox >> required: aBoolean [

	self propertyAt: #required put: aBoolean
]

{ #category : 'properties' }
WaCheckbox >> requiredBeOff [

	self required: false
]

{ #category : 'properties' }
WaCheckbox >> requiredBeOn [

	self required: true
]

{ #category : 'properties' }
WaCheckbox >> requiredIsOff [

	^ (self propertyAt: #required) not
]

{ #category : 'properties' }
WaCheckbox >> requiredIsOn [

	^ self propertyAt: #required
]

{ #category : 'properties' }
WaCheckbox >> size [

	^ self propertyAt: #size
]

{ #category : 'properties' }
WaCheckbox >> size: anObject [

	self propertyAt: #size put: anObject
]

{ #category : 'properties' }
WaCheckbox >> sizeBeLarge [

	self size: #large
]

{ #category : 'properties' }
WaCheckbox >> sizeBeMedium [

	self size: #medium
]

{ #category : 'properties' }
WaCheckbox >> sizeBeSmall [

	self size: #small
]

{ #category : 'css custom properties' }
WaCheckbox >> thumbSize [

	^ self customPropertyAt: #'thumb-size'
]

{ #category : 'css custom properties' }
WaCheckbox >> thumbSize: aString [

	self customPropertyAt: #'thumb-size' put: aString
]

{ #category : 'css custom properties' }
WaCheckbox >> width [

	^ self customPropertyAt: #width
]

{ #category : 'css custom properties' }
WaCheckbox >> width: aString [

	self customPropertyAt: #width put: aString
]
