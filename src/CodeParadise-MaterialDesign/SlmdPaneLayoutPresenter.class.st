Class {
	#name : 'SlmdPaneLayoutPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'rendering' }
SlmdPaneLayoutPresenter >> renderView [

	self model pane1 ifNotNil: [ :value |
		"self renderChildViewForModel: value atSlotNamed: #singlePaneLayoutP1."
		self renderChildViewForModel: value atSlotNamed: #twoPaneLayoutP1 ].

	self model pane2 ifNotNil: [ :value |
		"self renderChildViewForModel: value atSlotNamed: #singlePaneLayoutP2."
		self renderChildViewForModel: value atSlotNamed: #twoPaneLayoutP2 ].

]
