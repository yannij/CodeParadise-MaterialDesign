Class {
	#name : 'SlmdNavRailPresenter',
	#superclass : 'SlmdNavAbstractPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'rendering' }
SlmdNavRailPresenter >> renderView [

	self
		renderAllChildViewsForModels: self model navItems
		atSlotNamed: #content
]
