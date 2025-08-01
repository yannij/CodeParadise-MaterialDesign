Class {
	#name : 'SlmdItemWrapperPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceListDetail'
}

{ #category : 'rendering' }
SlmdItemWrapperPresenter >> renderView [

	"self view renderButtons."

	self
		renderChildViewForModel: self model wrappedModel
		atSlotNamed: #wrapped
]
