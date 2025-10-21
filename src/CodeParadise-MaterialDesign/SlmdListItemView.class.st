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
.smd-item {
  display: flex;
  height: 40px;
  padding: 8px 16px;
  background: var(--wa-color-brand-80);
  border-top: 1px solid var(--wa-color-neutral-60);
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
SlmdListItemView class >> style [
	<webResource: #css>

	^ '
.container {
  display: flex;
  height: 40px;
  padding: 8px 16px;
  background: var(--wa-color-brand-80);
  border-top: 1px solid var(--wa-color-neutral-60);
}

.leadingIcon {
  padding: 8px 16px 8px 0;
  font-size: 24px;
}

.headline {
  line-height: 40px;
  font-size: 16px;
  text-align: left;
  overflow-x: clip;
  margin-right: auto;
}

.trailingIcon {
  padding: 8px 0 8px 16px;
  font-size: 24px;
}
'
]

{ #category : 'web resources' }
SlmdListItemView class >> template [

	<webResource: #html>

	^ '<div class="container">
<div class="leadingIcon"><slot name="leadingIcon"></slot></div>
<div class="headline"><slot name="headline"></slot></div>
<div class="trailingIcon"><slot name="trailingIcon"></slot></div>
</div>'
]

{ #category : 'rendering' }
SlmdListItemView >> renderListItemMap: aMap index: index [

	aMap at: #leadingIcon ifPresent: [ :value | | element |
		self replaceAllChildrenWith: (element := WaIcon fullyNamed: value) atSlotNamed: #leadingIcon.
		element when: CpClickEvent basicPrimary do: [ self setDetail: index ] for: self ].
	aMap at: #headline ifPresent: [ :value |
		self replaceAllChildrenWith: value asHtmlElement atSlotNamed: #headline ].
	aMap at: #trailingIcon ifPresent: [ :value |
		self replaceAllChildrenWith: (WaIcon fullyNamed: value) atSlotNamed: #trailingIcon ].

]

{ #category : 'rendering' }
SlmdListItemView >> setDetail: index [

	self systemLog logTrace5: index printString method: 'setDetail:'.

	self layoutViewFind announceActionSubtype: #setDetail key: #index value: index.

]
