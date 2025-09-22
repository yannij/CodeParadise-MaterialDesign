Class {
	#name : 'SlmdFabPresenter',
	#superclass : 'SlmdToolbarPresenter',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'rendering' }
SlmdFabPresenter >> renderView [

	self model fab ifNotNil: [ :value |
		self view renderFab: value asDictionary ].

]
