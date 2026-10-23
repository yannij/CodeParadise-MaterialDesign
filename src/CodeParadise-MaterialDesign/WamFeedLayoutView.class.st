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

{ #category : 'panes' }
WamFeedLayoutView >> bodyHeightAdapt: heightReduction [

	self pane1View
		ifNil: [ self systemLog logTrace: 'Missing pane1 component' ]
		ifNotNil: [ :pv | pv setPaneContentHeightReducedBy: heightReduction ].

	self sidesheetView
		ifNil: [ self systemLog logTrace: 'Missing sidesheet component' ]
		ifNotNil: [ :v | v setPaneContentHeightReducedBy: heightReduction ].

]

{ #category : 'panes' }
WamFeedLayoutView >> bodyWidthAdapt: width [

	(self findByIdInShadowDom: 'wamSinglePaneLayoutP1')
		ifNil: [ self systemLog logError: 'Missing body region' ]
		ifNotNil: [ :value | value styleAt: 'width' put: width ]
]

{ #category : 'testing' }
WamFeedLayoutView >> isUsingSinglePaneLayout [

	^ false
]

{ #category : 'accessing - components' }
WamFeedLayoutView >> pane1View [

	^ self firstChildAtSlotNamed: 'singlePaneLayoutP1'
]

{ #category : 'panes' }
WamFeedLayoutView >> pane1WidthSet: anInteger [

	(self findByIdInShadowDom: 'wamSinglePaneLayoutP1') ifNotNil: [ :value |
		value styleAt: 'width' put: anInteger printString, 'px' ]
]

{ #category : 'accessing - components' }
WamFeedLayoutView >> pane2View [

	self error: 'Should not use'
]

{ #category : 'panes' }
WamFeedLayoutView >> useSinglePaneLayout [
	"Do nothing for Feed layout"

]

{ #category : 'panes' }
WamFeedLayoutView >> useTwoPaneLayout [
	"Do nothing for Feed layout"

]
