Class {
	#name : 'WamWebPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'view' }
WamWebPresenter >> viewCreated [

	super viewCreated.

	self view
		when: WamLoginRequested send: #handleLoginRequested: to: self application
]
