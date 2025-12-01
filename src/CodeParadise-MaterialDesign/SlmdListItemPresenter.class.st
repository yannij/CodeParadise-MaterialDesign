Class {
	#name : 'SlmdListItemPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'events' }
SlmdListItemPresenter >> handleNavEvent: aNavEvent [

	self systemLog logTrace: aNavEvent printString.

	aNavEvent id = #setDetail ifFalse: [
		self systemLog logError: 'Expected #setDetail' ].

	self view secondaryPaneOnly.
	self application handleSetDetail: self model.
	self appBar2ButtonsSetEditDelete.

]

{ #category : 'rendering' }
SlmdListItemPresenter >> renderView [

	self view
		renderListItemMap: self model wrappedModel asListItemMap
		index: self model index.

]

{ #category : 'view' }
SlmdListItemPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent
]
