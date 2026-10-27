Class {
	#name : 'WamSupportingPaneLayoutPresenter',
	#superclass : 'WamPaneLayoutPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'accessing' }
WamSupportingPaneLayoutPresenter class >> defaultViewClass [

	^ WamSupportingPaneLayoutView
]

{ #category : 'accessing' }
WamSupportingPaneLayoutPresenter class >> strategyName [

	^ #supportingPane
]

{ #category : 'rendering' }
WamSupportingPaneLayoutPresenter >> renderView [

	self model scaffold pane1 ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #focusPane ].

	self model scaffold pane2 ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #supportingPane ].

	self model scaffold sidesheet ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #sidesheet ].

]
