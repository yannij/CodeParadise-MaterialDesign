Class {
	#name : 'SlmdPaneLayoutPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
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
