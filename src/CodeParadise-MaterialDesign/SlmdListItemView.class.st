Class {
	#name : 'SlmdListItemView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'web resources' }
SlmdListItemView class >> globalStyle [
	<webResource: #css>

	^ '
.smd-item-font {
  line-height: var(--sl-line-height-normal);
  font-size: var(--sl-font-size-medium);
  font-weight: var(--sl-font-weight-normal);
}

.smd-item {
  display: flex;
  height: 40px;
  padding: 8px 16px;
  background: var(--sl-color-primary-200);
  border-top: 1px solid var(--sl-color-neutral-400);
}

.smd-item-leadingIcon {
  padding: 8px 16px 8px 0;
  font-size: 24px;
}

.smd-item-trailingIcon {
  padding: 8px 0 8px 16px;
  font-size: 24px;
}

.smd-item-headline {
  line-height: 40px;
  font-size: 16px;
  text-align: left;
  overflow-x: clip;
  margin-right: auto;
}
'
]

{ #category : 'web resources' }
SlmdListItemView class >> template [

	<webResource: #html>

	^ '<div id="container">
  <slot name="listItem"></slot>
</div>'
]

{ #category : 'rendering' }
SlmdListItemView >> renderLeadingIconOn: div map: aMap [
	| iconName |

	iconName := (aMap at: #leadingIcon ifAbsent: [ ^ self ]).

	div
		appendChild: (#div asHtmlTag
			addClass: 'smd-item-leadingIcon';
			appendChild: (SlIcon named: iconName);
			yourself);
		yourself.

]

{ #category : 'rendering' }
SlmdListItemView >> renderListItemMap: aMap index: index [
	| div |

	div := #div asHtmlTag addClass: 'smd-item'; yourself.
	self renderLeadingIconOn: div map: aMap.
	div
		appendChild: (#div asHtmlTag
			addClass: 'smd-item-headline';
			textContent: (aMap at: #headline ifAbsent: ['']);
			yourself);
		yourself.
	self renderTrailingIconOn: div map: aMap.
	div when: CpClickEvent basicPrimary do: [ self setDetail: index ] for: self.
	self replaceAllChildrenWith: div atSlotNamed: #listItem.
]

{ #category : 'rendering' }
SlmdListItemView >> renderTrailingIconOn: div map: aMap [
	| iconName |

	iconName := (aMap at: #trailingIcon ifAbsent: [ ^ self ]).

	div
		appendChild: (#div asHtmlTag
			addClass: 'smd-item-trailingIcon';
			appendChild: (SlIcon named: iconName);
			yourself);
		yourself.

]

{ #category : 'rendering' }
SlmdListItemView >> setDetail: index [

	self systemLog logTrace5: index printString method: 'setDetail:'.

	self layoutViewFind announceActionSubtype: #setDetail key: #index value: index.

]
