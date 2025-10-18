Class {
	#name : 'WaAbstractPrompter',
	#superclass : 'WaElement',
	#instVars : [
		'defaultFocusElement'
	],
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'tags' }
WaAbstractPrompter class >> isAbstractTag [

	"The method is present to indicate the receiver is abstract.
	This method will NOT be evaluated to decide if the receiver is abstract."
]

{ #category : 'accessing' }
WaAbstractPrompter class >> label: aStringOrElement [

	^ self new
		label: aStringOrElement ;
		yourself
]

{ #category : 'accessing' }
WaAbstractPrompter >> beHeader [

	"Convenience method"

	self noHeader: false
]

{ #category : 'accessing' }
WaAbstractPrompter >> beModal [

	self lightDismiss: false
]

{ #category : 'accessing' }
WaAbstractPrompter >> beNoHeader [

	self noHeader: true
]

{ #category : 'accessing' }
WaAbstractPrompter >> beNotHeader [

	"Convenience method"

	self noHeader: true
]

{ #category : 'accessing' }
WaAbstractPrompter >> beNotModal [

	self lightDismiss: true
]

{ #category : 'accessing' }
WaAbstractPrompter >> beNotNoHeader [

	self noHeader: false
]

{ #category : 'accessing' }
WaAbstractPrompter >> beNotOpen [

	self open: false

]

{ #category : 'accessing' }
WaAbstractPrompter >> beOpen [

	self open: true

]

{ #category : 'accessing' }
WaAbstractPrompter >> content [

	"Answer the content HTML element of the receiver.
	For a simple String value use #contentText instead."

	^ self firstChildAtSlotNamed: nil
]

{ #category : 'accessing' }
WaAbstractPrompter >> content: aStringOrElement [

	"Set the content to the specified Element.
	For a simple String value use #contentText: instead."

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]

{ #category : 'accessing' }
WaAbstractPrompter >> contentText [

	"Answer the content text (a String) of the receiver.
	For richer HTML element use #content instead."

	^ self textContent
]

{ #category : 'accessing' }
WaAbstractPrompter >> contentText: aString [

	"Set the content text to the specified String value.
	For richer HTML element use #content: instead."

	self textContent: aString
]

{ #category : 'accessing' }
WaAbstractPrompter >> defaultFocusElement [

	^ defaultFocusElement
]

{ #category : 'accessing' }
WaAbstractPrompter >> defaultFocusElement: anElement [

	defaultFocusElement := anElement
]

{ #category : 'accessing' }
WaAbstractPrompter >> footer [

	"Answer the footer HTML element of the receiver.
	For a simple String value use #footerText instead."

	^ self firstChildAtSlotNamed: #footer
]

{ #category : 'accessing' }
WaAbstractPrompter >> footer: aStringOrElement [

	"Set the footer to the specified Element.
	For a simple String value use #footerText: instead."

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #footer
]

{ #category : 'accessing' }
WaAbstractPrompter >> footerText [

	"Answer the footer text (a String) of the receiver.
	For richer HTML element use #footer instead."

	^ self footer
		ifNotNil: [ :footer | footer textContent ]
		ifNil: [ '' ]
]

{ #category : 'accessing' }
WaAbstractPrompter >> footerText: aString [

	"Set the footer text to the specified String value.
	For richer HTML element use #footer: instead."

	self footer: aString asHtmlElement
]

{ #category : 'testing' }
WaAbstractPrompter >> hasDefaultFocusElement [

	^ defaultFocusElement isNotNil
]

{ #category : 'initialization' }
WaAbstractPrompter >> initialize [

	super initialize.

	self beNotModal.

	self
		"when: WaRequestCloseEvent send: #onModalRequestClose: to: self ;"
		when: WaInitialFocusEvent send: #onInitialFocus: to: self
]

{ #category : 'testing' }
WaAbstractPrompter >> isHeader [

	"Convenience method"

	^ self isNoHeader not
]

{ #category : 'testing' }
WaAbstractPrompter >> isNoHeader [

	^ self propertyAt: #noHeader
]

{ #category : 'testing' }
WaAbstractPrompter >> isOpen [

	^ self propertyAt: #open

]

{ #category : 'accessing' }
WaAbstractPrompter >> label [

	"Answer the label HTML element of the receiver.
	For a simple String value use #labelText instead."

	^ self firstChildAtSlotNamed: #label
]

{ #category : 'accessing' }
WaAbstractPrompter >> label: aStringOrElement [

	"Set the label to the specified Element.
	For a simple String value use #labelText: instead."

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #label
]

{ #category : 'accessing' }
WaAbstractPrompter >> labelText [

	"Answer the label text (a String) of the receiver.
	For richer HTML element use #content instead."

	^ self label
		ifNotNil: [ :label | label textContent ]
		ifNil: [ '' ]
]

{ #category : 'accessing' }
WaAbstractPrompter >> labelText: aString [

	"Set the label text to the specified String value.
	For richer HTML element use #content: instead."

	self label: aString asHtmlElement
]

{ #category : 'accessing' }
WaAbstractPrompter >> lightDismiss [

	^ (self attributeAt: #'light-dismiss') notNil
]

{ #category : 'accessing' }
WaAbstractPrompter >> lightDismiss: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #'light-dismiss' ]
		ifFalse: [ self removeAttributeAt: #'light-dismiss' ]
]

{ #category : 'accessing' }
WaAbstractPrompter >> noHeader: aBoolean [

	self propertyAt: #noHeader put: aBoolean
]

{ #category : 'event handling' }
WaAbstractPrompter >> onInitialFocus: anInitialFocusEvent [

	self hasDefaultFocusElement
		ifFalse: [ ^ self ].

	anInitialFocusEvent preventDefault.
	self defaultFocusElement focus

]

{ #category : 'accessing' }
WaAbstractPrompter >> open: aBoolean [

	self propertyAt: #open put: aBoolean

]

{ #category : 'accessing' }
WaAbstractPrompter >> resetDefaultFocusElement [

	defaultFocusElement := nil
]

{ #category : 'actions' }
WaAbstractPrompter >> showFocusing: anElement [

	"Show the receiver and set focus on the specified Element"

	self
		defaultFocusElement: anElement ;
		beOpen
]

{ #category : 'actions' }
WaAbstractPrompter >> showModal [

	"Show the receiver in modal mode"

	self
		beNoHeader ;
		beModal ;
		beOpen

]

{ #category : 'actions' }
WaAbstractPrompter >> showModalFocusing: anElement [

	"Show the receiver modally and set focus on the specified Element"

	self
		defaultFocusElement: anElement ;
		showModal
]

{ #category : 'actions' }
WaAbstractPrompter >> showNonModal [

	"Show the receiver in non modal mode"

	self
		beHeader ;
		beNotModal ;
		beOpen

]
