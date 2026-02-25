Class {
	#name : 'WamListItemPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'events' }
WamListItemPresenter >> handleNavEvent: aNavEvent [

	self systemLog logTrace: aNavEvent printString.

	self view secondaryPaneOnly.
	self application processNavActionEvent: aNavEvent model: self model.

]

{ #category : 'rendering' }
WamListItemPresenter >> renderView [

	self view renderListItem: self model wrappedModel asListItemMap.

]

{ #category : 'view' }
WamListItemPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent
]
