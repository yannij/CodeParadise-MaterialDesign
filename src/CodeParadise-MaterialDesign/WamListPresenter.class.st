Class {
	#name : 'WamListPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'rendering' }
WamListPresenter >> renderView [

	self
		renderAllChildViewsForModels: self model list
		usingPresenter: WamListItemPresenter
		atSlotNamed: #list
]
