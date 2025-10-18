Class {
	#name : 'WaCheckControl',
	#superclass : 'WaFormControl',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'tags' }
WaCheckControl class >> isAbstractTag [

	"The method is present to indicate the receiver is abstract.
	This method will NOT be evaluated to decide if the receiver is abstract."
]

{ #category : 'accessing style' }
WaCheckControl >> beChecked [

	self checked: true
]

{ #category : 'accessing style' }
WaCheckControl >> beNotChecked [

	self checked: false
]

{ #category : 'accessing' }
WaCheckControl >> checked: aBoolean [

	self propertyAt: #checked put: aBoolean
]

{ #category : 'actions' }
WaCheckControl >> click [

	"Simulate a click on the checkbox"

	self apply: #click withArguments: #()
]

{ #category : 'testing' }
WaCheckControl >> isChecked [

	^ self propertyAt: #checked
]

{ #category : 'accessing' }
WaCheckControl >> label [

	"Answer the label HTML element of the receiver.
	For a simple String value use #labelText instead."

	^ self firstChildAtSlotNamed: nil
]

{ #category : 'accessing' }
WaCheckControl >> label: aStringOrElement [

	"Set the label to the specified Element.
	For a simple String value use #labelText: instead."

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]

{ #category : 'accessing' }
WaCheckControl >> labelText [

	"Answer the label text (a String) of the receiver.
	For richer HTML element use #label instead."

	^ self textContent
]

{ #category : 'accessing' }
WaCheckControl >> labelText: aString [

	"Set the label text to the specified String value.
	For richer HTML element use #label: instead."

	self textContent: aString
]
