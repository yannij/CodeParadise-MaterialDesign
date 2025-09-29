Class {
	#name : 'SlmdNavActionSubmenuPresenter',
	#superclass : 'SlmdNavActionPresenter',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'rendering' }
SlmdNavActionSubmenuPresenter >> renderView [

	self view renderNavSubmenu: self model asDictionary

]
