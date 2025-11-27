Class {
	#name : 'SlmdNavActionSubmenuPresenter',
	#superclass : 'SlmdNavActionPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'rendering' }
SlmdNavActionSubmenuPresenter >> renderView [

	self view renderNavSubmenu: self model asDictionary

]
