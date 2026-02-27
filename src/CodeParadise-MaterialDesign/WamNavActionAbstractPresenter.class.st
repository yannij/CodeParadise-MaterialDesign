Class {
	#name : 'WamNavActionAbstractPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'view' }
WamNavActionAbstractPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent

]
