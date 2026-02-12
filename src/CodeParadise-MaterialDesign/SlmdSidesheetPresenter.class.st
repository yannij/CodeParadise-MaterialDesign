Class {
	#name : 'SlmdSidesheetPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'rendering' }
SlmdSidesheetPresenter >> renderView [

	self model paneContent
		ifNil: [
			self view removeChildrenAtSlotNamed: #paneContent.
			self removeAllChildPresentersAtSlotNamed: #paneContent ]
		ifNotNil: [ :value | self renderChildViewForModel: value atSlotNamed: #paneContent ].
]
