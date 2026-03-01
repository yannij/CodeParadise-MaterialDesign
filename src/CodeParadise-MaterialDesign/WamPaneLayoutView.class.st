Class {
	#name : 'WamPaneLayoutView',
	#superclass : 'WamLayoutComponentView',
	#instVars : [
		'isUsingSinglePaneLayout'
	],
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'class initialization' }
WamPaneLayoutView class >> beLoaded [

	WaIcon beLoaded.
	WaSplitPanel beLoaded
]

{ #category : 'web resources' }
WamPaneLayoutView class >> style [

	<webResource: #css>
	^ '
.wam-hidden {
  position: absolute !important;
  top: -9999px !important;
  left: -9999px !important;
}

.wam-body-region {
  flex: auto;
  display: flex;  
  flex-direction: row;
  background: var(--wa-color-brand-fill-quiet);
}

.wam-pane-layout {
  height: 100%;
}

.wam-pane {
  flex: 100%;
  display: flex;  
  flex-direction: column;
  padding: 0;
  margin: 0;
}

.wam-body-split-panel {
  height: 100%;
}

.wam-pane-layout wa-split-panel::part(divider) {
  background-color: var(--wa-color-brand-fill-quiet);
}
'
]

{ #category : 'web resources' }
WamPaneLayoutView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <div id="wamSinglePaneLayout" class="wam-one-pane">
    <div id="wamSinglePaneLayoutP1" class="wam-pane">
      <slot name="singlePaneLayoutP1"></slot>
    </div>
    <div id="wamSinglePaneLayoutP2" class="wam-pane">
      <slot name="singlePaneLayoutP2"></slot>
    </div>
  </div>
  <div id="wamTwoPaneLayout" class="wam-two-pane">
    <wa-split-panel id="wamBodySplitPanel" class="wam-body-split-panel">
      <wa-icon slot="divider" name="grip-vertical"></wa-icon>
      <div slot="start">
        <div id="wamTwoPaneLayoutP1" class="wam-pane">
          <slot name="twoPaneLayoutP1"></slot>
        </div>
      </div>
      <div slot="end">
        <div id="wamTwoPaneLayoutP2" class="wam-pane">
          <slot name="twoPaneLayoutP2"></slot>
        </div>
      </div>
    </wa-split-panel>
  </div>
</div>
'
]

{ #category : 'initialization' }
WamPaneLayoutView >> initialize [

	super initialize.

	isUsingSinglePaneLayout := false.

]

{ #category : 'testing' }
WamPaneLayoutView >> isUsingSinglePaneLayout [

	^ isUsingSinglePaneLayout.
]

{ #category : 'actions' }
WamPaneLayoutView >> pane1WidthSet: anInteger [
	| split |

	split := self findByIdInShadowDom: 'wamBodySplitPanel'.
	split ifNotNil: [
		split
			min: 'min(344px,50vw - 16px)';
			max: 'calc(100% - (max(344px,50vw - 16px)))';
			primaryBeStart;
			positionInPixels: anInteger printString;
			dividerWidth: '16px';
			snap: (anInteger printString), 'px 50%';
			snapThreshold: 24 ].

]

{ #category : 'actions' }
WamPaneLayoutView >> primaryPaneDisplay: aBoolean [

	self shadowElementId: 'wamSinglePaneLayoutP1' show: aBoolean.

]

{ #category : 'actions' }
WamPaneLayoutView >> primaryPaneOnly [

	self systemLog logTrace5: 'primaryPaneOnly'.

	self isUsingSinglePaneLayout not ifTrue: [
		^ self ].

	self layoutViewLazy
		showNavBar: true;
		showNavBarAdapt: true;
		"floatingToolbarOff;"
		resizeBodyRegion.
	self primaryPaneDisplay: true.
	self secondaryPaneDisplay: false.

]

{ #category : 'actions' }
WamPaneLayoutView >> secondaryPaneDisplay: aBoolean [

	self shadowElementId: 'wamSinglePaneLayoutP2' show: aBoolean.

]

{ #category : 'actions' }
WamPaneLayoutView >> secondaryPaneOnly [

	self systemLog logTrace5: 'secondaryPaneOnly'.

	self isUsingSinglePaneLayout not ifTrue: [
		^ self ].

	self layoutViewLazy
		showNavBar: false;
		showNavBarAdapt: false;
		"floatingToolbarOn;"
		resizeBodyRegion.
	self primaryPaneDisplay: false.
	self secondaryPaneDisplay: true.

]

{ #category : 'actions' }
WamPaneLayoutView >> useSinglePaneLayout [

	"self traceCr: 'View: useSinglePaneLayout'."
	isUsingSinglePaneLayout := true.
	self shadowElementId: 'wamTwoPaneLayout' show: false.
	self moveChildrenFromSlot: 'twoPaneLayoutP1' to: 'singlePaneLayoutP1'.
	self moveChildrenFromSlot: 'twoPaneLayoutP2' to: 'singlePaneLayoutP2'.
	self shadowElementId: 'wamSinglePaneLayout' show: true.
	self primaryPaneOnly.
	self layoutViewLazy
		appBar2Display: true;
		"appBar2LeadingButtonDisplay: true;"
		yourself.

]

{ #category : 'actions' }
WamPaneLayoutView >> useTwoPaneLayout [

	"self traceCr: 'View: useTwoPaneLayout'."
	isUsingSinglePaneLayout := false.
	self shadowElementId: 'wamSinglePaneLayout' show: false.
	self moveChildrenFromSlot: 'singlePaneLayoutP1' to: 'twoPaneLayoutP1'.
	self moveChildrenFromSlot: 'singlePaneLayoutP2' to: 'twoPaneLayoutP2'.
	self shadowElementId: 'wamTwoPaneLayout' show: true.
	self layoutViewLazy
		"floatingToolbarOn;"
		"appBar2Display: false;"
		"appBar2LeadingButtonDisplay: false;"
		yourself.

]
