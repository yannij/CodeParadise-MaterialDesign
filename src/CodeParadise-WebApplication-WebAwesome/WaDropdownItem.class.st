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

{ #category : 'accessing' }
WaDropdownItem >> beChecked [

	self checked: true
]

{ #category : 'accessing' }
WaDropdownItem >> beDisabled [

	self disabled: true
]

{ #category : 'accessing' }
WaDropdownItem >> beEnabled [

	"Convenience method to make receiver enabled"

	self disabled: false
]

{ #category : 'accessing' }
WaDropdownItem >> beNotChecked [

	self checked: false
]

{ #category : 'accessing style' }
WaDropdownItem >> beNotDisabled [

	self disabled: false
]

{ #category : 'accessing' }
WaDropdownItem >> beNotEnabled [

	"Convenience method to clear the enabled state of the receiver"

	self disabled: true
]

{ #category : 'accessing' }
WaDropdownItem >> checked: aBoolean [

	self propertyAt: #checked put: aBoolean
]

{ #category : 'accessing' }
WaDropdownItem >> disabled: aBoolean [

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'accessing' }
WaDropdownItem >> enabled: aBoolean [

	"Convenience method to set receiver's enabled state"

	self disabled: aBoolean not
]

{ #category : 'text input' }
WaDropdownItem >> focus [

	"Set focus to the receiver.

	Implementation:
	Since Shoelace uses tabindex attributes to indicate the currently
	selected item for tabbing/cursor movement, update all sibligs to
	properly indicate the receiver has focus/is active."

	| menu |

	super focus.

	"menu := self firstAncestorMatching: WaMenu asCssSelector.
	(menu allDescendantsMatching: self class asCssSelector) do: [ :each |
		each attributeAt: #tabindex put: (each == self
			ifTrue: [ '0' ]
			ifFalse: [ '-1' ]) ]"
]

{ #category : 'accessing' }
WaDropdownItem >> icon [

	^ self firstChildAtSlotNamed: #icon
]

{ #category : 'accessing' }
WaDropdownItem >> icon: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #icon
]

{ #category : 'accessing' }
WaDropdownItem >> isChecked [

	^ self propertyAt: #checked
]

{ #category : 'accessing' }
WaDropdownItem >> isDisabled [

	^ self propertyAt: #disabled
]

{ #category : 'accessing' }
WaDropdownItem >> isEnabled [

	"Convenience method to test if receiver is enabled"

	^ self isDisabled not
]

{ #category : 'accessing' }
WaDropdownItem >> label [

	"Answer the label HTML element of the receiver.
	For a simple String value use #labelText instead."

	^ self firstChildAtSlotNamed: nil
]

{ #category : 'accessing' }
WaDropdownItem >> label: aStringOrElement [

	"Set the label to the specified Element.
	For a simple String value use #labelText: instead."

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]

{ #category : 'accessing' }
WaDropdownItem >> labelText [

	"Answer the label text (a String) of the receiver.
	For richer HTML element use #label instead."

	^ self textContent
]

{ #category : 'accessing' }
WaDropdownItem >> labelText: aString [

	"Set the label text to the specified String value.
	For richer HTML element use #label: instead."

	self textContent: aString
]

{ #category : 'accessing' }
WaDropdownItem >> prefix [

	^ self firstChildAtSlotNamed: #prefix
]

{ #category : 'accessing' }
WaDropdownItem >> prefix: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #prefix
]

{ #category : 'accessing' }
WaDropdownItem >> suffix [

	^ self firstChildAtSlotNamed: #suffix
]

{ #category : 'accessing' }
WaDropdownItem >> suffix: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #suffix
]

{ #category : 'accessing' }
WaDropdownItem >> value [

	^ self propertyAt: #value
]

{ #category : 'accessing' }
WaDropdownItem >> value: aString [

	self propertyAt: #value put: aString asString
]
