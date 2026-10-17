Class {
	#name : 'WamFeedLayoutView',
	#superclass : 'WamResponsiveLayoutView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
WamFeedLayoutView class >> template [

	<webResource: #html>

	^ WamView linkUtilitiesCss, '
<wa-resize-observer>
  <div class="wa-cloak wa-stack wa-gap-0 wa-align-items-stretch">
    <div class="wa-cluster wa-gap-0 wa-align-items-stretch wa-flex-nowrap">
      <slot name="navRail"></slot>
<div class="wam-pane-layout">
  <div id="wamSinglePaneLayout" class="wam-one-pane">
    <div id="wamSinglePaneLayoutP1" class="wam-pane">
      <slot name="singlePaneLayoutP1"></slot>
    </div>
  </div>
</div>
      <slot name="sidesheet"></slot>
    </div>
    <slot name="navBar"></slot>
    <slot name="dockedToolbar"></slot>
  </div>
</wa-resize-observer>
<slot name="navRailModal"></slot>
<slot name="floatingToolbar"></slot>
<slot name="fab"></slot>
<slot name="dialog"></slot>
<slot name="brandDialog"></slot>
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
