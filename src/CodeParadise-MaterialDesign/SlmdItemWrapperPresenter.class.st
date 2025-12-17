Class {
	#name : 'SlmdItemWrapperPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'rendering' }
SlmdItemWrapperPresenter >> renderView [

	self
		renderChildViewForModel: self model wrappedModel
		atSlotNamed: #wrapped
]
