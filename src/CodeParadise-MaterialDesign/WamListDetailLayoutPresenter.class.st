Class {
	#name : 'WamListDetailLayoutPresenter',
	#superclass : 'WamResponsiveLayoutPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'accessing' }
WamListDetailLayoutPresenter class >> defaultViewClass [

	^ WamListDetailLayoutView 
]

{ #category : 'rendering' }
WamListDetailLayoutPresenter >> renderPanes [

	self model pane1 ifNotNil: [ :value |
		"self renderChildViewForModel: value atSlotNamed: #singlePaneLayoutP1."
		self renderChildViewForModel: value atSlotNamed: #twoPaneLayoutP1 ].

	self model pane2 ifNotNil: [ :value |
		"self renderChildViewForModel: value atSlotNamed: #singlePaneLayoutP2."
		self renderChildViewForModel: value atSlotNamed: #twoPaneLayoutP2 ].

	self model sidesheet ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #sidesheet ].

]
