Class {
	#name : 'WaTextarea',
	#superclass : 'WaTextControl',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing string' }
WaTextarea >> appearance [

	^ self propertyAt: #appearance
]

{ #category : 'accessing string' }
WaTextarea >> appearance: anObject [

	self propertyAt: #appearance put: anObject
]

{ #category : 'accessing string' }
WaTextarea >> appearanceBeFilled [

	self appearance: 'filled'
]

{ #category : 'accessing string' }
WaTextarea >> appearanceBeOutlined [

	self appearance: 'outlined'
]

{ #category : 'accessing string' }
WaTextarea >> hint [

	^ self propertyAt: #hint
]

{ #category : 'accessing string' }
WaTextarea >> hint: anObject [

	self propertyAt: #hint put: anObject
]

{ #category : 'accessing string' }
WaTextarea >> label [

	^ self propertyAt: #label
]

{ #category : 'accessing string' }
WaTextarea >> label: anObject [

	self propertyAt: #label put: anObject
]

{ #category : 'accessing boolean' }
WaTextarea >> pill [

	^ (self attributeAt: #pill) notNil
]

{ #category : 'accessing boolean' }
WaTextarea >> pill: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #pill ]
		ifFalse: [ self removeAttributeAt: #pill ]
]

{ #category : 'accessing boolean' }
WaTextarea >> pillBeOff [

	self pill: false
]

{ #category : 'accessing boolean' }
WaTextarea >> pillBeOn [

	self pill: true
]

{ #category : 'accessing number' }
WaTextarea >> rows [

	^ self propertyAt: #rows
]

{ #category : 'accessing number' }
WaTextarea >> rows: anObject [

	self propertyAt: #rows put: anObject
]

{ #category : 'accessing string' }
WaTextarea >> size [

	^ self propertyAt: #size
]

{ #category : 'accessing string' }
WaTextarea >> size: anObject [

	self propertyAt: #size put: anObject
]

{ #category : 'accessing string' }
WaTextarea >> sizeBeLarge [

	self size: 'large'
]

{ #category : 'accessing string' }
WaTextarea >> sizeBeMedium [

	self size: 'medium'
]

{ #category : 'accessing string' }
WaTextarea >> sizeBeSmall [

	self size: 'small'
]
