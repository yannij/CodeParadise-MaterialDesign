Class {
	#name : 'WamListDetailLayoutPresenter',
	#superclass : 'WamPaneLayoutPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'accessing' }
WamListDetailLayoutPresenter class >> defaultViewClass [

	^ WamListDetailLayoutView 
]

{ #category : 'rendering' }
WamListDetailLayoutPresenter >> renderView [

	self model scaffold pane1 ifNotNil: [ :value |
		"self renderChildViewForModel: value atSlotNamed: #singlePaneLayoutP1."
		self renderChildViewForModel: value atSlotNamed: #twoPaneLayoutP1 ].

	self model scaffold pane2 ifNotNil: [ :value |
		"self renderChildViewForModel: value atSlotNamed: #singlePaneLayoutP2."
		self renderChildViewForModel: value atSlotNamed: #twoPaneLayoutP2 ].

	self model scaffold sidesheet ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #sidesheet ].

]
