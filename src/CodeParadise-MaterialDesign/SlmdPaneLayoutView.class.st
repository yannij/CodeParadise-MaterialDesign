Class {
	#name : 'SlmdPaneLayoutView',
	#superclass : 'SlmdLayoutComponentView',
	#instVars : [
		'isUsingSinglePaneLayout'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'class initialization' }
SlmdPaneLayoutView class >> beLoaded [

	SlIcon beLoaded.
	SlSplitPanel beLoaded
]

{ #category : 'web resources' }
SlmdPaneLayoutView class >> style [

	<webResource: #css>
	^ '
.smd-hidden {
  position: absolute !important;
  top: -9999px !important;
  left: -9999px !important;
}

.smd-pane-layout {
  height: 100%;
  overflow-y: auto;
}

.smd-pane {
  flex: 100%;
  display: flex;  
  flex-direction: column;
  padding: 0;
  margin: 0;
}

.smd-body-split-panel {
  height: 100%;
}

.smd-pane-layout sl-split-panel::part(divider) {
  background-color: var(--sl-color-primary-100);
}
'
]

{ #category : 'web resources' }
SlmdPaneLayoutView class >> template [

	<webResource: #html>
	^ '
<div id="container" class="smd-pane-layout">
  <div id="smdSinglePaneLayout">
    <div id="smdSinglePaneLayoutP1" class="smd-pane">
      <slot name="singlePaneLayoutP1"></slot>
    </div>
    <div id="smdSinglePaneLayoutP2" class="smd-pane">
      <slot name="singlePaneLayoutP2"></slot>
    </div>
  </div>
  <div id="smdTwoPaneLayout">
    <sl-split-panel
        id="smdBodySplitPanel" class="smd-body-split-panel"
        primary="start" style="--min: 300px; --divider-width: 24px;">
      <sl-icon slot="divider" name="grip-vertical"></sl-icon>
      <div slot="start">
        <div id="smdTwoPaneLayoutP1" class="smd-pane">
          <slot name="twoPaneLayoutP1"></slot>
        </div>
      </div>
      <div slot="end">
        <div id="smdTwoPaneLayoutP2" class="smd-pane">
          <slot name="twoPaneLayoutP2"></slot>
        </div>
      </div>
    </sl-split-panel>
  </div>
</div>
'
]

{ #category : 'initialization' }
SlmdPaneLayoutView >> initialize [

	super initialize.

	isUsingSinglePaneLayout := false.

]

{ #category : 'testing' }
SlmdPaneLayoutView >> isUsingSinglePaneLayout [

	^ isUsingSinglePaneLayout.
]

{ #category : 'actions' }
SlmdPaneLayoutView >> pane1WidthSet: anInteger [
	| split |

	split := self findByIdInShadowDom: 'smdBodySplitPanel'.
	split ifNotNil: [
		split attributeAt: 'position-in-pixels' put: anInteger printString ].

]

{ #category : 'actions' }
SlmdPaneLayoutView >> primaryPaneDisplay: aBoolean [

	self shadowElementId: 'smdSinglePaneLayoutP1' show: aBoolean.

]

{ #category : 'actions' }
SlmdPaneLayoutView >> primaryPaneOnly [

	self logTrace5Method: 'primaryPaneOnly'.

	self isUsingSinglePaneLayout not ifTrue: [
		^ self ].

	self layoutViewLazy
		showNavBar: true;
		showNavBarAdapt: true;
		floatingToolbarOff;
		adjustBodyHeight.
	self primaryPaneDisplay: true.
	self secondaryPaneDisplay: false.

]

{ #category : 'actions' }
SlmdPaneLayoutView >> secondaryPaneDisplay: aBoolean [

	self shadowElementId: 'smdSinglePaneLayoutP2' show: aBoolean.

]

{ #category : 'actions' }
SlmdPaneLayoutView >> secondaryPaneOnly [

	self logTrace5Method: 'secondaryPaneOnly'.

	self isUsingSinglePaneLayout not ifTrue: [
		^ self ].

	self layoutViewLazy
		showNavBar: false;
		showNavBarAdapt: false;
		floatingToolbarOn;
		adjustBodyHeight.
	self primaryPaneDisplay: false.
	self secondaryPaneDisplay: true.

]

{ #category : 'actions' }
SlmdPaneLayoutView >> useSinglePaneLayout [

	"self traceCr: 'View: useSinglePaneLayout'."
	isUsingSinglePaneLayout := true.
	self shadowElementId: 'smdTwoPaneLayout' show: false.
	self moveChildrenFromSlot: 'twoPaneLayoutP1' to: 'singlePaneLayoutP1'.
	self moveChildrenFromSlot: 'twoPaneLayoutP2' to: 'singlePaneLayoutP2'.
	self shadowElementId: 'smdSinglePaneLayout' show: true.
	self primaryPaneOnly.
	self layoutViewLazy
		appBar2Display: true;
		"appBar2LeadingButtonDisplay: true;"
		yourself.

]

{ #category : 'actions' }
SlmdPaneLayoutView >> useTwoPaneLayout [

	"self traceCr: 'View: useTwoPaneLayout'."
	isUsingSinglePaneLayout := false.
	self shadowElementId: 'smdSinglePaneLayout' show: false.
	self moveChildrenFromSlot: 'singlePaneLayoutP1' to: 'twoPaneLayoutP1'.
	self moveChildrenFromSlot: 'singlePaneLayoutP2' to: 'twoPaneLayoutP2'.
	self shadowElementId: 'smdTwoPaneLayout' show: true.
	self layoutViewLazy
		floatingToolbarOn;
		"appBar2Display: false;"
		"appBar2LeadingButtonDisplay: false;"
		yourself.

]
