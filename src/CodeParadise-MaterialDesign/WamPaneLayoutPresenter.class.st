Class {
	#name : 'WamPaneLayoutPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'rendering' }
WamPaneLayoutPresenter >> renderView [

	self model pane1 ifNotNil: [ :value |
		"self renderChildViewForModel: value atSlotNamed: #singlePaneLayoutP1."
		self renderChildViewForModel: value atSlotNamed: #twoPaneLayoutP1 ].

	self model pane2 ifNotNil: [ :value |
		"self renderChildViewForModel: value atSlotNamed: #singlePaneLayoutP2."
		self renderChildViewForModel: value atSlotNamed: #twoPaneLayoutP2 ].

	"self model sidesheet ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #sidesheet ]."

]
