Class {
	#name : 'WamFeedLayoutView',
	#superclass : 'WamPaneLayoutView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
WamFeedLayoutView class >> template [

	<webResource: #html>

	^ WamView linkUtilitiesCss, '
<div class="wam-pane-layout">
  <div id="wamSinglePaneLayout" class="wam-one-pane">
    <div id="wamSinglePaneLayoutP1" class="wam-pane">
      <slot name="singlePaneLayoutP1"></slot>
    </div>
  </div>
</div>
<slot name="sidesheet"></slot>
'
]

{ #category : 'body' }
WamFeedLayoutView >> bodySplitPanelAdapt [

	"Do nothing for Feed layout"

]

{ #category : 'body' }
WamFeedLayoutView >> bodyWidthAdapt [
	| element |

	element := self findByIdInShadowDom: 'wamSinglePaneLayoutP1'.

	element
		ifNil: [ self systemLog logError: 'Missing body region' ]
		ifNotNil: [ element styleAt: 'width' put: self bodyWidthToUse ].

]

{ #category : 'testing' }
WamFeedLayoutView >> isUsingSinglePaneLayout [

	^ false
]

{ #category : 'panes' }
WamFeedLayoutView >> pane1WidthSet: anInteger [

	"Do nothing for Feed layout"

]

{ #category : 'panes' }
WamFeedLayoutView >> useSinglePaneLayout [
	"Do nothing for Feed layout"

]

{ #category : 'panes' }
WamFeedLayoutView >> useTwoPaneLayout [
	"Do nothing for Feed layout"

]
