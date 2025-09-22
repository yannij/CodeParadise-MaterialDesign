Class {
	#name : 'SlmdNavActionPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'rendering' }
SlmdNavActionPresenter >> renderView [

	self view
		renderNavItem: self model asDictionary expanded: self application layout layoutSettings navRailExpanded
]
