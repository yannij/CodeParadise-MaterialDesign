Class {
	#name : 'WamNavActionExpandedPresenter',
	#superclass : 'WamNavAbstractPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'rendering' }
WamNavActionExpandedPresenter >> renderView [

	self view renderNavExpanded: self model asDictionary

]

{ #category : 'view' }
WamNavActionExpandedPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent

]
