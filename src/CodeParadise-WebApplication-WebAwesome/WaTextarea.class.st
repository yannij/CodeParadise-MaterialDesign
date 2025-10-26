Class {
	#name : 'WaTextarea',
	#superclass : 'WaFormControl',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'instance creation' }
WaTextarea class >> label: object1 [ 

	^ self new 
		label: object1;
		yourself
]

{ #category : 'properties' }
WaTextarea >> appearance [

	^ self propertyAt: #appearance
]

{ #category : 'properties' }
WaTextarea >> appearance: anObject [

	self propertyAt: #appearance put: anObject
]

{ #category : 'properties' }
WaTextarea >> appearanceBeFilled [

	self appearance: #filled
]

{ #category : 'properties' }
WaTextarea >> appearanceBeOutlined [

	self appearance: #outlined
]

{ #category : 'properties' }
WaTextarea >> disabled [

	^ (self attributeAt: #disabled) notNil
]

{ #category : 'properties' }
WaTextarea >> disabled: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #disabled ]
		ifFalse: [ self removeAttributeAt: #disabled ]
]

{ #category : 'properties' }
WaTextarea >> disabledBeOff [

	self disabled: false
]

{ #category : 'properties' }
WaTextarea >> disabledBeOn [

	self disabled: true
]

{ #category : 'properties' }
WaTextarea >> disabledIsOff [

	^ (self propertyAt: #disabled) not
]

{ #category : 'properties' }
WaTextarea >> disabledIsOn [

	^ self propertyAt: #disabled
]

{ #category : 'properties' }
WaTextarea >> hint [

	^ self propertyAt: #hint
]

{ #category : 'properties' }
WaTextarea >> hint: anObject [

	self propertyAt: #hint put: anObject
]

{ #category : 'properties' }
WaTextarea >> label [

	^ self propertyAt: #label
]

{ #category : 'properties' }
WaTextarea >> label: anObject [

	self propertyAt: #label put: anObject
]

{ #category : 'properties' }
WaTextarea >> pill [

	^ (self attributeAt: #pill) notNil
]

{ #category : 'properties' }
WaTextarea >> pill: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #pill ]
		ifFalse: [ self removeAttributeAt: #pill ]
]

{ #category : 'properties' }
WaTextarea >> pillBeOff [

	self pill: false
]

{ #category : 'properties' }
WaTextarea >> pillBeOn [

	self pill: true
]

{ #category : 'properties' }
WaTextarea >> pillIsOff [

	^ (self propertyAt: #pill) not
]

{ #category : 'properties' }
WaTextarea >> pillIsOn [

	^ self propertyAt: #pill
]

{ #category : 'properties' }
WaTextarea >> placeholder [

	^ self propertyAt: #placeholder
]

{ #category : 'properties' }
WaTextarea >> placeholder: anObject [

	self propertyAt: #placeholder put: anObject
]

{ #category : 'properties' }
WaTextarea >> readonly [

	^ (self attributeAt: #readonly) notNil
]

{ #category : 'properties' }
WaTextarea >> readonly: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #readonly ]
		ifFalse: [ self removeAttributeAt: #readonly ]
]

{ #category : 'properties' }
WaTextarea >> readonlyBeOff [

	self readonly: false
]

{ #category : 'properties' }
WaTextarea >> readonlyBeOn [

	self readonly: true
]

{ #category : 'properties' }
WaTextarea >> readonlyIsOff [

	^ (self propertyAt: #readonly) not
]

{ #category : 'properties' }
WaTextarea >> readonlyIsOn [

	^ self propertyAt: #readonly
]

{ #category : 'properties' }
WaTextarea >> required [

	^ (self attributeAt: #required) notNil
]

{ #category : 'properties' }
WaTextarea >> required: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #required ]
		ifFalse: [ self removeAttributeAt: #required ]
]

{ #category : 'properties' }
WaTextarea >> requiredBeOff [

	self required: false
]

{ #category : 'properties' }
WaTextarea >> requiredBeOn [

	self required: true
]

{ #category : 'properties' }
WaTextarea >> requiredIsOff [

	^ (self propertyAt: #required) not
]

{ #category : 'properties' }
WaTextarea >> requiredIsOn [

	^ self propertyAt: #required
]

{ #category : 'properties' }
WaTextarea >> resize [

	^ self propertyAt: #resize
]

{ #category : 'properties' }
WaTextarea >> resize: anObject [

	self propertyAt: #resize put: anObject
]

{ #category : 'properties' }
WaTextarea >> resizeBeAuto [

	self resize: #auto
]

{ #category : 'properties' }
WaTextarea >> resizeBeBoth [

	self resize: #both
]

{ #category : 'properties' }
WaTextarea >> resizeBeHorizontal [

	self resize: #horizontal
]

{ #category : 'properties' }
WaTextarea >> resizeBeNone [

	self resize: #none
]

{ #category : 'properties' }
WaTextarea >> resizeBeVertical [

	self resize: #vertical
]

{ #category : 'properties' }
WaTextarea >> rows [

	^ self propertyAt: #rows
]

{ #category : 'properties' }
WaTextarea >> rows: anObject [

	self propertyAt: #rows put: anObject
]

{ #category : 'properties' }
WaTextarea >> size [

	^ self propertyAt: #size
]

{ #category : 'properties' }
WaTextarea >> size: anObject [

	self propertyAt: #size put: anObject
]

{ #category : 'properties' }
WaTextarea >> sizeBeLarge [

	self size: #large
]

{ #category : 'properties' }
WaTextarea >> sizeBeMedium [

	self size: #medium
]

{ #category : 'properties' }
WaTextarea >> sizeBeSmall [

	self size: #small
]
