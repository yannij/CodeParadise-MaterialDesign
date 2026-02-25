Class {
	#name : 'WamExampleAppPresenter',
	#superclass : 'WamWebPresenter',
	#category : 'CodeParadise-Examples-MD3-SimpleDemo',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'SimpleDemo'
}

{ #category : 'view' }
WamExampleAppPresenter >> renderView [

	self renderAllChildViewsForModels: {self model layout} atSlotNamed: #layout
]
