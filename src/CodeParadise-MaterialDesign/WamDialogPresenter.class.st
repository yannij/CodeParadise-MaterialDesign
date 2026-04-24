Class {
	#name : 'WamDialogPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'rendering' }
WamDialogPresenter >> renderView [

	self model contentModel ifNotNil: [ :content |
		content message ifNotNil: [ :value | self view renderLabel: value ].
		self renderChildViewForModel: content atSlotNamed: #content ].

]
