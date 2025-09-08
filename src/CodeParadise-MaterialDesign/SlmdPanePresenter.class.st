Class {
	#name : 'SlmdPanePresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'rendering' }
SlmdPanePresenter >> renderView [

	self model appBarModel ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #appBar ].

	self model paneContent
		ifNil: [
			self view removeChildrenAtSlotNamed: #paneContent.
			self removeAllChildPresentersAtSlotNamed: #paneContent ]
		ifNotNil: [ :value | self renderChildViewForModel: value atSlotNamed: #paneContent ].

]
