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

{ #category : 'properties' }
WaFormControl >> disabled: aBoolean [
	"See comment in #readonly:"

	self subclassResponsibility
]

{ #category : 'properties' }
WaFormControl >> hint [

	^ nil
]

{ #category : 'properties' }
WaFormControl >> hint: ignored [

	self subclassResponsibility
]

{ #category : 'properties' }
WaFormControl >> hintText [

	"Answer the hint text (a String) of the receiver.
	For richer HTML element use #hint instead."

	^ self hint
		ifNotNil: [ :hint | hint textContent ]
		ifNil: [ '' ]
]

{ #category : 'properties' }
WaFormControl >> hintText: aString [

	"Set the hint text to the specified String value.
	For richer HTML element use #hint instead."

	self hint: aString asHtmlElement
]

{ #category : 'properties' }
WaFormControl >> label [

	^ nil
]

{ #category : 'properties' }
WaFormControl >> label: ignored [

	self subclassResponsibility
]

{ #category : 'properties' }
WaFormControl >> labelText [

	"Answer the label text (a String) of the receiver.
	For richer HTML element use #label instead."

	^ self label
		ifNotNil: [ :label | label textContent ]
		ifNil: [ '' ]
]

{ #category : 'properties' }
WaFormControl >> labelText: aString [

	"Set the label text to the specified String value.
	For richer HTML element use #label: instead."

	self label: aString asHtmlElement
]

{ #category : 'properties' }
WaFormControl >> name [

	^ self propertyAt: #name
]

{ #category : 'properties' }
WaFormControl >> name: anObject [

	self propertyAt: #name put: anObject
]

{ #category : 'properties' }
WaFormControl >> readonly: aBoolean [
	"Set form element to read only.
	
	Some elements define a readonly property, and some do not.
	Use the disabled property, when readonly is not defined by the element,
	so readonly: can be the generic method name.

	Note that an input field has different text colour contrast between
	disabled and readonly."

	self disabled: aBoolean
]

{ #category : 'properties' }
WaFormControl >> value [

	^ self propertyAt: #value
]

{ #category : 'properties' }
WaFormControl >> value: anObject [

	self propertyAt: #value put: anObject
]
