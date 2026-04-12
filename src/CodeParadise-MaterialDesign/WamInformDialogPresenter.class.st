Class {
	#name : 'WamInformDialogPresenter',
	#superclass : 'WamDialogContentPresenter',
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'rendering' }
WamInformDialogPresenter >> renderView [

	self view renderWithButtons: { 'Okay'->nil }
]
