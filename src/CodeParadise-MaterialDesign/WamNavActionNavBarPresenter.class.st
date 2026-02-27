Class {
	#name : 'WamNavActionNavBarPresenter',
	#superclass : 'WamNavActionAbstractPresenter',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'rendering' }
WamNavActionNavBarPresenter >> renderView [

	self view renderNavBarItem: self model asDictionary

]
