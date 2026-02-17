Class {
	#name : 'SlmdListPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'rendering' }
SlmdListPresenter >> renderView [

	self
		renderAllChildViewsForModels: self model list
		usingPresenter: SlmdListItemPresenter
		atSlotNamed: #list
]
