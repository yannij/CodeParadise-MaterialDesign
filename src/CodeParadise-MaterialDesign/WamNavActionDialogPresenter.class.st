Class {
	#name : 'WamNavActionDialogPresenter',
	#superclass : 'WamNavActionAbstractPresenter',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'events' }
WamNavActionDialogPresenter >> handleNavEvent: aNavEvent [

	self systemLog logTrace: '**** ', aNavEvent printString.

	super handleNavEvent: aNavEvent.

	self systemLog logError: 'Not found: ', aNavEvent id printString.

]

{ #category : 'rendering' }
WamNavActionDialogPresenter >> renderView [

	self view renderDialogItem: self model asDictionary

]
