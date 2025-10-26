Class {
	#name : 'WaFormControl',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Abstract',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Abstract'
}

{ #category : 'tags' }
WaFormControl class >> isAbstractTag [

	"The method is present to indicate the receiver is abstract.
	This method will NOT be evaluated to decide if the receiver is abstract."
]

{ #category : 'accessing style' }
WaFormControl >> beDisabled [

	self disabled: true
]

{ #category : 'accessing style' }
WaFormControl >> beEnabled [

	"Convenience method to make receiver enabled"

	self disabled: false
]

{ #category : 'accessing style' }
WaFormControl >> beInvalid [

	self invalid: true
]

{ #category : 'accessing style' }
WaFormControl >> beNotDisabled [

	self disabled: false
]

{ #category : 'accessing style' }
WaFormControl >> beNotEnabled [

	"Convenience method to clear the enabled state of the receiver"

	self disabled: true
]

{ #category : 'accessing style' }
WaFormControl >> beNotInvalid [

	self invalid: false
]

{ #category : 'accessing style' }
WaFormControl >> beNotRequired [

	self required: false
]

{ #category : 'accessing style' }
WaFormControl >> beRequired [

	self required: true
]

{ #category : 'actions' }
WaFormControl >> blur [

	"Removes focus from the input."

	self removeFocus
]

{ #category : 'accessing' }
WaFormControl >> defaultValue [

	^ self propertyAt: #defaultValue
]

{ #category : 'accessing' }
WaFormControl >> defaultValue: anObject [

	"Set the receiver's default value.

	The type is depending on the receiver. E.g. SlRange has Number, SlInput has String"

	self propertyAt: #defaultValue put: anObject
]

{ #category : 'accessing' }
WaFormControl >> disabled: aBoolean [

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'accessing' }
WaFormControl >> enabled: aBoolean [

	"Convenience method to set receiver's enabled state"

	self disabled: aBoolean not
]

{ #category : 'accessing' }
WaFormControl >> hintText [

	"Answer the help text (a String) of the receiver.
	For richer HTML element use #help instead."

	^ self hint
		ifNotNil: [ :hint | hint textContent ]
		ifNil: [ '' ]
]

{ #category : 'accessing' }
WaFormControl >> hintText: aString [

	"Set the help text to the specified String value.
	For richer HTML element use #help: instead."

	self hint: aString asHtmlElement
]

{ #category : 'accessing' }
WaFormControl >> invalid: aBoolean [

	self propertyAt: #invalid put: aBoolean
]

{ #category : 'testing' }
WaFormControl >> isDisabled [

	^ self propertyAt: #disabled
]

{ #category : 'testing' }
WaFormControl >> isEnabled [

	"Convenience method to test if receiver is enabled"

	^ self isDisabled not
]

{ #category : 'testing' }
WaFormControl >> isInvalid [

	^ self propertyAt: #invalid
]

{ #category : 'testing' }
WaFormControl >> isRequired [

	^ self propertyAt: #required
]

{ #category : 'accessing' }
WaFormControl >> labelText [

	"Answer the label text (a String) of the receiver.
	For richer HTML element use #label instead."

	^ self label
		ifNotNil: [ :label | label textContent ]
		ifNil: [ '' ]
]

{ #category : 'accessing' }
WaFormControl >> labelText: aString [

	"Set the label text to the specified String value.
	For richer HTML element use #label: instead."

	self label: aString asHtmlElement
]

{ #category : 'accessing' }
WaFormControl >> name [

	^ self propertyAt: #name
]

{ #category : 'accessing' }
WaFormControl >> name: aString [

	self propertyAt: #name put: aString
]

{ #category : 'actions' }
WaFormControl >> reportValidity [
 
	"Checks for validity and shows the browser's validation message if the control is invalid."

	self apply: #reportValidity withArguments: #()
]

{ #category : 'accessing' }
WaFormControl >> required: aBoolean [

	self propertyAt: #required put: aBoolean
]

{ #category : 'actions' }
WaFormControl >> setCustomValidity: aString [ 

	"Sets a custom validation message. If message is not empty, the field will be considered invalid."

	self apply: #setCustomValidity withArguments: { aString }
]

{ #category : 'accessing' }
WaFormControl >> value [

	^ self propertyAt: #value
]

{ #category : 'accessing' }
WaFormControl >> value: aString [

	self propertyAt: #value put: aString
]
