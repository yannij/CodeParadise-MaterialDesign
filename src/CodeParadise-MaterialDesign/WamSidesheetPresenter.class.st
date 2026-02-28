Class {
	#name : 'WamSidesheetPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'rendering' }
WamSidesheetPresenter >> renderView [

	self model paneContent
		ifNil: [
			self renderAllChildViewsForModels: {} atSlotNamed: #paneContent ]
		ifNotNil: [ :value | 
			self renderChildViewForModel: value atSlotNamed: #paneContent ].
]
