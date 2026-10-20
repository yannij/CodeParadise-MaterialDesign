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

	self application processNavActionEvent: aNavEvent model: self model.

	"Note: in the preceeding line, the processing of the event
	results in this presenter being freed, leading to #application
	now answering nil, instead of non-nil in the preceeding line."
	self application ifNotNil: [ :value |
		value layout itemDetailGet notNil ifTrue: [
			self view secondaryPaneOnly ] ].

]

{ #category : 'view' }
WamListItemPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent
]
