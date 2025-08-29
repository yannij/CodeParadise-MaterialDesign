Class {
	#name : 'MD3ExampleApplicationPresenter',
	#superclass : 'CpPresenter',
	#category : 'CodeParadise-Examples-MD3-SimpleDemo',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'SimpleDemo'
}

{ #category : 'view' }
MD3ExampleApplicationPresenter >> renderView [

	self renderAllChildViewsForModels: {self model layout} atSlotNamed: #layout
]
