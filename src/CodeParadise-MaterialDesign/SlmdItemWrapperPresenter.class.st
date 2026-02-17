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
		renderAllChildViewsForModels: (self model wrappedModel ifNil: [{}] ifNotNil: [ :value | {value} ])
		atSlotNamed: #wrapped
]
