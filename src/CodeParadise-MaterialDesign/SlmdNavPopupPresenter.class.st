Class {
	#name : 'SlmdNavPopupPresenter',
	#superclass : 'SlmdNavPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'rendering' }
SlmdNavPopupPresenter >> renderView [

	self
		renderAllChildViewsForModels: self model navItems
		usingPresenter: SlmdNavActionSubmenuPresenter
		atSlotNamed: #content
]

{ #category : 'view' }
SlmdNavPopupPresenter >> viewInitialized [

	super viewInitialized.

	self view setUpWithName: self model popupName.

]
