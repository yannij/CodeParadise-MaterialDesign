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
WamPaneLayoutView class >> stylePaneLayout [

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

.wam-body-split-panel {
  height: 100%;
}

.wam-pane-layout wa-split-panel::part(divider) {
  background-color: var(--wa-color-brand-fill-quiet);
}
'
]

{ #category : 'panes' }
WamPaneLayoutView >> bodyHeightAdapt: heightReduction [

	self subclassResponsibility
]

{ #category : 'panes' }
WamPaneLayoutView >> bodyRegionFind [

	self subclassResponsibility
]

{ #category : 'panes' }
WamPaneLayoutView >> bodyWidthAdaptWith: aScaffold [
	| reduceByWidth widthString |

	reduceByWidth := aScaffold bodyWidthReduction.
	"aScaffold showSidesheet ifTrue: [ reduceByWidth := reduceByWidth + 300 ]."
	widthString := reduceByWidth > 0
		ifTrue: [ 'calc(100vw - ', reduceByWidth printString, 'px)' ]
		ifFalse: [ '100vw' ].

	self bodyRegionFind
		ifNil: [ self systemLog logError: 'Missing body region' ]
		ifNotNil: [ :value | value styleAt: 'width' put: widthString ].

]

{ #category : 'initialization' }
WamPaneLayoutView >> initialize [

	super initialize.

	isUsingSinglePaneLayout := true.

]

{ #category : 'accessing' }
WamPaneLayoutView >> isUsingSinglePaneLayout [

	^ isUsingSinglePaneLayout
]

{ #category : 'accessing' }
WamPaneLayoutView >> isUsingSinglePaneLayout: anObject [

	isUsingSinglePaneLayout := anObject
]

{ #category : 'accessing - components' }
WamPaneLayoutView >> pane1View [

	self subclassResponsibility
]

{ #category : 'panes' }
WamPaneLayoutView >> pane1WidthComputeWith: aScaffoldView [

	self subclassResponsibility

]

{ #category : 'panes' }
WamPaneLayoutView >> pane1WidthMin [

	^ 300
]

{ #category : 'accessing - components' }
WamPaneLayoutView >> pane2View [

	self subclassResponsibility
]

{ #category : 'panes' }
WamPaneLayoutView >> paneLayoutAdaptWith: aScaffoldView [

	self subclassResponsibility
]

{ #category : 'accessing - components' }
WamPaneLayoutView >> sidesheetView [

	^ self firstChildAtSlotNamed: #sidesheet
]

{ #category : 'panes' }
WamPaneLayoutView >> useSinglePaneLayout [

	self subclassResponsibility
]

{ #category : 'panes' }
WamPaneLayoutView >> useTwoPaneLayout [

	self subclassResponsibility
]
