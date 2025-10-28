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

	self propertyAt: #disabled
]

{ #category : 'properties' }
WaSelect >> disabled: aBoolean [

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'properties' }
WaSelect >> disabledBeOff [

	self disabled: false
]

{ #category : 'properties' }
WaSelect >> disabledBeOn [

	self disabled: true
]

{ #category : 'properties' }
WaSelect >> disabledIsOff [

	^ (self propertyAt: #disabled) not
]

{ #category : 'properties' }
WaSelect >> disabledIsOn [

	^ self propertyAt: #disabled
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

	self propertyAt: #multiple
]

{ #category : 'properties' }
WaSelect >> multiple: aBoolean [

	self propertyAt: #multiple put: aBoolean
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
WaSelect >> multipleIsOff [

	^ (self propertyAt: #multiple) not
]

{ #category : 'properties' }
WaSelect >> multipleIsOn [

	^ self propertyAt: #multiple
]

{ #category : 'properties' }
WaSelect >> open [

	self propertyAt: #open
]

{ #category : 'properties' }
WaSelect >> open: aBoolean [

	self propertyAt: #open put: aBoolean
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
WaSelect >> openIsOff [

	^ (self propertyAt: #open) not
]

{ #category : 'properties' }
WaSelect >> openIsOn [

	^ self propertyAt: #open
]

{ #category : 'properties' }
WaSelect >> pill [

	self propertyAt: #pill
]

{ #category : 'properties' }
WaSelect >> pill: aBoolean [

	self propertyAt: #pill put: aBoolean
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
WaSelect >> pillIsOff [

	^ (self propertyAt: #pill) not
]

{ #category : 'properties' }
WaSelect >> pillIsOn [

	^ self propertyAt: #pill
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

	self propertyAt: #required
]

{ #category : 'properties' }
WaSelect >> required: aBoolean [

	self propertyAt: #required put: aBoolean
]

{ #category : 'properties' }
WaSelect >> requiredBeOff [

	self required: false
]

{ #category : 'properties' }
WaSelect >> requiredBeOn [

	self required: true
]

{ #category : 'properties' }
WaSelect >> requiredIsOff [

	^ (self propertyAt: #required) not
]

{ #category : 'properties' }
WaSelect >> requiredIsOn [

	^ self propertyAt: #required
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
WaSelect >> withClear [

	self propertyAt: #'with-clear'
]

{ #category : 'properties' }
WaSelect >> withClear: aBoolean [

	self propertyAt: #'with-clear' put: aBoolean
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
WaSelect >> withClearIsOff [

	^ (self propertyAt: #'with-clear') not
]

{ #category : 'properties' }
WaSelect >> withClearIsOn [

	^ self propertyAt: #'with-clear'
]

{ #category : 'properties' }
WaSelect >> withHint [

	self propertyAt: #'with-hint'
]

{ #category : 'properties' }
WaSelect >> withHint: aBoolean [

	self propertyAt: #'with-hint' put: aBoolean
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
WaSelect >> withHintIsOff [

	^ (self propertyAt: #'with-hint') not
]

{ #category : 'properties' }
WaSelect >> withHintIsOn [

	^ self propertyAt: #'with-hint'
]

{ #category : 'properties' }
WaSelect >> withLabel [

	self propertyAt: #'with-label'
]

{ #category : 'properties' }
WaSelect >> withLabel: aBoolean [

	self propertyAt: #'with-label' put: aBoolean
]

{ #category : 'properties' }
WaSelect >> withLabelBeOff [

	self withLabel: false
]

{ #category : 'properties' }
WaSelect >> withLabelBeOn [

	self withLabel: true
]

{ #category : 'properties' }
WaSelect >> withLabelIsOff [

	^ (self propertyAt: #'with-label') not
]

{ #category : 'properties' }
WaSelect >> withLabelIsOn [

	^ self propertyAt: #'with-label'
]
