Class {
	#name : 'WaInput',
	#superclass : 'WaFormControl',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'instance creation' }
WaInput class >> label: object1 [ 

	^ self new 
		label: object1;
		yourself
]

{ #category : 'properties' }
WaInput >> appearance [

	^ self propertyAt: #appearance
]

{ #category : 'properties' }
WaInput >> appearance: anObject [

	self propertyAt: #appearance put: anObject
]

{ #category : 'properties' }
WaInput >> appearanceBeFilled [

	self appearance: #filled
]

{ #category : 'properties' }
WaInput >> appearanceBeOutlined [

	self appearance: #outlined
]

{ #category : 'properties' }
WaInput >> autofocus [

	self propertyAt: #autofocus
]

{ #category : 'properties' }
WaInput >> autofocus: aBoolean [

	self propertyAt: #autofocus put: aBoolean
]

{ #category : 'properties' }
WaInput >> autofocusBeOff [

	self autofocus: false
]

{ #category : 'properties' }
WaInput >> autofocusBeOn [

	self autofocus: true
]

{ #category : 'properties' }
WaInput >> autofocusIsOff [

	^ (self propertyAt: #autofocus) not
]

{ #category : 'properties' }
WaInput >> autofocusIsOn [

	^ self propertyAt: #autofocus
]

{ #category : 'slots' }
WaInput >> clearIcon [

	^ self firstChildAtSlotNamed: #'clear-icon'
]

{ #category : 'slots' }
WaInput >> clearIcon: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #'clear-icon'
]

{ #category : 'properties' }
WaInput >> disabled [

	^ (self attributeAt: #disabled) notNil
]

{ #category : 'properties' }
WaInput >> disabled: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #disabled ]
		ifFalse: [ self removeAttributeAt: #disabled ]
]

{ #category : 'properties' }
WaInput >> disabledBeOff [

	self disabled: false
]

{ #category : 'properties' }
WaInput >> disabledBeOn [

	self disabled: true
]

{ #category : 'properties' }
WaInput >> disabledIsOff [

	^ (self propertyAt: #disabled) not
]

{ #category : 'properties' }
WaInput >> disabledIsOn [

	^ self propertyAt: #disabled
]

{ #category : 'slots' }
WaInput >> end [

	^ self firstChildAtSlotNamed: #end
]

{ #category : 'slots' }
WaInput >> end: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #end
]

{ #category : 'slots' }
WaInput >> hidePasswordIcon [

	^ self firstChildAtSlotNamed: #'hide-password-icon'
]

{ #category : 'slots' }
WaInput >> hidePasswordIcon: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #'hide-password-icon'
]

{ #category : 'properties' }
WaInput >> hint [

	^ self propertyAt: #hint
]

{ #category : 'properties' }
WaInput >> hint: anObject [

	self propertyAt: #hint put: anObject
]

{ #category : 'properties' }
WaInput >> label [

	^ self propertyAt: #label
]

{ #category : 'properties' }
WaInput >> label: anObject [

	self propertyAt: #label put: anObject
]

{ #category : 'properties' }
WaInput >> passwordToggle [

	self propertyAt: #'password-toggle'
]

{ #category : 'properties' }
WaInput >> passwordToggle: aBoolean [

	self propertyAt: #'password-toggle' put: aBoolean
]

{ #category : 'properties' }
WaInput >> passwordToggleBeOff [

	self passwordToggle: false
]

{ #category : 'properties' }
WaInput >> passwordToggleBeOn [

	self passwordToggle: true
]

{ #category : 'properties' }
WaInput >> passwordToggleIsOff [

	^ (self propertyAt: #'password-toggle') not
]

{ #category : 'properties' }
WaInput >> passwordToggleIsOn [

	^ self propertyAt: #'password-toggle'
]

{ #category : 'properties' }
WaInput >> passwordVisible [

	self propertyAt: #'password-visible'
]

{ #category : 'properties' }
WaInput >> passwordVisible: aBoolean [

	self propertyAt: #'password-visible' put: aBoolean
]

{ #category : 'properties' }
WaInput >> passwordVisibleBeOff [

	self passwordVisible: false
]

{ #category : 'properties' }
WaInput >> passwordVisibleBeOn [

	self passwordVisible: true
]

{ #category : 'properties' }
WaInput >> passwordVisibleIsOff [

	^ (self propertyAt: #'password-visible') not
]

{ #category : 'properties' }
WaInput >> passwordVisibleIsOn [

	^ self propertyAt: #'password-visible'
]

{ #category : 'properties' }
WaInput >> pill [

	self propertyAt: #pill
]

{ #category : 'properties' }
WaInput >> pill: aBoolean [

	self propertyAt: #pill put: aBoolean
]

{ #category : 'properties' }
WaInput >> pillBeOff [

	self pill: false
]

{ #category : 'properties' }
WaInput >> pillBeOn [

	self pill: true
]

{ #category : 'properties' }
WaInput >> pillIsOff [

	^ (self propertyAt: #pill) not
]

{ #category : 'properties' }
WaInput >> pillIsOn [

	^ self propertyAt: #pill
]

{ #category : 'properties' }
WaInput >> placeholder [

	^ self propertyAt: #placeholder
]

{ #category : 'properties' }
WaInput >> placeholder: anObject [

	self propertyAt: #placeholder put: anObject
]

{ #category : 'properties' }
WaInput >> readonly [

	self propertyAt: #readonly
]

{ #category : 'properties' }
WaInput >> readonly: aBoolean [

	self propertyAt: #readonly put: aBoolean
]

{ #category : 'properties' }
WaInput >> readonlyBeOff [

	self readonly: false
]

{ #category : 'properties' }
WaInput >> readonlyBeOn [

	self readonly: true
]

{ #category : 'properties' }
WaInput >> readonlyIsOff [

	^ (self propertyAt: #readonly) not
]

{ #category : 'properties' }
WaInput >> readonlyIsOn [

	^ self propertyAt: #readonly
]

{ #category : 'properties' }
WaInput >> required [

	self propertyAt: #required
]

{ #category : 'properties' }
WaInput >> required: aBoolean [

	self propertyAt: #required put: aBoolean
]

{ #category : 'properties' }
WaInput >> requiredBeOff [

	self required: false
]

{ #category : 'properties' }
WaInput >> requiredBeOn [

	self required: true
]

{ #category : 'properties' }
WaInput >> requiredIsOff [

	^ (self propertyAt: #required) not
]

{ #category : 'properties' }
WaInput >> requiredIsOn [

	^ self propertyAt: #required
]

{ #category : 'slots' }
WaInput >> showPasswordIcon [

	^ self firstChildAtSlotNamed: #'show-password-icon'
]

{ #category : 'slots' }
WaInput >> showPasswordIcon: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #'show-password-icon'
]

{ #category : 'properties' }
WaInput >> size [

	^ self propertyAt: #size
]

{ #category : 'properties' }
WaInput >> size: anObject [

	self propertyAt: #size put: anObject
]

{ #category : 'properties' }
WaInput >> sizeBeLarge [

	self size: #large
]

{ #category : 'properties' }
WaInput >> sizeBeMedium [

	self size: #medium
]

{ #category : 'properties' }
WaInput >> sizeBeSmall [

	self size: #small
]

{ #category : 'slots' }
WaInput >> start [

	^ self firstChildAtSlotNamed: #start
]

{ #category : 'slots' }
WaInput >> start: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #start
]

{ #category : 'properties' }
WaInput >> type [

	^ self propertyAt: #type
]

{ #category : 'properties' }
WaInput >> type: anObject [

	self propertyAt: #type put: anObject
]

{ #category : 'properties' }
WaInput >> typeBeDate [

	self type: #date
]

{ #category : 'properties' }
WaInput >> typeBeDatetimeLocal [

	self type: #'datetime local'
]

{ #category : 'properties' }
WaInput >> typeBeEmail [

	self type: #email
]

{ #category : 'properties' }
WaInput >> typeBeNumber [

	self type: #number
]

{ #category : 'properties' }
WaInput >> typeBePassword [

	self type: #password
]

{ #category : 'properties' }
WaInput >> typeBeSearch [

	self type: #search
]

{ #category : 'properties' }
WaInput >> typeBeTel [

	self type: #tel
]

{ #category : 'properties' }
WaInput >> typeBeText [

	self type: #text
]

{ #category : 'properties' }
WaInput >> typeBeTime [

	self type: #time
]

{ #category : 'properties' }
WaInput >> typeBeUrl [

	self type: #url
]

{ #category : 'properties' }
WaInput >> withClear [

	^ (self attributeAt: #'with-clear') notNil
]

{ #category : 'properties' }
WaInput >> withClear: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #'with-clear' ]
		ifFalse: [ self removeAttributeAt: #'with-clear' ]
]

{ #category : 'properties' }
WaInput >> withClearBeOff [

	self withClear: false
]

{ #category : 'properties' }
WaInput >> withClearBeOn [

	self withClear: true
]

{ #category : 'properties' }
WaInput >> withClearIsOff [

	^ (self propertyAt: #'with-clear') not
]

{ #category : 'properties' }
WaInput >> withClearIsOn [

	^ self propertyAt: #'with-clear'
]
