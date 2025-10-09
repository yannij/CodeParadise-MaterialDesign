Class {
	#name : 'SlmdPanePresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'rendering' }
SlmdPanePresenter >> renderView [

	self model appBarModel ifNotNil: [ :value |
		self model appBarDisplayed
			ifTrue: [
				self renderChildViewForModel: value atSlotNamed: #appBar ]
			ifFalse: [
				self view removeChildrenAtSlotNamed: #appBar.
				self removeAllChildPresentersAtSlotNamed: #appBar ] ].

	self model paneContent
		ifNil: [
			self view removeChildrenAtSlotNamed: #paneContent.
			self removeAllChildPresentersAtSlotNamed: #paneContent ]
		ifNotNil: [ :value | self renderChildViewForModel: value atSlotNamed: #paneContent ].

]
