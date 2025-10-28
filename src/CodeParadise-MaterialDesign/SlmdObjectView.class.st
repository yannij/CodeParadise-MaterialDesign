Class {
	#name : 'SlmdObjectView',
	#superclass : 'SlmdLayoutComponentView',
	#instVars : [
		'fieldElements',
		'memento'
	],
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'class initialization' }
SlmdObjectView class >> beLoaded [

	WaCard beLoaded
]

{ #category : 'web resources' }
SlmdObjectView class >> globalStyle [

	<webResource: #css>

	^ '
:root,
:host,
.sl-theme-light {
  --sl-focus-ring-style: none;
}

.slmd-input::part(input):disabled, .slmd-textarea::part(textarea):disabled {
  --sl-input-color: #000000;
}

sl-input, sl-textarea {
  box-sizing: content-box;
  --sl-input-filled-background-color-focus: #E6E0E9;
}

sl-input {
  --sl-input-height-medium: 56px;
}

.slmd-fields {
  display: flex;
  flex-direction: column;
  gap: 16px;
  padding: 8px;
  background: var(--wa-color-brand-80);
}
'
, self globalStyleInput
, self globalStyleTextarea
, self globalStyleSwitch
]

{ #category : 'web resources' }
SlmdObjectView class >> globalStyleInput [

	<webResource: #css>

	^ '
.slmd-input::part(input) {
  position: relative;
  width: 100%;
  padding: 0;
  background: var(--wa-color-neutral-90);
  height: 64px;
  padding-top: 4px;
}

.slmd-input::part(label) {
  height: 16px;
  font-size: 12px;
  padding: 4px 16px 0 16px;
  z-index: 10;
  background-color: rgb(0 0 0 / 0);
}

.slmd-input::part(base) {
  height: 56px;
  width: 100%;
  font-size: 16px;
  background: var(--wa-color-neutral-90);
}

.slmd-input::part(hint) {
  height: 16px;
  width: calc(100% - 32px);
  font-size: 12px;
  padding: 4px 16px 0 16px;
  background: var(--wa-color-brand-80);
}
'
]

{ #category : 'web resources' }
SlmdObjectView class >> globalStyleSwitch [

	<webResource: #css>

	^ '
.slmd-switch::part(base) {
  padding-top: 8px;
  padding-left: 16px;
}

.slmd-switch::part(hint) {
  height: 16px;
  width: 100%;
  font-size: 12px;
  padding: 4px 16px 0 16px;
  background: var(--wa-color-brand-80);
}
'
]

{ #category : 'web resources' }
SlmdObjectView class >> globalStyleTextarea [

	<webResource: #css>

	^ '
.slmd-textarea::part(base) {
  position: relative;
  width: 100%;
  padding: 0;
  background: var(--wa-color-neutral-90);
  height: 100%;
  padding-top: 12px;
}

.slmd-textarea::part(label) {
  height: 16px;
  font-size: 12px;
  padding: 4px 16px 0 16px;
  z-index: 10;
  background-color: rgb(0 0 0 / 0);
}

.slmd-textarea::part(textarea) {
  width: 100%;
  font-size: 16px;
  background: var(--wa-color-neutral-90);
}

.slmd-textarea::part(hint) {
  height: 16px;
  width: calc(100% - 32px);
  font-size: 12px;
  padding: 4px 16px 0 16px;
  background: var(--wa-color-brand-80);
}
'
]

{ #category : 'web resources' }
SlmdObjectView class >> style [

	<webResource: #css>

	^ '
#container {
  min-width: 300px;
  width: 100%;
}
'
]

{ #category : 'web resources' }
SlmdObjectView class >> template [

	<webResource: #html>

	^ '<div id="container">
  <slot name="fields"></slot>
  <slot name="details"></slot>
</div>'
]

{ #category : 'rendering' }
SlmdObjectView >> changeMap [
	| map |

	map := Dictionary new.
	self fieldElements valuesDo: [ :each | | oldValue newValue |
		oldValue := self mementoAt: each name.
		newValue := each slmdValue.
		oldValue ~= newValue ifTrue: [
			map at: each name put: each slmdValue ] ].
	^ map
]

{ #category : 'rendering' }
SlmdObjectView >> fieldAt: key label: aLabel switch: aBoolean [
	| element |

	element := WaSwitch new
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

	element := WaInput new
		appearanceBeFilled;
		name: key;
		addClass: 'slmd-input';
		label: aLabel;
		value: aText;
		hint: 'Help text...', aLabel;
		readonly: true;
		yourself.

	self mementoAt: key put: aText.
	^ self fieldElementsAt: key put: element

]

{ #category : 'rendering' }
SlmdObjectView >> fieldAt: key label: aLabel textarea: aText [
	| element |

	element := WaTextarea new
		appearanceBeFilled;
		name: key;
		addClass: 'slmd-textarea';
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
SlmdObjectView >> fieldElementsClear [

	fieldElements := OrderedDictionary new.
]

{ #category : 'rendering' }
SlmdObjectView >> fieldFor: fieldInfo map: map [
	| fieldName fieldType fieldLabel fieldValue |

	fieldName := fieldInfo key.
	fieldType := fieldInfo value.
	fieldLabel := fieldName capitalized.
	fieldValue := (map at: fieldName).

	fieldType = #string ifTrue: [
		^ self fieldAt: fieldName label: fieldName capitalized text: fieldValue ].

	fieldType = #textarea ifTrue: [
		^ self fieldAt: fieldName label: fieldName capitalized textarea: fieldValue ].

	fieldType = #boolean ifTrue: [
		^ self fieldAt: fieldName label: fieldName capitalized switch: fieldValue ].

	fieldType = #date ifTrue: [
		^ self fieldAt: fieldName label: fieldName capitalized text: fieldValue asString ].

]

{ #category : 'rendering' }
SlmdObjectView >> fields: list map: map [
	| fields |

	self fieldElementsClear.

	fields := #div asHtmlTag addClass: 'slmd-fields'; yourself.
	list do: [ :each |
		fields appendChild: (self fieldFor: each map: map) ].

	^ fields

]

{ #category : 'rendering' }
SlmdObjectView >> fields: list map: map slot: slotName [
	| element |

	element := self fields: list map: map.
	self replaceAllChildrenWith: element atSlotNamed: slotName.

]

{ #category : 'rendering' }
SlmdObjectView >> fieldsInExpansion: list map: map summary: summary open: aBoolean slot: slotName [
	| element expansion |

	element := self fields: list map: map.

	expansion := WaDetails new
		addClass: 'slmd-details';
		propertyAt: 'summary' put: summary;
		propertyAt: 'open' put: aBoolean;
		appendChild: element;
		yourself.

	self replaceAllChildrenWith: expansion atSlotNamed: slotName.


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
SlmdObjectView >> mementoAt: key [

	^ self memento at: key
]

{ #category : 'accessing' }
SlmdObjectView >> mementoAt: key put: element [

	self memento at: key put: element
]

{ #category : 'rendering' }
SlmdObjectView >> setEditable: aBoolean [
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
