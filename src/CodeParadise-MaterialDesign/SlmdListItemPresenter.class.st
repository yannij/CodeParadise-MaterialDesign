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

	self view secondaryPaneOnly.
	self application processNavActionEvent: aNavEvent model: self model.

]

{ #category : 'rendering' }
SlmdListItemPresenter >> renderView [

	self view renderListItem: self model wrappedModel asListItemMap.

]

{ #category : 'view' }
SlmdListItemPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent
]
