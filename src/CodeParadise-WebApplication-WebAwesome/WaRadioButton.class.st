Class {
	#name : 'WaRadioButton',
	#superclass : 'WaFormControl',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing style' }
WaRadioButton >> beChecked [

	self checked: true
]

{ #category : 'accessing size' }
WaRadioButton >> beLarge [

	self size: #large
]

{ #category : 'accessing size' }
WaRadioButton >> beMedium [

	self size: #medium
]

{ #category : 'accessing style' }
WaRadioButton >> beNotChecked [

	self checked: false
]

{ #category : 'accessing style' }
WaRadioButton >> beNotPill [

	self pill: false
]

{ #category : 'accessing style' }
WaRadioButton >> bePill [

	self pill: true
]

{ #category : 'accessing size' }
WaRadioButton >> beSmall [

	self size: #small
]

{ #category : 'accessing' }
WaRadioButton >> checked: aBoolean [

	self propertyAt: #checked put: aBoolean
]

{ #category : 'actions' }
WaRadioButton >> click [

	"Simulate a click on the checkbox"

	self apply: #click withArguments: #()
]

{ #category : 'testing' }
WaRadioButton >> isChecked [

	^ self propertyAt: #checked
]

{ #category : 'testing' }
WaRadioButton >> isPill [

	^ self propertyAt: #pill
]

{ #category : 'accessing' }
WaRadioButton >> label [

	"Answer the label HTML element of the receiver.
	For a simple String value use #labelText instead."

	^ self firstChildAtSlotNamed: nil
]

{ #category : 'accessing' }
WaRadioButton >> label: aStringOrElement [

	"Set the label to the specified Element.
	For a simple String value use #labelText: instead."

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]

{ #category : 'accessing' }
WaRadioButton >> labelText [

	"Answer the label text (a String) of the receiver.
	For richer HTML element use #label instead."

	^ self textContent
]

{ #category : 'accessing' }
WaRadioButton >> labelText: aString [

	"Set the label text to the specified String value.
	For richer HTML element use #label: instead."

	self textContent: aString
]

{ #category : 'accessing' }
WaRadioButton >> pill: aBoolean [

	self propertyAt: #pill put: aBoolean
]

{ #category : 'accessing' }
WaRadioButton >> prefix [

	^ self firstChildAtSlotNamed: #prefix
]

{ #category : 'accessing' }
WaRadioButton >> prefix: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #prefix
]

{ #category : 'accessing' }
WaRadioButton >> size [

	^ self propertyAt: #size
]

{ #category : 'accessing' }
WaRadioButton >> size: aString [

	self propertyAt: #size put: aString
]

{ #category : 'accessing' }
WaRadioButton >> suffix [

	^ self firstChildAtSlotNamed: #suffix
]

{ #category : 'accessing' }
WaRadioButton >> suffix: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #suffix
]
