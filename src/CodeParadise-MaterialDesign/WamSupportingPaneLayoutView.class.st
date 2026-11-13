Class {
	#name : 'WamSupportingPaneLayoutView',
	#superclass : 'WamPaneLayoutView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
WamSupportingPaneLayoutView class >> template [

	<webResource: #html>

	^ WamView linkUtilitiesCss, '
<div class="wam-pane-layout">
  <div id="wamSupportingPaneLayout" class="wam-supporting-pane">
    <div id="wamFocusPane" class="wam-pane">
      <slot name="focusPane"></slot>
    </div>
    <div id="wamSupportingPane" class="wam-pane">
      <slot name="supportingPane"></slot>
    </div>
  </div>
</div>
<slot name="sidesheet"></slot>
'
]

{ #category : 'panes' }
WamSupportingPaneLayoutView >> bodyHeightAdapt: heightReduction [

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
WamSupportingPaneLayoutView >> bodyRegionFind [

	^ self findByIdInShadowDom: 'wamSupportingPaneLayout'
]

{ #category : 'panes' }
WamSupportingPaneLayoutView >> isUsingSinglePaneLayout [

	^ false
]

{ #category : 'accessing - components' }
WamSupportingPaneLayoutView >> pane1View [

	^ self firstChildAtSlotNamed: 'focusPane'
]

{ #category : 'panes' }
WamSupportingPaneLayoutView >> pane1WidthComputeWith: aScaffoldView [
	| w gap |

	gap := 16.
	w := ((aScaffoldView layoutWidthCached - gap) / 2) asInteger.
	w := w - aScaffoldView bodyWidthReduction.
	w := w max: self pane1WidthMin.

	^ w

]

{ #category : 'accessing - components' }
WamSupportingPaneLayoutView >> pane2View [

	^ self firstChildAtSlotNamed: 'supportingPane'
]

{ #category : 'panes' }
WamSupportingPaneLayoutView >> paneLayoutAdaptWith: aScaffoldView [
	| anInteger |

	anInteger := self pane1WidthComputeWith: aScaffoldView.

	(self findByIdInShadowDom: 'wamFocusPane' ifNone: []) ifNotNil: [ :value |
		value
			styleAt: 'float' put: 'left';
			styleAt: 'width' put: anInteger printString, 'px' ]
]

{ #category : 'panes' }
WamSupportingPaneLayoutView >> useSinglePaneLayout [

	"Don't change to single pane"
	self isUsingSinglePaneLayout: false.
]

{ #category : 'panes' }
WamSupportingPaneLayoutView >> useTwoPaneLayout [

	self isUsingSinglePaneLayout: false.
]
