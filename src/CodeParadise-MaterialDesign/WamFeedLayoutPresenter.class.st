Class {
	#name : 'WamFeedLayoutPresenter',
	#superclass : 'WamResponsiveLayoutPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'accessing' }
WamFeedLayoutPresenter class >> defaultViewClass [

	^ WamFeedLayoutView
]

{ #category : 'rendering' }
WamFeedLayoutPresenter >> renderPanes [

	self model pane1 ifNotNil: [ :value |
		self model layoutPresenterChanged ifTrue: [
			self renderAllChildViewsForModels: {} atSlotNamed: #singlePaneLayoutP1.
			self model layoutPresenterChanged: false ].
		self renderChildViewForModel: value atSlotNamed: #singlePaneLayoutP1 ].

	self model sidesheet ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #sidesheet ].

]
