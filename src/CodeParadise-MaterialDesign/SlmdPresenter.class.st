Class {
	#name : 'SlmdPresenter',
	#superclass : 'CpPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'testing' }
SlmdPresenter class >> isAbstract [

	^ self == SlmdPresenter
]

{ #category : 'events' }
SlmdPresenter >> dispatchUserEvent: anObject [

	self handleUserEvent: anObject
]

{ #category : 'events' }
SlmdPresenter >> handleUserEvent: anObject [

	"self logTrace5: anObject printString method: 'handleAction:'."

]

{ #category : 'accessing - model' }
SlmdPresenter >> layout [

	^ self application layout
]

{ #category : 'events' }
SlmdPresenter >> subscribeToUserEvent [

	self view when: SlmdUserEvent send: #dispatchUserEvent: to: self
]

{ #category : 'accessing' }
SlmdPresenter >> systemLog [

	^ SlmdLog
]

{ #category : 'view' }
SlmdPresenter >> viewCreated [

	self view logTrace: '' method: 'viewCreated'.
	super viewCreated
]

{ #category : 'view' }
SlmdPresenter >> viewInitialized [

	self view logTrace: '' method: 'viewInitialized'.
	super viewInitialized
]
