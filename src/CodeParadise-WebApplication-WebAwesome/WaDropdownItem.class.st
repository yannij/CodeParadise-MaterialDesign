Class {
	#name : 'WaDropdownItem',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'instance creation' }
WaDropdownItem class >> value: aSymbol label: aStringOrElement [

	^ self new
		value: aSymbol ;
		label: aStringOrElement ;
		yourself
]

{ #category : 'instance creation' }
WaDropdownItem class >> value: aSymbol labelText: aString [

	^ self new
		value: aSymbol ;
		labelText: aString ;
		yourself
]

{ #category : 'properties' }
WaDropdownItem >> checked [

	self propertyAt: #checked
]

{ #category : 'properties' }
WaDropdownItem >> checked: aBoolean [

	self propertyAt: #checked put: aBoolean
]

{ #category : 'properties' }
WaDropdownItem >> checkedBeOff [

	self checked: false
]

{ #category : 'properties' }
WaDropdownItem >> checkedBeOn [

	self checked: true
]

{ #category : 'properties' }
WaDropdownItem >> checkedIsOff [

	^ (self propertyAt: #checked) not
]

{ #category : 'properties' }
WaDropdownItem >> checkedIsOn [

	^ self propertyAt: #checked
]

{ #category : 'slots' }
WaDropdownItem >> details [

	^ self firstChildAtSlotNamed: #details
]

{ #category : 'slots' }
WaDropdownItem >> details: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #details
]

{ #category : 'properties' }
WaDropdownItem >> disabled [

	self propertyAt: #disabled
]

{ #category : 'properties' }
WaDropdownItem >> disabled: aBoolean [

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'properties' }
WaDropdownItem >> disabledBeOff [

	self disabled: false
]

{ #category : 'properties' }
WaDropdownItem >> disabledBeOn [

	self disabled: true
]

{ #category : 'properties' }
WaDropdownItem >> disabledIsOff [

	^ (self propertyAt: #disabled) not
]

{ #category : 'properties' }
WaDropdownItem >> disabledIsOn [

	^ self propertyAt: #disabled
]

{ #category : 'slots' }
WaDropdownItem >> icon [

	^ self firstChildAtSlotNamed: #icon
]

{ #category : 'slots' }
WaDropdownItem >> icon: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #icon
]

{ #category : 'slots' }
WaDropdownItem >> label [

	^ self firstChildAtSlotNamed: nil
]

{ #category : 'slots' }
WaDropdownItem >> label: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]

{ #category : 'slots' }
WaDropdownItem >> labelText [

	^ self textContent
]

{ #category : 'slots' }
WaDropdownItem >> labelText: aString [

	self textContent: aString
]

{ #category : 'properties' }
WaDropdownItem >> placement [

	^ self propertyAt: #placement
]

{ #category : 'properties' }
WaDropdownItem >> placement: anObject [

	self propertyAt: #placement put: anObject
]

{ #category : 'properties' }
WaDropdownItem >> placementBeCheckbox [

	self placement: #checkbox
]

{ #category : 'properties' }
WaDropdownItem >> placementBeNormal [

	self placement: #normal
]

{ #category : 'slots' }
WaDropdownItem >> submenu [

	^ self firstChildAtSlotNamed: #submenu
]

{ #category : 'slots' }
WaDropdownItem >> submenu: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #submenu
]

{ #category : 'properties' }
WaDropdownItem >> submenuOpen [

	self propertyAt: #submenuOpen
]

{ #category : 'properties' }
WaDropdownItem >> submenuOpen: aBoolean [

	self propertyAt: #submenuOpen put: aBoolean
]

{ #category : 'properties' }
WaDropdownItem >> submenuOpenBeOff [

	self submenuOpen: false
]

{ #category : 'properties' }
WaDropdownItem >> submenuOpenBeOn [

	self submenuOpen: true
]

{ #category : 'properties' }
WaDropdownItem >> submenuOpenIsOff [

	^ (self propertyAt: #submenuOpen) not
]

{ #category : 'properties' }
WaDropdownItem >> submenuOpenIsOn [

	^ self propertyAt: #submenuOpen
]

{ #category : 'properties' }
WaDropdownItem >> value [

	^ self propertyAt: #value
]

{ #category : 'properties' }
WaDropdownItem >> value: anObject [

	self propertyAt: #value put: anObject
]

{ #category : 'properties' }
WaDropdownItem >> variant [

	^ self propertyAt: #variant
]

{ #category : 'properties' }
WaDropdownItem >> variant: anObject [

	self propertyAt: #variant put: anObject
]

{ #category : 'properties' }
WaDropdownItem >> variantBeDanger [

	self variant: #danger
]

{ #category : 'properties' }
WaDropdownItem >> variantBeDefault [

	self variant: #default
]
