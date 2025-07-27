Class {
	#name : 'SlmdPaneView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'web resources' }
SlmdPaneView class >> style [

	<webResource: #css>

	^ '
.smd-pane-content {
  background: var(--sl-color-primary-100);
  overflow-x: auto;
  overflow-y: auto;
}
'
]

{ #category : 'web resources' }
SlmdPaneView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <div class="smdAppBar">
    <slot name="appBar"></slot>
  </div>
  <div class="smd-pane-content">
    <slot name="paneContent"></slot>
  </div>
</div>
'
]

{ #category : 'accessing' }
SlmdPaneView >> paneContentView [

	^ self firstChildAtSlotNamed: 'paneContent'
]

{ #category : 'rendering' }
SlmdPaneView >> renderId: paneId content: aString [

	self
		replaceAllChildrenWith: (#div asHtmlTag
			"id: paneId;"
			addClass: 'smd-pane';
			appendChild: (aString inHtmlTag: #span);
			yourself)
		atSlotNamed: 'content'.

]
