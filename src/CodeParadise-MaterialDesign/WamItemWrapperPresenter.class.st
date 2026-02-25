Class {
	#name : 'WamItemWrapperPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'rendering' }
WamItemWrapperPresenter >> renderView [

	self
		renderAllChildViewsForModels: (self model wrappedModel ifNil: [{}] ifNotNil: [ :value | {value} ])
		atSlotNamed: #wrapped
]
