Class {
	#name : 'SlmdDemoAccountingAppPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'events' }
SlmdDemoAccountingAppPresenter >> handleLoginRequested: anObject [

	self traceCr: 'handleLoginRequested:'.
	self application username: 'foobar'.
	self application layout valueChanged.

]

{ #category : 'rendering' }
SlmdDemoAccountingAppPresenter >> renderView [

	self renderAllChildViewsForModels: {self model layout} atSlotNamed: #layout.

]

{ #category : 'view' }
SlmdDemoAccountingAppPresenter >> viewCreated [

	super viewCreated.

	self view
		when: SlmdLoginRequested send: #handleLoginRequested: to: self
]
