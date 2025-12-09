Class {
	#name : 'WaTreeItem',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'instance creation' }
WaTreeItem class >> label: object1 [ 

	^ self new 
		label: object1;
		yourself
]

{ #category : 'slots' }
WaTreeItem >> collapseIcon [

	^ self firstChildAtSlotNamed: #'collapse-icon'
]

{ #category : 'slots' }
WaTreeItem >> collapseIcon: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #'collapse-icon'
]

{ #category : 'properties' }
WaTreeItem >> disabled [

	^ (self attributeAt: #disabled) notNil
]

{ #category : 'properties' }
WaTreeItem >> disabled: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #disabled ]
		ifFalse: [ self removeAttributeAt: #disabled ]
]

{ #category : 'properties' }
WaTreeItem >> disabledBeOff [

	self disabled: false
]

{ #category : 'properties' }
WaTreeItem >> disabledBeOn [

	self disabled: true
]

{ #category : 'properties' }
WaTreeItem >> disabledIsOff [

	^ (self propertyAt: #disabled) not
]

{ #category : 'properties' }
WaTreeItem >> disabledIsOn [

	^ self propertyAt: #disabled
]

{ #category : 'slots' }
WaTreeItem >> expandIcon [

	^ self firstChildAtSlotNamed: #'expand-icon'
]

{ #category : 'slots' }
WaTreeItem >> expandIcon: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #'expand-icon'
]

{ #category : 'properties' }
WaTreeItem >> expanded [

	^ (self attributeAt: #expanded) notNil
]

{ #category : 'properties' }
WaTreeItem >> expanded: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #expanded ]
		ifFalse: [ self removeAttributeAt: #expanded ]
]

{ #category : 'properties' }
WaTreeItem >> expandedBeOff [

	self expanded: false
]

{ #category : 'properties' }
WaTreeItem >> expandedBeOn [

	self expanded: true
]

{ #category : 'properties' }
WaTreeItem >> expandedIsOff [

	^ (self propertyAt: #expanded) not
]

{ #category : 'properties' }
WaTreeItem >> expandedIsOn [

	^ self propertyAt: #expanded
]

{ #category : 'css custom properties' }
WaTreeItem >> hideDuration [

	^ self customPropertyAt: #'hide-duration'
]

{ #category : 'css custom properties' }
WaTreeItem >> hideDuration: aString [

	self customPropertyAt: #'hide-duration' put: aString
]

{ #category : 'slots' }
WaTreeItem >> label [

	^ self firstChildAtSlotNamed: nil
]

{ #category : 'slots' }
WaTreeItem >> label: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]

{ #category : 'properties' }
WaTreeItem >> lazy [

	^ (self attributeAt: #lazy) notNil
]

{ #category : 'properties' }
WaTreeItem >> lazy: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #lazy ]
		ifFalse: [ self removeAttributeAt: #lazy ]
]

{ #category : 'properties' }
WaTreeItem >> lazyBeOff [

	self lazy: false
]

{ #category : 'properties' }
WaTreeItem >> lazyBeOn [

	self lazy: true
]

{ #category : 'properties' }
WaTreeItem >> lazyIsOff [

	^ (self propertyAt: #lazy) not
]

{ #category : 'properties' }
WaTreeItem >> lazyIsOn [

	^ self propertyAt: #lazy
]

{ #category : 'properties' }
WaTreeItem >> selected [

	^ (self attributeAt: #selected) notNil
]

{ #category : 'properties' }
WaTreeItem >> selected: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #selected ]
		ifFalse: [ self removeAttributeAt: #selected ]
]

{ #category : 'properties' }
WaTreeItem >> selectedBeOff [

	self selected: false
]

{ #category : 'properties' }
WaTreeItem >> selectedBeOn [

	self selected: true
]

{ #category : 'properties' }
WaTreeItem >> selectedIsOff [

	^ (self propertyAt: #selected) not
]

{ #category : 'properties' }
WaTreeItem >> selectedIsOn [

	^ self propertyAt: #selected
]

{ #category : 'css custom properties' }
WaTreeItem >> showDuration [

	^ self customPropertyAt: #'show-duration'
]

{ #category : 'css custom properties' }
WaTreeItem >> showDuration: aString [

	self customPropertyAt: #'show-duration' put: aString
]
