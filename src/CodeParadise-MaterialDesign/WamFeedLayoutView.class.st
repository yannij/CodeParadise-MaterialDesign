Class {
	#name : 'WamFeedLayoutView',
	#superclass : 'WamPaneLayoutView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
WamFeedLayoutView class >> style [

	<webResource: #css>

	^ '
.wam-hidden {
  position: absolute !important;
  top: -9999px !important;
  left: -9999px !important;
}

.wam-layout {
  background: var(--wa-color-brand-fill-quiet);
}

.wam-settings-pane {
  padding: 0;
  overflow-y: auto;
}
'
, self stylePaneLayout

]

{ #category : 'web resources' }
WamFeedLayoutView class >> stylePaneLayout [

	<webResource: #css>
	^ '
.wam-pane-layout {
  height: 100%;
  overflow-x: visible;
  overflow-y: visible;
  background: var(--wa-color-brand-fill-quiet);
}

.wam-pane {
  flex: 100%;
  display: flex;  
  flex-direction: column;
  padding: 0;
  margin: 0;
  overflow-x: auto;
  overflow-y: auto;
}
'
]

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
