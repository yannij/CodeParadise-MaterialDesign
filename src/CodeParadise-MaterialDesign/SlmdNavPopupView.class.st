Class {
	#name : 'SlmdNavPopupView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'web resources' }
SlmdNavPopupView class >> style [
	<webResource: #css>

	^ '.navpopup::part(popup) {
  width: 200px;
  background: var(--sl-color-primary-300);
}'
]

{ #category : 'web resources' }
SlmdNavPopupView class >> template [

	<webResource: #html>

	^ '<div id="container">
  <sl-popup placement="right-start" class="navpopup">
    <slot name="content"></slot>
  </sl-popup>
</div>'
]

{ #category : 'initialization' }
SlmdNavPopupView >> popupElement [

	^ (self shadowedElementWithId: 'container') firstDescendantMatching: SlPopup asCssSelector
]

{ #category : 'initialization' }
SlmdNavPopupView >> setUpWithName: aSymbol [

	self traceCr: 'setUpWithName: ', aSymbol printString.
	self popupElement
		attributeAt: 'popupName' put: aSymbol;
		propertyAt: 'anchor' put: self layoutViewLazy navRegionFind
]
