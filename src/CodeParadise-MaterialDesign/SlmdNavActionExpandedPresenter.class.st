Class {
	#name : 'SlmdNavActionExpandedPresenter',
	#superclass : 'SlmdNavAbstractPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'rendering' }
SlmdNavActionExpandedPresenter >> renderView [

	self view renderNavExpanded: self model asDictionary

]

{ #category : 'view' }
SlmdNavActionExpandedPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent

]
