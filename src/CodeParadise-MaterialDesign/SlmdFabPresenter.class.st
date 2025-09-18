Class {
	#name : 'SlmdFabPresenter',
	#superclass : 'SlmdToolbarPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'rendering' }
SlmdFabPresenter >> renderView [

	self model fab ifNotNil: [ :value |
		self view renderFab: value asDictionary ].

]
