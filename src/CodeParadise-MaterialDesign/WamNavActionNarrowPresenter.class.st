Class {
	#name : 'WamNavActionNarrowPresenter',
	#superclass : 'WamNavActionAbstractPresenter',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'rendering' }
WamNavActionNarrowPresenter >> renderView [

	self view renderNavNarrow: self model asDictionary

]
