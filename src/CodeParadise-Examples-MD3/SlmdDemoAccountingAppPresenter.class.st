Class {
	#name : 'SlmdDemoAccountingAppPresenter',
	#superclass : 'SlmdWebPresenter',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'rendering' }
SlmdDemoAccountingAppPresenter >> renderView [

	self renderAllChildViewsForModels: {self model layout} atSlotNamed: #layout.

]

{ #category : 'view' }
SlmdDemoAccountingAppPresenter >> viewInitialized [

	super viewInitialized.

	self view registerIcons.

]
