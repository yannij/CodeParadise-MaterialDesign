Class {
	#name : 'WamInputDialogPresenter',
	#superclass : 'WamDialogContentPresenter',
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'accessing' }
WamInputDialogPresenter class >> defaultViewClass [

	^ WamInputDialogView
]

{ #category : 'rendering' }
WamInputDialogPresenter >> renderView [

	self view renderWithButtons: { 'Save'->true. 'Cancel'->false }.

]
