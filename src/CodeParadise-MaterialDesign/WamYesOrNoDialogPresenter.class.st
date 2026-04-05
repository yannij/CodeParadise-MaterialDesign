Class {
	#name : 'WamYesOrNoDialogPresenter',
	#superclass : 'WamDialogContentPresenter',
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'rendering' }
WamYesOrNoDialogPresenter >> renderView [

	self view
		"renderMainContent: self model message;"
		renderButtons: { 'Yes'->true. 'No'->false }
]
