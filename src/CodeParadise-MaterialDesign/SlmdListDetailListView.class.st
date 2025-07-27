Class {
	#name : 'SlmdListDetailListView',
	#superclass : 'SlmdView',
	#category : 'CodeParadise-MaterialDesign-ShoelaceListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceListDetail'
}

{ #category : 'web resources' }
SlmdListDetailListView class >> globalStyle [
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

.smd-item-icon {
  padding: 0 16px;
  font-size: 24px;
}

.smd-item-labelText {
  line-height: 40px;
  font-size: 16px;
  text-align: left;
  overflow-x: clip;
}
'
]

{ #category : 'web resources' }
SlmdListDetailListView class >> template [

	<webResource: #html>

	^ '<div id="container">
  <slot name="listItem"></slot>
</div>'
]

{ #category : 'rendering' }
SlmdListDetailListView >> renderTextSlot: slotName value: aString index: index [
	| div |

	div := #div asHtmlTag
		addClass: 'smd-item';
		"addClass: 'smd-item-font';"
		when: CpClickEvent basicPrimary do: [ self setDetail: index ] for: self;
		appendChild: (#div asHtmlTag
			addClass: 'smd-item-labelText';
			textContent: aString;
			yourself);
		yourself.

	self replaceAllChildrenWith: div atSlotNamed: 'listItem'.
]

{ #category : 'rendering' }
SlmdListDetailListView >> secondaryPaneOnly [

	self logTrace5Method: 'secondaryPaneOnly'.

	self layoutViewFind secondaryPaneOnly.

]

{ #category : 'rendering' }
SlmdListDetailListView >> setDetail: index [

	self logTrace5: index printString method: 'setDetail:'.

	self announceActionKey: #index value: index.

]
