Class {
	#name : 'WamNavActionSubmenuPresenter',
	#superclass : 'WamNavActionAbstractPresenter',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'rendering' }
WamNavActionSubmenuPresenter >> renderView [

	self view renderNavSubmenu: self model asDictionary

]
