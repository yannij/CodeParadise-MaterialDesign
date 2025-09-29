Class {
	#name : 'SlmdNavRailPresenter',
	#superclass : 'SlmdNavPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'rendering' }
SlmdNavRailPresenter >> renderView [

	"self removeAllChildPresentersAtSlotNamed: #content.
	self view removeChildrenAtSlotNamed: #content.
"
	self
		renderAllChildViewsForModels: self model navItems
		atSlotNamed:  #content
]
