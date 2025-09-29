Class {
	#name : 'SlmdFabPresenter',
	#superclass : 'SlmdToolbarPresenter',
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'rendering' }
SlmdFabPresenter >> renderView [

	self model fab ifNotNil: [ :value |
		self view renderFab: value asDictionary ].

]
