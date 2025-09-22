Class {
	#name : 'SlmdNavActionPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'rendering' }
SlmdNavActionPresenter >> renderView [

	self view
		renderNavItem: self model asDictionary expanded: self application layout layoutSettings navRailExpanded
]
