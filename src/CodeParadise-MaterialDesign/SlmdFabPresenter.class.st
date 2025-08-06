Class {
	#name : 'SlmdFabPresenter',
	#superclass : 'SlmdToolbarPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'initialization' }
SlmdFabPresenter >> actionGroupToUse [

	^ #fab
]

{ #category : 'rendering' }
SlmdFabPresenter >> renderView [

	self actionItemFabOrNil ifNotNil: [ :value |
		self view renderFab: value asDictionary ].

]
