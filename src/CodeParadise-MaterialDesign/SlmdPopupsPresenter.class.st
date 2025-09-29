Class {
	#name : 'SlmdPopupsPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'rendering' }
SlmdPopupsPresenter >> renderView [

	self
		renderAllChildViewsForModels: self model popups
		atSlotNamed: #content
]
