Class {
	#name : 'WaSelect',
	#superclass : 'WaFormControl',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing' }
WaSelect >> beClearable [

	self clearable: true
]

{ #category : 'accessing' }
WaSelect >> beFilled [

	self filled: true
]

{ #category : 'accessing' }
WaSelect >> beHoist [

	self hoist: true
]

{ #category : 'accessing' }
WaSelect >> beLarge [

	self size: #large
]

{ #category : 'accessing' }
WaSelect >> beMedium [

	self size: #medium
]

{ #category : 'accessing' }
WaSelect >> beMultiple [

	self multiple: true
]

{ #category : 'accessing' }
WaSelect >> beNotClearable [

	self clearable: false
]

{ #category : 'accessing' }
WaSelect >> beNotFilled [

	self filled: false
]

{ #category : 'accessing' }
WaSelect >> beNotHoist [

	self hoist: false
]

{ #category : 'accessing' }
WaSelect >> beNotMultiple [

	self multiple: false
]

{ #category : 'accessing' }
WaSelect >> beNotPill [

	self pill: false
]

{ #category : 'accessing' }
WaSelect >> bePill [

	self pill: true
]

{ #category : 'accessing' }
WaSelect >> beSmall [

	self size: #small
]

{ #category : 'accessing' }
WaSelect >> clearIcon [

	self firstChildAtSlotNamed: #'clear-icon'
]

{ #category : 'accessing' }
WaSelect >> clearIcon: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #'clear-icon'
]

{ #category : 'accessing' }
WaSelect >> clearable: aBoolean [

	self propertyAt: #clearable put: aBoolean
]

{ #category : 'accessing' }
WaSelect >> clone [

	"Deep clone the receiver.

	Implementation:
	Set the (non reflecting properties explicitly)."

	^ super clone
		size: self size ;
		placeholder: self placeholder ;
		clearable: self isClearable ;
		yourself

]

{ #category : 'accessing' }
WaSelect >> filled: aBoolean [

	self propertyAt: #filled put: aBoolean
]

{ #category : 'testing' }
WaSelect >> hasFocus [

	"Answer whether the receiver or one of its options has focus"

	^ super hasFocus or: [ self = CpHtmlElement activeElement parent ]
]

{ #category : 'accessing' }
WaSelect >> help [

	"Answer the help HTML element of the receiver.
	For a simple String value use #helpText instead."

	^ self firstChildAtSlotNamed: #'help-text'
]

{ #category : 'accessing' }
WaSelect >> help: aStringOrElement [

	"Set the help text to the specified Element.
	For a simple String value use #helpText: instead."

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #'help-text'
]

{ #category : 'accessing' }
WaSelect >> helpText [

	"Answer the help text (a String) of the receiver.
	For richer HTML element use #help instead."

	^ self help textContent
]

{ #category : 'accessing' }
WaSelect >> helpText: aString [

	"Set the help text to the specified String value.
	For richer HTML element use #help: instead."

	self help: aString asHtmlElement
]

{ #category : 'accessing' }
WaSelect >> hoist: aBoolean [

	self propertyAt: #hoist put: aBoolean
]

{ #category : 'accessing' }
WaSelect >> isClearable [

	^ self propertyAt: #clearable
]

{ #category : 'accessing' }
WaSelect >> isFilled [

	^ self propertyAt: #filled
]

{ #category : 'accessing' }
WaSelect >> isHoist [

	^ self propertyAt: #hoist
]

{ #category : 'accessing' }
WaSelect >> isMultiple [

	^ self propertyAt: #multiple
]

{ #category : 'accessing' }
WaSelect >> isPill [

	^ self propertyAt: #pill
]

{ #category : 'accessing' }
WaSelect >> label [

	"Answer the label HTML element of the receiver.
	For a simple String value use #labelText instead."

	^ self firstChildAtSlotNamed: #label
]

{ #category : 'accessing' }
WaSelect >> label: aStringOrElement [

	"Set the label to the specified Element.
	For a simple String value use #labelText: instead."

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #label
]

{ #category : 'accessing' }
WaSelect >> labelText [

	"Answer the label text (a String) of the receiver.
	For richer HTML element use #label instead."

	^ self label
		ifNotNil: [ :label | label textContent ]
		ifNil: [ '' ]
]

{ #category : 'accessing' }
WaSelect >> labelText: aString [

	"Set the label text to the specified String value.
	For richer HTML element use #label: instead."

	self label: aString asHtmlElement
]

{ #category : 'accessing' }
WaSelect >> maxTagsVisible [

	^ self propertyAt: #maxTagsVisible
]

{ #category : 'accessing' }
WaSelect >> maxTagsVisible: aNumber [

	self propertyAt: #maxTagsVisible put: aNumber
]

{ #category : 'accessing' }
WaSelect >> multiple: aBoolean [

	self propertyAt: #multiple put: aBoolean
]

{ #category : 'accessing' }
WaSelect >> pill: aBoolean [

	self propertyAt: #pill put: aBoolean
]

{ #category : 'accessing' }
WaSelect >> placeholder [

	^ self propertyAt: #placeholder
]

{ #category : 'accessing' }
WaSelect >> placeholder: aString [

	self propertyAt: #placeholder put: aString
]

{ #category : 'accessing' }
WaSelect >> prefix [

	^ self firstChildAtSlotNamed: #prefix
]

{ #category : 'accessing' }
WaSelect >> prefix: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #prefix
]

{ #category : 'accessing' }
WaSelect >> size [

	^ self propertyAt: #size
]

{ #category : 'accessing' }
WaSelect >> size: aString [

	self propertyAt: #size put: aString
]

{ #category : 'accessing' }
WaSelect >> suffix [

	^ self firstChildAtSlotNamed: #suffix
]

{ #category : 'accessing' }
WaSelect >> suffix: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #suffix
]

{ #category : 'accessing' }
WaSelect >> value [

	self flag: #todo. "Temporary fix for values with spaces in them (replace by non-breakable space)."

	^ super value replaceAll: (Character value: 160) with: Character space
]

{ #category : 'accessing' }
WaSelect >> value: aString [

	self flag: #todo. "Temporary fix for values with spaces in them (replace by non-breakable space)."

	^ super value: (aString asString replaceAll: Character space with: (Character value: 160))
]
