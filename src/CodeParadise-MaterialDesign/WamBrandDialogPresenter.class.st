Class {
	#name : 'WamBrandDialogPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Preferences',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Preferences'
}

{ #category : 'rendering' }
WamBrandDialogPresenter >> renderView [

	self model label ifNotNil: [ :value |
		self view renderLabel: value ].

	self model contentModel ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #layoutSettings.
		self view openDialog ].

	self view renderOpen: self model open.

]
