Class {
	#name : 'WamExampleContentView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-Examples-MD3-SimpleDemo',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'SimpleDemo'
}

{ #category : 'web resources' }
WamExampleContentView class >> style [

	<webResource: #css>

	^ '
.wam-container {
  box-sizing: border-box;
  padding: var(--wam-space);
}
'
]

{ #category : 'web resources' }
WamExampleContentView class >> template [

	<webResource: #html>

	^ '<div id="container" class="wam-container wa-cloak">
  <slot name="content"></slot>
</div>'
]

{ #category : 'rendering' }
WamExampleContentView >> renderContent: aString [

	self replaceAllChildrenWith: (aString inHtmlTag: #span) atSlotNamed: 'content'.

]
