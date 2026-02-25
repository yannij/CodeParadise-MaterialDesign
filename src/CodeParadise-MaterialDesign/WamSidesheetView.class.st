Class {
	#name : 'WamSidesheetView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
WamSidesheetView class >> style [

	<webResource: #css>

	^ '
.smd-hidden {
  position: absolute !important;
  top: -9999px !important;
  left: -9999px !important;
}

.smd-sidesheet-content {
  margin: 0;
  width: 300px;
  max-width: 300px;
  overflow-y: auto;
}
'
]

{ #category : 'web resources' }
WamSidesheetView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <div class="smd-sidesheet-content">
    <slot name="paneContent"></slot>
  </div>
</div>
'
]

{ #category : 'accessing' }
WamSidesheetView >> paneContentView [

	^ self firstChildAtSlotNamed: 'paneContent'
]

{ #category : 'initialization' }
WamSidesheetView >> setPaneContentHeightReducedBy: bodyHeightReduction [
	| element heightString |

	(element := self paneContentView) ifNil: [
		self systemLog logTrace: 'Missing pane content component'.
		^ self ].
	"self systemLog logTrace: element printString.
	self systemLog logString: element markupContent.
	self systemLog logString: element style."

	(element := element shadowedElementWithId: #container) ifNil: [
		self systemLog logTrace: 'Missing container div'.
		^ self ].

	heightString := bodyHeightReduction > 0
		ifTrue: [ 'calc(100vh - ', bodyHeightReduction printString, 'px)' ]
		ifFalse: [ '100vh' ].
	element styleAt: 'height' put: heightString.
	"self systemLog logTrace: element printString.
	self systemLog logString: element markupContent.
	self systemLog logString: element style."

]
