Class {
	#name : 'WaOption',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'instance creation' }
WaOption class >> value: aSymbol label: aStringOrElement [

	^ self new
		value: aSymbol ;
		label: aStringOrElement ;
		yourself
]

{ #category : 'instance creation' }
WaOption class >> value: aSymbol labelText: aString [

	^ self new
		value: aSymbol ;
		labelText: aString ;
		yourself
]

{ #category : 'accessing' }
WaOption >> beDisabled [

	self disabled: true
]

{ #category : 'accessing' }
WaOption >> beEnabled [

	"Convenience method to make receiver enabled"

	self disabled: false
]

{ #category : 'accessing style' }
WaOption >> beNotDisabled [

	self disabled: false
]

{ #category : 'accessing' }
WaOption >> beNotEnabled [

	"Convenience method to clear the enabled state of the receiver"

	self disabled: true
]

{ #category : 'copying' }
WaOption >> clone [

	"Deep clone the receiver.

	Implementation:
	Set the (non reflecting properties explicitly)."

	^ super clone
		value: self value ;
		yourself

]

{ #category : 'accessing' }
WaOption >> disabled: aBoolean [

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'accessing' }
WaOption >> enabled: aBoolean [

	"Convenience method to set receiver's enabled state"

	self disabled: aBoolean not
]

{ #category : 'accessing' }
WaOption >> isDisabled [

	^ self propertyAt: #disabled
]

{ #category : 'accessing' }
WaOption >> isEnabled [

	"Convenience method to test if receiver is enabled"

	^ self isDisabled not
]

{ #category : 'accessing' }
WaOption >> label [

	"Answer the label HTML element of the receiver.
	For a simple String value use #labelText instead."

	^ self firstChildAtSlotNamed: nil
]

{ #category : 'accessing' }
WaOption >> label: aStringOrElement [

	"Set the label to the specified Element.
	For a simple String value use #labelText: instead."

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]

{ #category : 'accessing' }
WaOption >> labelText [

	"Answer the label text (a String) of the receiver.
	For richer HTML element use #label instead."

	^ self textContent
]

{ #category : 'accessing' }
WaOption >> labelText: aString [

	"Set the label text to the specified String value.
	For richer HTML element use #label: instead."

	self textContent: aString
]

{ #category : 'accessing' }
WaOption >> prefix [

	^ self firstChildAtSlotNamed: #prefix
]

{ #category : 'accessing' }
WaOption >> prefix: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #prefix
]

{ #category : 'accessing' }
WaOption >> suffix [

	^ self firstChildAtSlotNamed: #suffix
]

{ #category : 'accessing' }
WaOption >> suffix: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #suffix
]

{ #category : 'accessing' }
WaOption >> value [

	self flag: #todo. "Temporary fix for values with spaces in them (replace by non-breakable space)."

	^ (self propertyAt: #value) replaceAll: (Character value: 160) with: Character space
]

{ #category : 'accessing' }
WaOption >> value: aString [

	self flag: #todo. "Temporary fix for values with spaces in them (replace by non-breakable space)."

	self propertyAt: #value put: (aString asString replaceAll: Character space with: (Character value: 160))
]
