Class {
	#name : 'WaTextControl',
	#superclass : 'WaFormControl',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'tags' }
WaTextControl class >> isAbstractTag [

	"The method is present to indicate the receiver is abstract.
	This method will NOT be evaluated to decide if the receiver is abstract."
]

{ #category : 'accessing' }
WaTextControl class >> label: aStringOrElement [

	^ self new
		label: aStringOrElement ;
		yourself

]

{ #category : 'accessing' }
WaTextControl >> hintText [

	"Answer the help text (a String) of the receiver.
	For richer HTML element use #help instead."

	^ self hint
		ifNotNil: [ :hint | hint textContent ]
		ifNil: [ '' ]
]

{ #category : 'accessing' }
WaTextControl >> hintText: aString [

	"Set the help text to the specified String value.
	For richer HTML element use #help: instead."

	self hint: aString asHtmlElement
]

{ #category : 'accessing' }
WaTextControl >> labelText [

	"Answer the label text (a String) of the receiver.
	For richer HTML element use #label instead."

	^ self label
		ifNotNil: [ :label | label textContent ]
		ifNil: [ '' ]
]

{ #category : 'accessing' }
WaTextControl >> labelText: aString [

	"Set the label text to the specified String value.
	For richer HTML element use #label: instead."

	self label: aString asHtmlElement
]
