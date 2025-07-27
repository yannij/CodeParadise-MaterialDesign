Class {
	#name : 'MD3ExampleApplicationPresenter',
	#superclass : 'CpPresenter',
	#category : 'CodeParadise-MaterialDesign-SimpleDemoApp',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'SimpleDemoApp'
}

{ #category : 'view' }
MD3ExampleApplicationPresenter >> renderView [

	self renderAllChildViewsForModels: {self model layout} atSlotNamed: #layout
]
