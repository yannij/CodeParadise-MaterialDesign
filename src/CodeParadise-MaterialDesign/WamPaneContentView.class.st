Class {
	#name : 'WamPaneContentView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
WamPaneContentView class >> style [

	<webResource: #css>

	^ '
.wam-container {
  box-sizing: border-box;
  padding: var(--wa-space-xs);
}
'
]

{ #category : 'web resources' }
WamPaneContentView class >> template [

	<webResource: #html>

	^ '<div id="container" class="wam-container wa-cloak">
  <slot name="content"></slot>
</div>'
]

{ #category : 'rendering' }
WamPaneContentView >> renderContent: aString [

	self replaceAllChildrenWith: (aString inHtmlTag: #span) atSlotNamed: 'content'.

]
