Class {
	#name : 'SlmdPaneView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
SlmdPaneView class >> style [

	<webResource: #css>

	^ '
.smd-pane-content {
  overflow-x: auto;
  overflow-y: auto;
  background: var(--wa-color-brand-fill-quiet);
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
SlmdPaneView >> appBarView [

	^ self firstChildAtSlotNamed: 'appBar'
]

{ #category : 'testing' }
SlmdPaneView >> hasAppBar [

	^ self appBarView notNil
]

{ #category : 'accessing' }
SlmdPaneView >> paneContentView [

	^ self firstChildAtSlotNamed: 'paneContent'
]

{ #category : 'actions' }
SlmdPaneView >> setPaneContentHeightReducedBy: bodyHeightReduction [
	| element reduction heightString |

	(element := self paneContentView) ifNil: [
		self systemLog logTrace: 'Missing pane content component'.
		^ self ].
	"self systemLog logTrace: element printString.
	self systemLog logString: element markupContent.
	self systemLog logString: element style."

	(element := element shadowedElementWithId: #container) ifNil: [
		self systemLog logTrace: 'Missing container div'.
		^ self ].

	reduction := self hasAppBar
		ifTrue: [ bodyHeightReduction + 64 ]
		ifFalse: [ bodyHeightReduction ].
	heightString := reduction > 0
		ifTrue: [ 'calc(100vh - ', reduction printString, 'px)' ]
		ifFalse: [ '100vh' ].
	element styleAt: 'height' put: heightString.
	"self systemLog logTrace: element printString.
	self systemLog logString: element markupContent.
	self systemLog logString: element style."

]
