Class {
	#name : 'SlmdSidesheetView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
SlmdSidesheetView class >> style [

	<webResource: #css>

	^ '
.smd-hidden {
  position: absolute !important;
  top: -9999px !important;
  left: -9999px !important;
}

.smd-sidesheet-container {
  padding: 0;
  margin: 0;
  width: 300px;
  max-width: 300px;
  overflow-y: auto;
}
'
]

{ #category : 'web resources' }
SlmdSidesheetView class >> template [

	<webResource: #html>

	^ '
<div id="container" class="smd-sidesheet-container">
  <slot name="content"></slot>
</div>
'
]

{ #category : 'rendering' }
SlmdSidesheetView >> renderContent: aString [

	self replaceAllChildrenWith: aString asHtmlElement atSlotNamed: #content.

]
