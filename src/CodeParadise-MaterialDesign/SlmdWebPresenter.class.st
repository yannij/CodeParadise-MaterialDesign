Class {
	#name : 'SlmdWebPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'view' }
SlmdWebPresenter >> viewCreated [

	super viewCreated.

	self view
		when: SlmdLoginRequested send: #handleLoginRequested: to: self application
]
