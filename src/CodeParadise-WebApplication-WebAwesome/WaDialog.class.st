Class {
	#name : 'WaDialog',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'instance creation' }
WaDialog class >> label: object1 [ 

	^ self new 
		label: object1;
		yourself
]

{ #category : 'slots' }
WaDialog >> body [

	^ self firstChildAtSlotNamed: nil
]

{ #category : 'slots' }
WaDialog >> body: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]

{ #category : 'slots' }
WaDialog >> footer [

	^ self firstChildAtSlotNamed: #footer
]

{ #category : 'slots' }
WaDialog >> footer: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #footer
]

{ #category : 'slots' }
WaDialog >> headerActions [

	^ self firstChildAtSlotNamed: #'header-actions'
]

{ #category : 'slots' }
WaDialog >> headerActions: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #'header-actions'
]

{ #category : 'css custom properties' }
WaDialog >> hideDuration [

	^ self customPropertyAt: #'hide-duration'
]

{ #category : 'css custom properties' }
WaDialog >> hideDuration: aString [

	self customPropertyAt: #'hide-duration' put: aString
]

{ #category : 'slots' }
WaDialog >> label [

	^ self firstChildAtSlotNamed: #label
]

{ #category : 'slots' }
WaDialog >> label: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #label
]

{ #category : 'properties' }
WaDialog >> lightDismiss [

	^ (self attributeAt: #'light-dismiss') notNil
]

{ #category : 'properties' }
WaDialog >> lightDismiss: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #'light-dismiss' ]
		ifFalse: [ self removeAttributeAt: #'light-dismiss' ]
]

{ #category : 'properties' }
WaDialog >> lightDismissBeOff [

	self lightDismiss: false
]

{ #category : 'properties' }
WaDialog >> lightDismissBeOn [

	self lightDismiss: true
]

{ #category : 'properties' }
WaDialog >> lightDismissIsOff [

	^ (self propertyAt: #'light-dismiss') not
]

{ #category : 'properties' }
WaDialog >> lightDismissIsOn [

	^ self propertyAt: #'light-dismiss'
]

{ #category : 'properties' }
WaDialog >> open [

	^ self propertyAt: #open
]

{ #category : 'properties' }
WaDialog >> open: aBoolean [

	self propertyAt: #open put: aBoolean
]

{ #category : 'properties' }
WaDialog >> openBeOff [

	self open: false
]

{ #category : 'properties' }
WaDialog >> openBeOn [

	self open: true
]

{ #category : 'properties' }
WaDialog >> openIsOff [

	^ (self propertyAt: #open) not
]

{ #category : 'properties' }
WaDialog >> openIsOn [

	^ self propertyAt: #open
]

{ #category : 'css custom properties' }
WaDialog >> showDuration [

	^ self customPropertyAt: #'show-duration'
]

{ #category : 'css custom properties' }
WaDialog >> showDuration: aString [

	self customPropertyAt: #'show-duration' put: aString
]

{ #category : 'css custom properties' }
WaDialog >> spacing [

	^ self customPropertyAt: #spacing
]

{ #category : 'css custom properties' }
WaDialog >> spacing: aString [

	self customPropertyAt: #spacing put: aString
]

{ #category : 'css custom properties' }
WaDialog >> width [

	^ self customPropertyAt: #width
]

{ #category : 'css custom properties' }
WaDialog >> width: aString [

	self customPropertyAt: #width put: aString
]

{ #category : 'properties' }
WaDialog >> withoutHeader [

	^ (self attributeAt: #'without-header') notNil
]

{ #category : 'properties' }
WaDialog >> withoutHeader: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #'without-header' ]
		ifFalse: [ self removeAttributeAt: #'without-header' ]
]

{ #category : 'properties' }
WaDialog >> withoutHeaderBeOff [

	self withoutHeader: false
]

{ #category : 'properties' }
WaDialog >> withoutHeaderBeOn [

	self withoutHeader: true
]

{ #category : 'properties' }
WaDialog >> withoutHeaderIsOff [

	^ (self propertyAt: #'without-header') not
]

{ #category : 'properties' }
WaDialog >> withoutHeaderIsOn [

	^ self propertyAt: #'without-header'
]
