Class {
	#name : 'WaMenuItem',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'instance creation' }
WaMenuItem class >> value: aSymbol label: aStringOrElement [

	^ self new
		value: aSymbol ;
		label: aStringOrElement ;
		yourself
]

{ #category : 'instance creation' }
WaMenuItem class >> value: aSymbol labelText: aString [

	^ self new
		value: aSymbol ;
		labelText: aString ;
		yourself
]

{ #category : 'accessing' }
WaMenuItem >> beChecked [

	self checked: true
]

{ #category : 'accessing' }
WaMenuItem >> beDisabled [

	self disabled: true
]

{ #category : 'accessing' }
WaMenuItem >> beEnabled [

	"Convenience method to make receiver enabled"

	self disabled: false
]

{ #category : 'accessing' }
WaMenuItem >> beNotChecked [

	self checked: false
]

{ #category : 'accessing style' }
WaMenuItem >> beNotDisabled [

	self disabled: false
]

{ #category : 'accessing' }
WaMenuItem >> beNotEnabled [

	"Convenience method to clear the enabled state of the receiver"

	self disabled: true
]

{ #category : 'accessing' }
WaMenuItem >> checked: aBoolean [

	self propertyAt: #checked put: aBoolean
]

{ #category : 'copying' }
WaMenuItem >> clone [

	"Deep clone the receiver.

	Implementation:
	Set the (non reflecting properties explicitly)."

	^ super clone
		value: self value ;
		yourself

]

{ #category : 'accessing' }
WaMenuItem >> disabled: aBoolean [

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'accessing' }
WaMenuItem >> enabled: aBoolean [

	"Convenience method to set receiver's enabled state"

	self disabled: aBoolean not
]

{ #category : 'text input' }
WaMenuItem >> focus [

	"Set focus to the receiver.

	Implementation:
	Since Shoelace uses tabindex attributes to indicate the currently
	selected item for tabbing/cursor movement, update all sibligs to
	properly indicate the receiver has focus/is active."

	| menu |

	super focus.

	menu := self firstAncestorMatching: SlMenu asCssSelector.
	(menu allDescendantsMatching: self class asCssSelector) do: [ :each |
		each attributeAt: #tabindex put: (each == self
			ifTrue: [ '0' ]
			ifFalse: [ '-1' ]) ]
]

{ #category : 'accessing' }
WaMenuItem >> isChecked [

	^ self propertyAt: #checked
]

{ #category : 'accessing' }
WaMenuItem >> isDisabled [

	^ self propertyAt: #disabled
]

{ #category : 'accessing' }
WaMenuItem >> isEnabled [

	"Convenience method to test if receiver is enabled"

	^ self isDisabled not
]

{ #category : 'accessing' }
WaMenuItem >> label [

	"Answer the label HTML element of the receiver.
	For a simple String value use #labelText instead."

	^ self firstChildAtSlotNamed: nil
]

{ #category : 'accessing' }
WaMenuItem >> label: aStringOrElement [

	"Set the label to the specified Element.
	For a simple String value use #labelText: instead."

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]

{ #category : 'accessing' }
WaMenuItem >> labelText [

	"Answer the label text (a String) of the receiver.
	For richer HTML element use #label instead."

	^ self textContent
]

{ #category : 'accessing' }
WaMenuItem >> labelText: aString [

	"Set the label text to the specified String value.
	For richer HTML element use #label: instead."

	self textContent: aString
]

{ #category : 'accessing' }
WaMenuItem >> prefix [

	^ self firstChildAtSlotNamed: #prefix
]

{ #category : 'accessing' }
WaMenuItem >> prefix: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #prefix
]

{ #category : 'accessing' }
WaMenuItem >> suffix [

	^ self firstChildAtSlotNamed: #suffix
]

{ #category : 'accessing' }
WaMenuItem >> suffix: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #suffix
]

{ #category : 'accessing' }
WaMenuItem >> value [

	^ self propertyAt: #value
]

{ #category : 'accessing' }
WaMenuItem >> value: aString [

	self propertyAt: #value put: aString asString
]
