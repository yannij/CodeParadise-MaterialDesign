Class {
	#name : 'SlmdNavPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'rendering' }
SlmdNavPresenter >> renderView [

	self view renderNavContent: (self application navActions collect: [ :each | each asDictionary ]) asArray.

]

{ #category : 'view' }
SlmdNavPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavRequest.

]
