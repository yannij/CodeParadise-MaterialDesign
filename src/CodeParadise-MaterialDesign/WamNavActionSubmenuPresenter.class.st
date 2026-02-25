Class {
	#name : 'WamNavActionSubmenuPresenter',
	#superclass : 'WamNavActionPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'rendering' }
WamNavActionSubmenuPresenter >> renderView [

	self view renderNavSubmenu: self model asDictionary

]
