Class {
	#name : 'SlmdListDetailListPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'rendering' }
SlmdListDetailListPresenter >> renderView [

	self view
		renderTextSlot: 'listItem'
		value: self model wrappedModel slmdShortSummary
		index: self model index
]
