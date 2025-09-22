Class {
	#name : 'SlmdPaneContentView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
SlmdPaneContentView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <div class="smd-pane-content" style="padding: 8px">
    <slot name="content"></slot>
  </div>
</div>
'
]

{ #category : 'rendering' }
SlmdPaneContentView >> renderContent: aString [

	self replaceAllChildrenWith: (aString inHtmlTag: #span) atSlotNamed: 'content'.

]
