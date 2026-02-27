Class {
	#name : 'WamNavActionDialogPresenter',
	#superclass : 'WamNavActionAbstractPresenter',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'rendering' }
WamNavActionDialogPresenter >> renderView [

	self view renderDialogItem: self model asDictionary

]
