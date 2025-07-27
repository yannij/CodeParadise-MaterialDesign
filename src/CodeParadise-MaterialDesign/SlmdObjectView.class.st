Class {
	#name : 'SlmdObjectView',
	#superclass : 'SlmdLayoutComponentView',
	#instVars : [
		'fieldElements',
		'memento'
	],
	#category : 'CodeParadise-MaterialDesign-TinyBlogApp',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'TinyBlogApp'
}

{ #category : 'rendering' }
SlmdObjectView >> changeMap [
	| map |

	map := Dictionary new.
	self fieldElements valuesDo: [ :each | | oldValue newValue |
		oldValue := self memento at: each name.
		newValue := each slmdValue.
		oldValue ~= newValue ifTrue: [
			map at: each name put: each slmdValue ] ].
	^ map
]

{ #category : 'rendering' }
SlmdObjectView >> fieldAt: key label: aLabel switch: aBoolean [
	| element |

	element := SlSwitch new
		name: key;
		addClass: 'slmd-switch';
		checked: aBoolean;
		replaceAllChildrenWith: aLabel asHtmlElement atSlotNamed: nil;
		replaceAllChildrenWith: ('Help text...' , aLabel) asHtmlElement atSlotNamed: #'help-text';
		"attributeAdd: #readonly;"
		disabled: true;
		yourself.

	self mementoAt: key put: aBoolean.
	^ self fieldElementsAt: key put: element
]

{ #category : 'rendering' }
SlmdObjectView >> fieldAt: key label: aLabel text: aText [
	| element |

	element := SlInput new
		name: key;
		addClass: 'slmd-input';
		labelText: aLabel;
		value: aText;
		helpText: 'Help text...', aLabel;
		"attributeAdd: #readonly;"
		disabled: true;
		attributeAdd: #filled;
		yourself.

	self mementoAt: key put: aText.
	^ self fieldElementsAt: key put: element

]

{ #category : 'rendering' }
SlmdObjectView >> fieldAt: key label: aLabel textarea: aText [
	| element |

	element := SlTextarea new
		name: key;
		addClass: 'slmd-textarea';
		rows: 4;
		labelText: aLabel;
		value: aText;
		helpText: 'Help text...', aLabel;
		"attributeAdd: #readonly;"
		disabled: true;
		attributeAdd: #filled;
		yourself.

	self mementoAt: key put: aText.
	^ self fieldElementsAt: key put: element

]

{ #category : 'accessing' }
SlmdObjectView >> fieldElements [

	^ fieldElements
]

{ #category : 'accessing' }
SlmdObjectView >> fieldElements: anObject [

	fieldElements := anObject
]

{ #category : 'accessing' }
SlmdObjectView >> fieldElementsAt: key put: element [

	^ self fieldElements at: key put: element
]

{ #category : 'initialization' }
SlmdObjectView >> initialize [

	super initialize.

	memento := OrderedDictionary new.
	fieldElements := OrderedDictionary new.

]

{ #category : 'accessing' }
SlmdObjectView >> memento [

	^ memento
]

{ #category : 'accessing' }
SlmdObjectView >> memento: anObject [

	memento := anObject
]

{ #category : 'accessing' }
SlmdObjectView >> mementoAt: key put: element [

	^ self memento at: key put: element
]

{ #category : 'rendering' }
SlmdObjectView >> setEditable: aBoolean [
	| first index |

	index := 1.
	first := true.
	self fieldElements valuesDo: [ :each |
		self logTrace: each name asString.
		each disabled: aBoolean not.
		"(first and: [ aBoolean ])" each name = 'text' ifTrue: [
			self logTrace: 'focus() - ', each printString.
			each focus.
			"each attributeAt: 'autofocus' put: true."
			"each autofocus: true."
			first := false ].
		"each removeAttributeAt: #readonly"
		index := index + 1 ].

]
