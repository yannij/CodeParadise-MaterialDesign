Class {
	#name : 'SlmdNavPopupView',
	#superclass : 'SlmdNavView',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'web resources' }
SlmdNavPopupView class >> style [
	<webResource: #css>

	^ '.navpopup::part(popup) {
  width: 200px;
  background: var(--sl-color-primary-200);
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
SlmdNavPopupView >> popupSetUp: anId [
	| p |

	p := (SlPopup new id: anId; placementRight; "propertyAt: 'anchor' put: 'smdNavRegion';" yourself)
		propertyAt: 'anchor' put: self navRegionFind;
		appendChild: ('Popup ', anId) asHtmlElement;
		yourself.
]

{ #category : 'initialization' }
SlmdNavPopupView >> setAnchor [

	self popupElement propertyAt: 'anchor' put: self layoutViewLazy navRegionFind
]

{ #category : 'initialization' }
SlmdNavPopupView >> setUpWithName: aSymbol [

	self popupElement
		attributeAt: 'popupName' put: aSymbol;
		propertyAt: 'anchor' put: self layoutViewLazy navRegionFind
]
