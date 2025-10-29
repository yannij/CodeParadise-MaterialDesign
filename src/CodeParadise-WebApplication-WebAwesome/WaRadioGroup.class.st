Class {
	#name : 'WaRadioGroup',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'properties' }
WaRadioGroup >> disabled [

	^ self propertyAt: #disabled
]

{ #category : 'properties' }
WaRadioGroup >> disabled: aBoolean [

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'properties' }
WaRadioGroup >> disabledBeOff [

	self disabled: false
]

{ #category : 'properties' }
WaRadioGroup >> disabledBeOn [

	self disabled: true
]

{ #category : 'properties' }
WaRadioGroup >> disabledIsOff [

	^ (self propertyAt: #disabled) not
]

{ #category : 'properties' }
WaRadioGroup >> disabledIsOn [

	^ self propertyAt: #disabled
]

{ #category : 'slots' }
WaRadioGroup >> hint [

	^ self firstChildAtSlotNamed: #hint
]

{ #category : 'slots' }
WaRadioGroup >> hint: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #hint
]

{ #category : 'slots' }
WaRadioGroup >> label [

	^ self firstChildAtSlotNamed: #label
]

{ #category : 'slots' }
WaRadioGroup >> label: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #label
]

{ #category : 'properties' }
WaRadioGroup >> name [

	^ self propertyAt: #name
]

{ #category : 'properties' }
WaRadioGroup >> name: anObject [

	self propertyAt: #name put: anObject
]

{ #category : 'properties' }
WaRadioGroup >> orientation [

	^ self propertyAt: #orientation
]

{ #category : 'properties' }
WaRadioGroup >> orientation: anObject [

	self propertyAt: #orientation put: anObject
]

{ #category : 'properties' }
WaRadioGroup >> orientationBeHorizontal [

	self orientation: #horizontal
]

{ #category : 'properties' }
WaRadioGroup >> orientationBeVertical [

	self orientation: #vertical
]

{ #category : 'properties' }
WaRadioGroup >> required [

	^ self propertyAt: #required
]

{ #category : 'properties' }
WaRadioGroup >> required: aBoolean [

	self propertyAt: #required put: aBoolean
]

{ #category : 'properties' }
WaRadioGroup >> requiredBeOff [

	self required: false
]

{ #category : 'properties' }
WaRadioGroup >> requiredBeOn [

	self required: true
]

{ #category : 'properties' }
WaRadioGroup >> requiredIsOff [

	^ (self propertyAt: #required) not
]

{ #category : 'properties' }
WaRadioGroup >> requiredIsOn [

	^ self propertyAt: #required
]

{ #category : 'properties' }
WaRadioGroup >> size [

	^ self propertyAt: #size
]

{ #category : 'properties' }
WaRadioGroup >> size: anObject [

	self propertyAt: #size put: anObject
]

{ #category : 'properties' }
WaRadioGroup >> sizeBeLarge [

	self size: #large
]

{ #category : 'properties' }
WaRadioGroup >> sizeBeMedium [

	self size: #medium
]

{ #category : 'properties' }
WaRadioGroup >> sizeBeSmall [

	self size: #small
]

{ #category : 'properties' }
WaRadioGroup >> value [

	^ self propertyAt: #value
]

{ #category : 'properties' }
WaRadioGroup >> value: anObject [

	self propertyAt: #value put: anObject
]

{ #category : 'properties' }
WaRadioGroup >> withHint [

	^ self propertyAt: #'with-hint'
]

{ #category : 'properties' }
WaRadioGroup >> withHint: aBoolean [

	self propertyAt: #'with-hint' put: aBoolean
]

{ #category : 'properties' }
WaRadioGroup >> withHintBeOff [

	self withHint: false
]

{ #category : 'properties' }
WaRadioGroup >> withHintBeOn [

	self withHint: true
]

{ #category : 'properties' }
WaRadioGroup >> withHintIsOff [

	^ (self propertyAt: #'with-hint') not
]

{ #category : 'properties' }
WaRadioGroup >> withHintIsOn [

	^ self propertyAt: #'with-hint'
]

{ #category : 'properties' }
WaRadioGroup >> withLabel [

	^ self propertyAt: #'with-label'
]

{ #category : 'properties' }
WaRadioGroup >> withLabel: aBoolean [

	self propertyAt: #'with-label' put: aBoolean
]

{ #category : 'properties' }
WaRadioGroup >> withLabelBeOff [

	self withLabel: false
]

{ #category : 'properties' }
WaRadioGroup >> withLabelBeOn [

	self withLabel: true
]

{ #category : 'properties' }
WaRadioGroup >> withLabelIsOff [

	^ (self propertyAt: #'with-label') not
]

{ #category : 'properties' }
WaRadioGroup >> withLabelIsOn [

	^ self propertyAt: #'with-label'
]
