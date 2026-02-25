Class {
	#name : 'WamDemoAccountingAppPresenter',
	#superclass : 'WamWebPresenter',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'rendering' }
WamDemoAccountingAppPresenter >> renderView [

	self renderAllChildViewsForModels: {self model layout} atSlotNamed: #layout.

]

{ #category : 'view' }
WamDemoAccountingAppPresenter >> viewInitialized [

	super viewInitialized.

	self view registerIcons.

]
