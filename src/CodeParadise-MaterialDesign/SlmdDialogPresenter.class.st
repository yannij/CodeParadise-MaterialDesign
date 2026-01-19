Class {
	#name : 'SlmdDialogPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'rendering' }
SlmdDialogPresenter >> renderView [

	self model label ifNotNil: [ :value |
		self view renderLabel: value ].
	self model contentModel ifNotNil: [ :value |
		"self renderAllChildViewsForModels: self model contentList usingPresenter: Md3ObjectInListPresenter atSlotNamed: #content."
		self renderChildViewForModel: value atSlotNamed: #content.
		self view openDialog ]

]
