Class {
	#name : 'WamLoginPresenter',
	#superclass : 'WamDialogContentPresenter',
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'rendering' }
WamLoginPresenter >> renderView [

	self view renderWithButtons: { 'Login'->true. 'Cancel'->false }
]
