Class {
	#name : 'WamLoginPresenter',
	#superclass : 'WamDialogContentPresenter',
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'rendering' }
WamLoginPresenter >> renderView [

	self view
		renderMainContent: self model message;
		renderButtons: { 'Login'->true. 'Cancel'->false }
]
