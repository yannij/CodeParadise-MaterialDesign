Class {
	#name : 'WaDrawer',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'instance creation' }
WaDrawer class >> label: object1 [ 

	^ self new 
		label: object1;
		yourself
]

{ #category : 'slots' }
WaDrawer >> body [

	^ self firstChildAtSlotNamed: nil
]

{ #category : 'slots' }
WaDrawer >> body: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]

{ #category : 'slots' }
WaDrawer >> footer [

	^ self firstChildAtSlotNamed: #footer
]

{ #category : 'slots' }
WaDrawer >> footer: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #footer
]

{ #category : 'slots' }
WaDrawer >> headerActions [

	^ self firstChildAtSlotNamed: #'header-actions'
]

{ #category : 'slots' }
WaDrawer >> headerActions: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #'header-actions'
]

{ #category : 'css custom properties' }
WaDrawer >> hideDuration [

	^ self customPropertyAt: #'hide-duration'
]

{ #category : 'css custom properties' }
WaDrawer >> hideDuration: aString [

	self customPropertyAt: #'hide-duration' put: aString
]

{ #category : 'slots' }
WaDrawer >> label [

	^ self firstChildAtSlotNamed: #label
]

{ #category : 'slots' }
WaDrawer >> label: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #label
]

{ #category : 'properties' }
WaDrawer >> lightDismiss [

	^ (self attributeAt: #'light-dismiss') notNil
]

{ #category : 'properties' }
WaDrawer >> lightDismiss: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #'light-dismiss' ]
		ifFalse: [ self removeAttributeAt: #'light-dismiss' ]
]

{ #category : 'properties' }
WaDrawer >> lightDismissBeOff [

	self lightDismiss: false
]

{ #category : 'properties' }
WaDrawer >> lightDismissBeOn [

	self lightDismiss: true
]

{ #category : 'properties' }
WaDrawer >> lightDismissIsOff [

	^ (self propertyAt: #'light-dismiss') not
]

{ #category : 'properties' }
WaDrawer >> lightDismissIsOn [

	^ self propertyAt: #'light-dismiss'
]

{ #category : 'properties' }
WaDrawer >> open [

	self propertyAt: #open
]

{ #category : 'properties' }
WaDrawer >> open: aBoolean [

	self propertyAt: #open put: aBoolean
]

{ #category : 'properties' }
WaDrawer >> openBeOff [

	self open: false
]

{ #category : 'properties' }
WaDrawer >> openBeOn [

	self open: true
]

{ #category : 'properties' }
WaDrawer >> openIsOff [

	^ (self propertyAt: #open) not
]

{ #category : 'properties' }
WaDrawer >> openIsOn [

	^ self propertyAt: #open
]

{ #category : 'properties' }
WaDrawer >> placement [

	^ self propertyAt: #placement
]

{ #category : 'properties' }
WaDrawer >> placement: anObject [

	self propertyAt: #placement put: anObject
]

{ #category : 'properties' }
WaDrawer >> placementBeBottom [

	self placement: #bottom
]

{ #category : 'properties' }
WaDrawer >> placementBeEnd [

	self placement: #end
]

{ #category : 'properties' }
WaDrawer >> placementBeStart [

	self placement: #start
]

{ #category : 'properties' }
WaDrawer >> placementBeTop [

	self placement: #top
]

{ #category : 'css custom properties' }
WaDrawer >> showDuration [

	^ self customPropertyAt: #'show-duration'
]

{ #category : 'css custom properties' }
WaDrawer >> showDuration: aString [

	self customPropertyAt: #'show-duration' put: aString
]

{ #category : 'css custom properties' }
WaDrawer >> size [

	^ self customPropertyAt: #size
]

{ #category : 'css custom properties' }
WaDrawer >> size: aString [

	self customPropertyAt: #size put: aString
]

{ #category : 'css custom properties' }
WaDrawer >> spacing [

	^ self customPropertyAt: #spacing
]

{ #category : 'css custom properties' }
WaDrawer >> spacing: aString [

	self customPropertyAt: #spacing put: aString
]

{ #category : 'properties' }
WaDrawer >> withoutHeader [

	^ (self attributeAt: #'without-header') notNil
]

{ #category : 'properties' }
WaDrawer >> withoutHeader: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #'without-header' ]
		ifFalse: [ self removeAttributeAt: #'without-header' ]
]

{ #category : 'properties' }
WaDrawer >> withoutHeaderBeOff [

	self withoutHeader: false
]

{ #category : 'properties' }
WaDrawer >> withoutHeaderBeOn [

	self withoutHeader: true
]

{ #category : 'properties' }
WaDrawer >> withoutHeaderIsOff [

	^ (self propertyAt: #'without-header') not
]

{ #category : 'properties' }
WaDrawer >> withoutHeaderIsOn [

	^ self propertyAt: #'without-header'
]
