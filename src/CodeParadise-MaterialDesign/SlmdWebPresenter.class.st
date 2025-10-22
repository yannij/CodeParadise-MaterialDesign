Class {
	#name : 'SlmdWebPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'view' }
SlmdWebPresenter >> viewCreated [

	super viewCreated.

	self view
		when: SlmdLoginRequested send: #handleLoginRequested: to: self application
]

{ #category : 'view' }
SlmdWebPresenter >> viewInitialized [

	super viewInitialized.

	self view registerIcons.

]
