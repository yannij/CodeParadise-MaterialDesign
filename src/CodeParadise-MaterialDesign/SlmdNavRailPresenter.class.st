Class {
	#name : 'SlmdNavRailPresenter',
	#superclass : 'SlmdNavPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
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
