Class {
	#name : 'WamObjectView',
	#superclass : 'WamLayoutComponentView',
	#instVars : [
		'fieldElements',
		'memento'
	],
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'class initialization' }
WamObjectView class >> beLoaded [

	WaCard beLoaded
]

{ #category : 'web resources' }
WamObjectView class >> style [

	<webResource: #css>

	^ '
#container {
  box-sizing: border-box;
  padding: var(--wa-space-xs);
}
'
]

{ #category : 'web resources' }
WamObjectView class >> template [

	<webResource: #html>

	^ WaElement linkUtilitiesCss, '
<slot name="fields"></slot>
<div id="container">
  <slot name="details"></slot>
</div>'
]

{ #category : 'rendering' }
WamObjectView >> changeMap [
	| map |

	map := Dictionary new.
	self fieldElements valuesDo: [ :each | | oldValue newValue |
		oldValue := self mementoAt: each name.
		newValue := each value.
		self systemLog logTrace: 'old: ', oldValue printString, ', new: ', newValue printString.
		oldValue ~= newValue ifTrue: [
			map at: each name put: newValue ] ].
	^ map
]

{ #category : 'rendering' }
WamObjectView >> fieldAt: key label: aLabel input: aText [
	| element |

	element := WaInput new
		appearanceBeFilled;
		name: key;
		addClass: 'wam-input';
		label: aLabel;
		value: aText;
		hint: 'Help text...', aLabel;
		disabled: true;
		yourself.

	self mementoAt: key put: aText.
	^ self fieldElementsAt: key put: element

]

{ #category : 'rendering' }
WamObjectView >> fieldAt: key label: aLabel switch: aBoolean [
	| element |

	element := WaSwitch new
		name: key;
		addClass: 'wam-switch';
		checked: aBoolean;
		replaceAllChildrenWith: aLabel asHtmlElement atSlotNamed: nil;
		replaceAllChildrenWith: ('Help text...' , aLabel) asHtmlElement atSlotNamed: #'help-text';
		disabled: true;
		yourself.

	self mementoAt: key put: aBoolean.
	^ self fieldElementsAt: key put: element
]

{ #category : 'rendering' }
WamObjectView >> fieldAt: key label: aLabel textarea: aText [
	| element |

	element := WaTextarea new
		appearanceBeFilled;
		name: key;
		addClass: 'wam-textarea';
		rows: 4;
		labelText: aLabel;
		value: aText;
		hintText: 'Help text...', aLabel;
		disabled: true;
		yourself.

	self mementoAt: key put: aText.
	^ self fieldElementsAt: key put: element

]

{ #category : 'accessing' }
WamObjectView >> fieldElements [

	^ fieldElements
]

{ #category : 'accessing' }
WamObjectView >> fieldElements: anObject [

	fieldElements := anObject
]

{ #category : 'accessing' }
WamObjectView >> fieldElementsAt: key put: element [

	^ self fieldElements at: key put: element
]

{ #category : 'initialization' }
WamObjectView >> fieldElementsClear [

	fieldElements := OrderedDictionary new.
]

{ #category : 'rendering' }
WamObjectView >> fieldFor: fieldInfo map: map [
	| fieldName fieldType fieldLabel fieldValue |

	fieldName := fieldInfo key.
	fieldType := fieldInfo value.
	fieldLabel := fieldName capitalized.
	fieldValue := (map at: fieldName).

	fieldType = #string ifTrue: [
		^ self fieldAt: fieldName label: fieldName capitalized input: fieldValue ].

	fieldType = #textarea ifTrue: [
		^ self fieldAt: fieldName label: fieldName capitalized textarea: fieldValue ].

	fieldType = #boolean ifTrue: [
		^ self fieldAt: fieldName label: fieldName capitalized switch: fieldValue ].

	fieldType = #date ifTrue: [
		^ self fieldAt: fieldName label: fieldName capitalized input: fieldValue asString ].

]

{ #category : 'rendering' }
WamObjectView >> fields: list map: map [
	| fields |

	self fieldElementsClear.
	fields := #div asHtmlTag
		addClass: 'wa-grid';
		addClass: 'wa-gap-xs';
		customPropertyAt: 'min-column-size' put: '40ch';
		yourself.
	list do: [ :each |
		fields appendChild: (#div asHtmlTag appendChild: (self fieldFor: each map: map)) ].

	^ fields

]

{ #category : 'rendering' }
WamObjectView >> fields: list map: map slot: slotName [
	| element |

	element := self fields: list map: map.
	self replaceAllChildrenWith: element atSlotNamed: slotName.

]

{ #category : 'rendering' }
WamObjectView >> fieldsInExpansion: list map: map summary: summary open: aBoolean slot: slotName [
	| element expansion |

	element := self fields: list map: map.

	expansion := WaDetails new
		addClass: 'wam-details';
		propertyAt: 'summary' put: summary;
		propertyAt: 'open' put: aBoolean;
		appendChild: element;
		yourself.

	self replaceAllChildrenWith: expansion atSlotNamed: slotName.


]

{ #category : 'initialization' }
WamObjectView >> initialize [

	super initialize.

	memento := OrderedDictionary new.
	fieldElements := OrderedDictionary new.

]

{ #category : 'accessing' }
WamObjectView >> memento [

	^ memento
]

{ #category : 'accessing' }
WamObjectView >> memento: anObject [

	memento := anObject
]

{ #category : 'accessing' }
WamObjectView >> mementoAt: key [

	^ self memento at: key
]

{ #category : 'accessing' }
WamObjectView >> mementoAt: key put: element [

	self memento at: key put: element
]

{ #category : 'rendering' }
WamObjectView >> setEditable: aBoolean [
	| first index |

	index := 1.
	first := true.
	self fieldElements valuesDo: [ :each |
		self systemLog logTrace: each name asString.
		each disabled: aBoolean not.
		"(first and: [ aBoolean ])" each name = 'text' ifTrue: [
			self systemLog logTrace: 'focus() - ', each printString.
			each focus.
			"each attributeAt: 'autofocus' put: true."
			"each autofocus: true."
			first := false ].
		"each removeAttributeAt: #readonly"
		index := index + 1 ].

]
