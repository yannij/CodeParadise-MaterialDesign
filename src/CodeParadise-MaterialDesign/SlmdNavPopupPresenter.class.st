Class {
	#name : 'SlmdNavPopupPresenter',
	#superclass : 'SlmdPresenter',
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

self traceCr: self class name, ': ', self id printString.
self traceCr: '1: ', self model popupName printString.
self traceCr: '2: ', self model hash printString.
	self view setUpWithName: self model popupName.

]
