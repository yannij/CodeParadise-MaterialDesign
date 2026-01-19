Class {
	#name : 'WaDetails',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'properties' }
WaDetails >> appearance [

	^ self propertyAt: #appearance
]

{ #category : 'properties' }
WaDetails >> appearance: anObject [

	self propertyAt: #appearance put: anObject
]

{ #category : 'properties' }
WaDetails >> appearanceBeFilled [

	self appearance: #filled
]

{ #category : 'properties' }
WaDetails >> appearanceBeFilledOutlined [

	self appearance: #'filled outlined'
]

{ #category : 'properties' }
WaDetails >> appearanceBeOutlined [

	self appearance: #outlined
]

{ #category : 'properties' }
WaDetails >> appearanceBePlain [

	self appearance: #plain
]

{ #category : 'slots' }
WaDetails >> collapseIcon [

	^ self firstChildAtSlotNamed: #'collapse-icon'
]

{ #category : 'slots' }
WaDetails >> collapseIcon: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #'collapse-icon'
]

{ #category : 'properties' }
WaDetails >> disabled [

	^ self propertyAt: #disabled
]

{ #category : 'properties' }
WaDetails >> disabled: aBoolean [

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'properties' }
WaDetails >> disabledBeOff [

	self disabled: false
]

{ #category : 'properties' }
WaDetails >> disabledBeOn [

	self disabled: true
]

{ #category : 'properties' }
WaDetails >> disabledIsOff [

	^ (self propertyAt: #disabled) not
]

{ #category : 'properties' }
WaDetails >> disabledIsOn [

	^ self propertyAt: #disabled
]

{ #category : 'slots' }
WaDetails >> expandIcon [

	^ self firstChildAtSlotNamed: #'expand-icon'
]

{ #category : 'slots' }
WaDetails >> expandIcon: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #'expand-icon'
]

{ #category : 'css custom properties' }
WaDetails >> hideDuration [

	^ self customPropertyAt: #'hide-duration'
]

{ #category : 'css custom properties' }
WaDetails >> hideDuration: aString [

	self customPropertyAt: #'hide-duration' put: aString
]

{ #category : 'properties' }
WaDetails >> iconPlacement [

	^ self propertyAt: #'icon-placement'
]

{ #category : 'properties' }
WaDetails >> iconPlacement: anObject [

	self propertyAt: #'icon-placement' put: anObject
]

{ #category : 'properties' }
WaDetails >> iconPlacementBeEnd [

	self iconPlacement: #end
]

{ #category : 'properties' }
WaDetails >> iconPlacementBeStart [

	self iconPlacement: #start
]

{ #category : 'properties' }
WaDetails >> name [

	^ self propertyAt: #name
]

{ #category : 'properties' }
WaDetails >> name: anObject [

	self propertyAt: #name put: anObject
]

{ #category : 'properties' }
WaDetails >> open [

	^ self propertyAt: #open
]

{ #category : 'properties' }
WaDetails >> open: aBoolean [

	self propertyAt: #open put: aBoolean
]

{ #category : 'properties' }
WaDetails >> openBeOff [

	self open: false
]

{ #category : 'properties' }
WaDetails >> openBeOn [

	self open: true
]

{ #category : 'properties' }
WaDetails >> openIsOff [

	^ (self propertyAt: #open) not
]

{ #category : 'properties' }
WaDetails >> openIsOn [

	^ self propertyAt: #open
]

{ #category : 'css custom properties' }
WaDetails >> showDuration [

	^ self customPropertyAt: #'show-duration'
]

{ #category : 'css custom properties' }
WaDetails >> showDuration: aString [

	self customPropertyAt: #'show-duration' put: aString
]

{ #category : 'css custom properties' }
WaDetails >> spacing [

	^ self customPropertyAt: #spacing
]

{ #category : 'css custom properties' }
WaDetails >> spacing: aString [

	self customPropertyAt: #spacing put: aString
]

{ #category : 'slots' }
WaDetails >> summary [

	^ self firstChildAtSlotNamed: #summary
]

{ #category : 'slots' }
WaDetails >> summary: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #summary
]
