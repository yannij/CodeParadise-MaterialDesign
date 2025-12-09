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

	aNavEvent id = #setDetail ifTrue: [
		self view secondaryPaneOnly.
		self application processListDetail: self model event: aNavEvent.
		self application ifNotNil: [ :value | value setAppBar2EditDelete ].
		^ self ].

	aNavEvent id = #metaDetail ifTrue: [
		self view secondaryPaneOnly.
		self application processListMetaDetail: self model event: aNavEvent.
		self application ifNotNil: [ :value | value setAppBar2EditDelete ].
		^ self ].

	"self systemLog logError: 'No handler for: ', aNavEvent printString."
	self application processNavActionEvent: aNavEvent.

]

{ #category : 'rendering' }
SlmdListItemPresenter >> renderView [

	self view renderListItemMap: self model wrappedModel asListItemMap.

]

{ #category : 'view' }
SlmdListItemPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent
]
