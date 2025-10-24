Class {
	#name : 'WaCheckbox',
	#superclass : 'WaCheckControl',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'properties' }
WaCheckbox >> checked [

	^ (self attributeAt: #checked) notNil
]

{ #category : 'properties' }
WaCheckbox >> checked: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #checked ]
		ifFalse: [ self removeAttributeAt: #checked ]
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
WaCheckbox >> disabled [

	^ (self attributeAt: #disabled) notNil
]

{ #category : 'properties' }
WaCheckbox >> disabled: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #disabled ]
		ifFalse: [ self removeAttributeAt: #disabled ]
]

{ #category : 'properties' }
WaCheckbox >> disabledBeOff [

	self disabled: false
]

{ #category : 'properties' }
WaCheckbox >> disabledBeOn [

	self disabled: true
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

	^ (self attributeAt: #indeterminate) notNil
]

{ #category : 'properties' }
WaCheckbox >> indeterminate: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #indeterminate ]
		ifFalse: [ self removeAttributeAt: #indeterminate ]
]

{ #category : 'properties' }
WaCheckbox >> indeterminateBeOff [

	self indeterminate: false
]

{ #category : 'properties' }
WaCheckbox >> indeterminateBeOn [

	self indeterminate: true
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

	^ (self attributeAt: #required) notNil
]

{ #category : 'properties' }
WaCheckbox >> required: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #required ]
		ifFalse: [ self removeAttributeAt: #required ]
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
