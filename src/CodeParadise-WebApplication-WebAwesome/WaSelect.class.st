Class {
	#name : 'WaSelect',
	#superclass : 'WaFormControl',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'properties' }
WaSelect >> appearance [

	^ self propertyAt: #appearance
]

{ #category : 'properties' }
WaSelect >> appearance: anObject [

	self propertyAt: #appearance put: anObject
]

{ #category : 'properties' }
WaSelect >> appearanceBeFilled [

	self appearance: #filled
]

{ #category : 'properties' }
WaSelect >> appearanceBeOutlined [

	self appearance: #outlined
]

{ #category : 'slots' }
WaSelect >> clearIcon [

	^ self firstChildAtSlotNamed: #'clear-icon'
]

{ #category : 'slots' }
WaSelect >> clearIcon: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #'clear-icon'
]

{ #category : 'properties' }
WaSelect >> disabled [

	^ (self attributeAt: #disabled) notNil
]

{ #category : 'properties' }
WaSelect >> disabled: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #disabled ]
		ifFalse: [ self removeAttributeAt: #disabled ]
]

{ #category : 'properties' }
WaSelect >> disabledBeOff [

	self disabled: false
]

{ #category : 'properties' }
WaSelect >> disabledBeOn [

	self disabled: true
]

{ #category : 'slots' }
WaSelect >> end [

	^ self firstChildAtSlotNamed: #end
]

{ #category : 'slots' }
WaSelect >> end: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #end
]

{ #category : 'slots' }
WaSelect >> expandIcon [

	^ self firstChildAtSlotNamed: #'expand-icon'
]

{ #category : 'slots' }
WaSelect >> expandIcon: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #'expand-icon'
]

{ #category : 'css custom properties' }
WaSelect >> hideDuration [

	^ self customPropertyAt: #'hide-duration'
]

{ #category : 'css custom properties' }
WaSelect >> hideDuration: aString [

	self customPropertyAt: #'hide-duration' put: aString
]

{ #category : 'slots' }
WaSelect >> hint [

	^ self firstChildAtSlotNamed: #hint
]

{ #category : 'slots' }
WaSelect >> hint: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #hint
]

{ #category : 'properties' }
WaSelect >> label [

	^ self propertyAt: #label
]

{ #category : 'properties' }
WaSelect >> label: anObject [

	self propertyAt: #label put: anObject
]

{ #category : 'properties' }
WaSelect >> maxOptionsVisible [

	^ self propertyAt: #'max-options-visible'
]

{ #category : 'properties' }
WaSelect >> maxOptionsVisible: anObject [

	self propertyAt: #'max-options-visible' put: anObject
]

{ #category : 'properties' }
WaSelect >> multiple [

	^ (self attributeAt: #multiple) notNil
]

{ #category : 'properties' }
WaSelect >> multiple: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #multiple ]
		ifFalse: [ self removeAttributeAt: #multiple ]
]

{ #category : 'properties' }
WaSelect >> multipleBeOff [

	self multiple: false
]

{ #category : 'properties' }
WaSelect >> multipleBeOn [

	self multiple: true
]

{ #category : 'properties' }
WaSelect >> name [

	^ self propertyAt: #name
]

{ #category : 'properties' }
WaSelect >> name: anObject [

	self propertyAt: #name put: anObject
]

{ #category : 'properties' }
WaSelect >> open [

	^ (self attributeAt: #open) notNil
]

{ #category : 'properties' }
WaSelect >> open: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #open ]
		ifFalse: [ self removeAttributeAt: #open ]
]

{ #category : 'properties' }
WaSelect >> openBeOff [

	self open: false
]

{ #category : 'properties' }
WaSelect >> openBeOn [

	self open: true
]

{ #category : 'properties' }
WaSelect >> pill [

	^ (self attributeAt: #pill) notNil
]

{ #category : 'properties' }
WaSelect >> pill: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #pill ]
		ifFalse: [ self removeAttributeAt: #pill ]
]

{ #category : 'properties' }
WaSelect >> pillBeOff [

	self pill: false
]

{ #category : 'properties' }
WaSelect >> pillBeOn [

	self pill: true
]

{ #category : 'properties' }
WaSelect >> placeholder [

	^ self propertyAt: #placeholder
]

{ #category : 'properties' }
WaSelect >> placeholder: anObject [

	self propertyAt: #placeholder put: anObject
]

{ #category : 'properties' }
WaSelect >> placement [

	^ self propertyAt: #placement
]

{ #category : 'properties' }
WaSelect >> placement: anObject [

	self propertyAt: #placement put: anObject
]

{ #category : 'properties' }
WaSelect >> placementBeBottom [

	self placement: #bottom
]

{ #category : 'properties' }
WaSelect >> placementBeTop [

	self placement: #top
]

{ #category : 'properties' }
WaSelect >> required [

	^ (self attributeAt: #required) notNil
]

{ #category : 'properties' }
WaSelect >> required: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #required ]
		ifFalse: [ self removeAttributeAt: #required ]
]

{ #category : 'properties' }
WaSelect >> requiredBeOff [

	self required: false
]

{ #category : 'properties' }
WaSelect >> requiredBeOn [

	self required: true
]

{ #category : 'css custom properties' }
WaSelect >> showDuration [

	^ self customPropertyAt: #'show-duration'
]

{ #category : 'css custom properties' }
WaSelect >> showDuration: aString [

	self customPropertyAt: #'show-duration' put: aString
]

{ #category : 'properties' }
WaSelect >> size [

	^ self propertyAt: #size
]

{ #category : 'properties' }
WaSelect >> size: anObject [

	self propertyAt: #size put: anObject
]

{ #category : 'properties' }
WaSelect >> sizeBeLarge [

	self size: #large
]

{ #category : 'properties' }
WaSelect >> sizeBeMedium [

	self size: #medium
]

{ #category : 'properties' }
WaSelect >> sizeBeSmall [

	self size: #small
]

{ #category : 'slots' }
WaSelect >> start [

	^ self firstChildAtSlotNamed: #start
]

{ #category : 'slots' }
WaSelect >> start: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #start
]

{ #category : 'css custom properties' }
WaSelect >> tagMaxSize [

	^ self customPropertyAt: #'tag-max-size'
]

{ #category : 'css custom properties' }
WaSelect >> tagMaxSize: aString [

	self customPropertyAt: #'tag-max-size' put: aString
]

{ #category : 'properties' }
WaSelect >> value [

	^ self propertyAt: #value
]

{ #category : 'properties' }
WaSelect >> value: anObject [

	self propertyAt: #value put: anObject
]

{ #category : 'properties' }
WaSelect >> withClear [

	^ (self attributeAt: #'with-clear') notNil
]

{ #category : 'properties' }
WaSelect >> withClear: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #'with-clear' ]
		ifFalse: [ self removeAttributeAt: #'with-clear' ]
]

{ #category : 'properties' }
WaSelect >> withClearBeOff [

	self withClear: false
]

{ #category : 'properties' }
WaSelect >> withClearBeOn [

	self withClear: true
]

{ #category : 'properties' }
WaSelect >> withHint [

	^ (self attributeAt: #'with-hint') notNil
]

{ #category : 'properties' }
WaSelect >> withHint: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #'with-hint' ]
		ifFalse: [ self removeAttributeAt: #'with-hint' ]
]

{ #category : 'properties' }
WaSelect >> withHintBeOff [

	self withHint: false
]

{ #category : 'properties' }
WaSelect >> withHintBeOn [

	self withHint: true
]

{ #category : 'properties' }
WaSelect >> withLabel [

	^ (self attributeAt: #'with-label') notNil
]

{ #category : 'properties' }
WaSelect >> withLabel: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #'with-label' ]
		ifFalse: [ self removeAttributeAt: #'with-label' ]
]

{ #category : 'properties' }
WaSelect >> withLabelBeOff [

	self withLabel: false
]

{ #category : 'properties' }
WaSelect >> withLabelBeOn [

	self withLabel: true
]
