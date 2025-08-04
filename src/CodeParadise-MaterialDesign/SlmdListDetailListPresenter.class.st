Class {
	#name : 'SlmdListDetailListPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceListDetail'
}

{ #category : 'rendering' }
SlmdListDetailListPresenter >> renderView [

	self view
		renderTextSlot: 'listItem'
		value: self model wrappedModel title
		index: self model index
]
