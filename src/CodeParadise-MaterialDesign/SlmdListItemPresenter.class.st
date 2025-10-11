Class {
	#name : 'SlmdListItemPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'rendering' }
SlmdListItemPresenter >> renderView [

	self view
		renderListItemMap: self model wrappedModel asListItemMap
		index: self model index.

]
