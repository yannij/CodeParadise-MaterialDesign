Class {
	#name : 'TBRootPresenter',
	#superclass : 'SlmdWebPresenter',
	#category : 'CodeParadise-Examples-MD3-TinyBlog',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'TinyBlog'
}

{ #category : 'rendering' }
TBRootPresenter >> renderView [

	self renderAllChildViewsForModels: {self model layout} atSlotNamed: #layout
]
