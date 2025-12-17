Class {
	#name : 'SlmdListDetailPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'rendering' }
SlmdListDetailPresenter >> renderView [

	self
		renderAllChildViewsForModels: self model list
		usingPresenter: SlmdListItemPresenter
		atSlotNamed: #list
]
