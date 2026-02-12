Class {
	#name : 'SlmdPaneContentView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
SlmdPaneContentView class >> style [

	<webResource: #css>

	^ '
.smd-container {
  box-sizing: border-box;
  padding: var(--wa-space-xs);
}
'
]

{ #category : 'web resources' }
SlmdPaneContentView class >> template [

	<webResource: #html>

	^ '<div id="container" class="smd-container">
  <slot name="content"></slot>
</div>'
]

{ #category : 'rendering' }
SlmdPaneContentView >> renderContent: aString [

	self replaceAllChildrenWith: (aString inHtmlTag: #span) atSlotNamed: 'content'.

]
