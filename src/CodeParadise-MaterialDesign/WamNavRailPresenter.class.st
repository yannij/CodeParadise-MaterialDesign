Class {
	#name : 'WamNavRailPresenter',
	#superclass : 'WamNavAbstractPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'rendering' }
WamNavRailPresenter >> renderView [

	self
		renderAllChildViewsForModels: self model navItems
		atSlotNamed: #content
]
