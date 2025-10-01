Class {
	#name : 'SlmdPopupsPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'rendering' }
SlmdPopupsPresenter >> renderView [
	"Render all popups.
	NOTE: popups are held in an ordered dictionary.
	It seems that presenters get re-used, by changing the model held.
	However, using values from popup during rendering is timing dependent.
	In SlmdNavPopupPresenter>>viewInitialized, the model accesses popupName,
	but it gets the popupName from the previous model attached to the presenter.
	Therefore, need to keep the rendering order the same.
	What happens if popups are removed? Does the problem re-appear?
	"

	self
		renderAllChildViewsForModels: self model popups values
		atSlotNamed: #content
]
