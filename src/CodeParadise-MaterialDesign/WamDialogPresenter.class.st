Class {
	#name : 'WamDialogPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'rendering' }
WamDialogPresenter >> renderView [

	self model label ifNotNil: [ :value |
		self view renderLabel: value ].

	self model contentModel ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #content ].

	self view renderOpen: self model open.

]
