Class {
	#name : 'WamListDetailLayoutView',
	#superclass : 'WamPaneLayoutView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
WamListDetailLayoutView class >> template [

	<webResource: #html>

	^ WamView linkUtilitiesCss, '
<div class="wam-pane-layout">
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
<slot name="sidesheet"></slot>
'
]

{ #category : 'panes' }
WamListDetailLayoutView >> bodyHeightAdapt: heightReduction [

	self pane1View
		ifNil: [ self systemLog logTrace: 'Missing pane1 component' ]
		ifNotNil: [ :pv | pv setPaneContentHeightReducedBy: heightReduction ].
	self pane2View
		ifNil: [ self systemLog logTrace: 'Missing pane2 component' ]
		ifNotNil: [ :pv | pv setPaneContentHeightReducedBy: heightReduction ].

	self sidesheetView
		ifNil: [ self systemLog logTrace: 'Missing sidesheet component' ]
		ifNotNil: [ :v | v setPaneContentHeightReducedBy: heightReduction ].
]

{ #category : 'panes' }
WamListDetailLayoutView >> bodyWidthAdapt: width [

	(self findByIdInShadowDom: 'wamBodySplitPanel')
		ifNil: [ self systemLog logError: 'Missing body region' ]
		ifNotNil: [ :value | value styleAt: 'width' put: width ].

]

{ #category : 'accessing - components' }
WamListDetailLayoutView >> pane1View [
	| slotName |

	slotName := self isUsingSinglePaneLayout
		ifTrue: [ 'singlePaneLayoutP1' ]
		ifFalse: [ 'twoPaneLayoutP1' ].

	^ self firstChildAtSlotNamed: slotName
]

{ #category : 'panes' }
WamListDetailLayoutView >> pane1WidthSet: anInteger [
	| split |

	split := self findByIdInShadowDom: 'wamBodySplitPanel' ifNone: [].
	split ifNotNil: [
		split
			customPropertyAt: 'min' put: 'min(344px,50vw - 16px)';
			customPropertyAt: 'max' put: 'calc(100% - (max(344px,50vw - 16px)))';
			customPropertyAt: 'divider-width' put: '16px';
			customPropertyAt: 'divider-hit-area' put: '16px';
			primary: 'start';
			positionInPixels: anInteger printString;
			snap: (anInteger printString), 'px 50%';
			snapThreshold: 24 ].

	(self findByIdInShadowDom: 'wamSinglePaneLayout' ifNone: []) ifNotNil: [ :value |
		value styleAt: 'width' put: anInteger printString, 'px' ]

]

{ #category : 'accessing - components' }
WamListDetailLayoutView >> pane2View [
	| slotName |

	slotName := self isUsingSinglePaneLayout
		ifTrue: [ 'singlePaneLayoutP2' ]
		ifFalse: [ 'twoPaneLayoutP2' ].

	^ self firstChildAtSlotNamed: slotName
]

{ #category : 'panes' }
WamListDetailLayoutView >> useSinglePaneLayout [

	"self traceCr: 'View: useSinglePaneLayout'."
	self isUsingSinglePaneLayout: true.
	self shadowElementId: 'wamTwoPaneLayout' show: false.
	self moveChildrenFromSlot: 'twoPaneLayoutP1' to: 'singlePaneLayoutP1'.
	self moveChildrenFromSlot: 'twoPaneLayoutP2' to: 'singlePaneLayoutP2'.
	self shadowElementId: 'wamSinglePaneLayout' show: true.
	"self primaryPaneOnly.
	self layoutViewLazy
		appBar2Display: true;
		yourself."

]

{ #category : 'panes' }
WamListDetailLayoutView >> useTwoPaneLayout [

	"self traceCr: 'View: useTwoPaneLayout'."
	self isUsingSinglePaneLayout: false.
	self shadowElementId: 'wamSinglePaneLayout' show: false.
	self moveChildrenFromSlot: 'singlePaneLayoutP1' to: 'twoPaneLayoutP1'.
	self moveChildrenFromSlot: 'singlePaneLayoutP2' to: 'twoPaneLayoutP2'.
	self shadowElementId: 'wamTwoPaneLayout' show: true.

]
