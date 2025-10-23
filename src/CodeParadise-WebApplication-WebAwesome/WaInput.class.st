Class {
	#name : 'WaInput',
	#superclass : 'WaTextControl',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing string' }
WaInput >> appearance [

	^ self propertyAt: #appearance
]

{ #category : 'accessing string' }
WaInput >> appearance: anObject [

	self propertyAt: #appearance put: anObject
]

{ #category : 'accessing string' }
WaInput >> appearanceBeFilled [

	self appearance: 'filled'
]

{ #category : 'accessing string' }
WaInput >> appearanceBeOutlined [

	self appearance: 'outlined'
]

{ #category : 'accessing string' }
WaInput >> hint [

	^ self propertyAt: #hint
]

{ #category : 'accessing string' }
WaInput >> hint: anObject [

	self propertyAt: #hint put: anObject
]

{ #category : 'accessing string' }
WaInput >> label [

	^ self propertyAt: #label
]

{ #category : 'accessing string' }
WaInput >> label: anObject [

	self propertyAt: #label put: anObject
]

{ #category : 'accessing boolean' }
WaInput >> pill [

	^ (self attributeAt: #pill) notNil
]

{ #category : 'accessing boolean' }
WaInput >> pill: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #pill ]
		ifFalse: [ self removeAttributeAt: #pill ]
]

{ #category : 'accessing boolean' }
WaInput >> pillBeOff [

	self pill: false
]

{ #category : 'accessing boolean' }
WaInput >> pillBeOn [

	self pill: true
]

{ #category : 'accessing string' }
WaInput >> size [

	^ self propertyAt: #size
]

{ #category : 'accessing string' }
WaInput >> size: anObject [

	self propertyAt: #size put: anObject
]

{ #category : 'accessing string' }
WaInput >> sizeBeLarge [

	self size: 'large'
]

{ #category : 'accessing string' }
WaInput >> sizeBeMedium [

	self size: 'medium'
]

{ #category : 'accessing string' }
WaInput >> sizeBeSmall [

	self size: 'small'
]
