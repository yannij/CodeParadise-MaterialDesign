Class {
	#name : 'SlmdNavRailPresenter',
	#superclass : 'SlmdNavPresenter',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
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
