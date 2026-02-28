Class {
	#name : 'WamPanePresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'rendering' }
WamPanePresenter >> renderView [

	self model appBarModel
		ifNil: [
			self renderAllChildViewsForModels: {} atSlotNamed: #appBar ]
		ifNotNil: [ :value |
			self renderChildViewForModel: value atSlotNamed: #appBar ].

	self model paneContent
		ifNil: [
			self renderAllChildViewsForModels: {} atSlotNamed: #paneContent ]
		ifNotNil: [ :value |
			self renderChildViewForModel: value atSlotNamed: #paneContent ].

]
