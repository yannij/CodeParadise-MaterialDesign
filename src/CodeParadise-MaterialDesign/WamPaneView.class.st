Class {
	#name : 'WamPaneView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
WamPaneView class >> style [

	<webResource: #css>

	^ '
.wam-pane-content {
  overflow-x: auto;
  overflow-y: auto;
  background: var(--wa-color-brand-fill-quiet);
}
'
]

{ #category : 'web resources' }
WamPaneView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <div class="wamAppBar">
    <slot name="appBar"></slot>
  </div>
  <div class="wam-pane-content">
    <slot name="paneContent"></slot>
  </div>
</div>
'
]

{ #category : 'accessing' }
WamPaneView >> appBarView [

	^ self firstChildAtSlotNamed: 'appBar'
]

{ #category : 'testing' }
WamPaneView >> hasVisibleAppBar [

	^ self appBarView isDisplayed
]

{ #category : 'accessing' }
WamPaneView >> paneContentView [

	^ self firstChildAtSlotNamed: 'paneContent'
]

{ #category : 'actions' }
WamPaneView >> setPaneContentHeightReducedBy: bodyHeightReduction [
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

	reduction := self hasVisibleAppBar
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
