Class {
	#name : 'WamFeedLayoutPresenter',
	#superclass : 'WamPaneLayoutPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'accessing' }
WamFeedLayoutPresenter class >> defaultViewClass [

	^ WamFeedLayoutView
]

{ #category : 'rendering' }
WamFeedLayoutPresenter >> renderView [

	self model scaffold pane1 ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #singlePaneLayoutP1 ].

	self model scaffold sidesheet ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #sidesheet ].

]
