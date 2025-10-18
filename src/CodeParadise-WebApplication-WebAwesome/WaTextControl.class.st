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
WaTextControl >> autocapitalize [

	^ self propertyAt: #autocapitalize
]

{ #category : 'accessing' }
WaTextControl >> autocapitalize: aString [

	self propertyAt: #autocapitalize put: aString
]

{ #category : 'accessing style' }
WaTextControl >> autocapitalizeCharacters [

	self autocapitalize: #characters
]

{ #category : 'accessing style' }
WaTextControl >> autocapitalizeNone [

	self autocapitalize: #none
]

{ #category : 'accessing style' }
WaTextControl >> autocapitalizeOff [

	self autocapitalize: #off
]

{ #category : 'accessing style' }
WaTextControl >> autocapitalizeOn [

	self autocapitalize: #on
]

{ #category : 'accessing style' }
WaTextControl >> autocapitalizeSentences [

	self autocapitalize: #sentences
]

{ #category : 'accessing style' }
WaTextControl >> autocapitalizeWords [

	self autocapitalize: #words
]

{ #category : 'accessing' }
WaTextControl >> autocomplete [

	^ self propertyAt: #autocomplete
]

{ #category : 'accessing' }
WaTextControl >> autocomplete: aString [

	self propertyAt: #autocomplete put: aString
]

{ #category : 'accessing' }
WaTextControl >> autocorrect [

	^ self propertyAt: #autocorrect
]

{ #category : 'accessing' }
WaTextControl >> autocorrect: aString [

	self propertyAt: #autocorrect put: aString
]

{ #category : 'accessing' }
WaTextControl >> autofocus: aBoolean [

	self propertyAt: #autofocus put: aBoolean
]

{ #category : 'accessing style' }
WaTextControl >> beAutofocus [

	self autofocus: true
]

{ #category : 'accessing style' }
WaTextControl >> beFilled [

	self filled: true
]

{ #category : 'accessing size' }
WaTextControl >> beLarge [

	self size: #large
]

{ #category : 'accessing size' }
WaTextControl >> beMedium [

	self size: #medium
]

{ #category : 'accessing style' }
WaTextControl >> beNotAutofocus [

	self autofocus: false
]

{ #category : 'accessing style' }
WaTextControl >> beNotFilled [

	self filled: false
]

{ #category : 'accessing style' }
WaTextControl >> beNotReadonly [

	self readonly: false
]

{ #category : 'accessing style' }
WaTextControl >> beNotSpellcheck [

	self spellcheck: false
]

{ #category : 'accessing style' }
WaTextControl >> beReadonly [

	self readonly: true
]

{ #category : 'accessing size' }
WaTextControl >> beSmall [

	self size: #small
]

{ #category : 'accessing style' }
WaTextControl >> beSpellcheck [

	self spellcheck: true
]

{ #category : 'accessing' }
WaTextControl >> filled: aBoolean [

	self propertyAt: #filled put: aBoolean
]

{ #category : 'accessing' }
WaTextControl >> hint [

	"Answer the help HTML element of the receiver.
	For a simple String value use #helpText instead."

	^ self firstChildAtSlotNamed: #'hint'
]

{ #category : 'accessing' }
WaTextControl >> hint: aStringOrElement [

	"Set the help text to the specified Element.
	For a simple String value use #helpText: instead."

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #'hint'
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
WaTextControl >> inputmode [

	^ self propertyAt: #inputmode
]

{ #category : 'accessing' }
WaTextControl >> inputmode: aString [

	self propertyAt: #inputmode put: aString
]

{ #category : 'accessing style' }
WaTextControl >> inputmodeDecimal [

	self inputmode: #decimal
]

{ #category : 'accessing style' }
WaTextControl >> inputmodeEmail [

	self inputmode: #email
]

{ #category : 'accessing style' }
WaTextControl >> inputmodeNone [

	self inputmode: #none
]

{ #category : 'accessing style' }
WaTextControl >> inputmodeNumeric [

	self inputmode: #numeric
]

{ #category : 'accessing style' }
WaTextControl >> inputmodeSearch [

	self inputmode: #search
]

{ #category : 'accessing style' }
WaTextControl >> inputmodeTel [

	self inputmode: #tel
]

{ #category : 'accessing style' }
WaTextControl >> inputmodeText [

	self inputmode: #text
]

{ #category : 'accessing style' }
WaTextControl >> inputmodeUrl [

	self inputmode: #url
]

{ #category : 'testing' }
WaTextControl >> isAutofocus [

	^ self propertyAt: #autofocus
]

{ #category : 'testing' }
WaTextControl >> isFilled [

	^ self propertyAt: #filled
]

{ #category : 'testing' }
WaTextControl >> isReadonly [

	^ self propertyAt: #readonly
]

{ #category : 'testing' }
WaTextControl >> isSpellcheck [

	^ self propertyAt: #spellcheck
]

{ #category : 'accessing' }
WaTextControl >> label [

	"Answer the label HTML element of the receiver.
	For a simple String value use #labelText instead."

	^ self firstChildAtSlotNamed: #label
]

{ #category : 'accessing' }
WaTextControl >> label: aStringOrElement [

	"Set the label to the specified Element.
	For a simple String value use #labelText: instead."

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #label
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

{ #category : 'accessing' }
WaTextControl >> maxlength [

	^ self propertyAt: #maxlength
]

{ #category : 'accessing' }
WaTextControl >> maxlength: aNumber [

	self propertyAt: #maxlength put: aNumber
]

{ #category : 'accessing' }
WaTextControl >> minlength [

	^ self propertyAt: #minlength
]

{ #category : 'accessing' }
WaTextControl >> minlength: aNumber [

	self propertyAt: #minlength put: aNumber
]

{ #category : 'accessing' }
WaTextControl >> pattern [

	^ self propertyAt: #pattern
]

{ #category : 'accessing' }
WaTextControl >> pattern: aString [

	self propertyAt: #pattern put: aString
]

{ #category : 'accessing' }
WaTextControl >> placeholder [

	^ self propertyAt: #placeholder
]

{ #category : 'accessing' }
WaTextControl >> placeholder: aString [

	self propertyAt: #placeholder put: aString
]

{ #category : 'accessing' }
WaTextControl >> readonly: aBoolean [

	self propertyAt: #readonly put: aBoolean
]

{ #category : 'actions' }
WaTextControl >> select [

	"Selects all the text in the input."

	self apply: #select withArguments: #()
]

{ #category : 'actions' }
WaTextControl >> setRangeTextReplace: replaceString from: startNumber to: endNumber selectMode: modeString [

	"Replaces a range of text with a new string.
	The direction String should be one of: 'select' | 'start' | 'end' | 'preserve'"

	self apply: #setRangeText withArguments: { replaceString . startNumber . endNumber . modeString }
]

{ #category : 'actions' }
WaTextControl >> setSelectionRangeFrom: startNumber to: endNumber direction: directionString [

	"Sets the start and end positions of the text selection (0-based).
	The direction String should be one of: 'forward' | 'backward' | 'none'"

	self apply: #setSelectionRange withArguments: { startNumber . endNumber . directionString }
]

{ #category : 'accessing' }
WaTextControl >> size [

	^ self propertyAt: #size
]

{ #category : 'accessing' }
WaTextControl >> size: aString [

	self propertyAt: #size put: aString
]

{ #category : 'accessing' }
WaTextControl >> spellcheck: aBoolean [

	self propertyAt: #spellcheck put: aBoolean
]
