Class {
	#name : 'WamNavRailModalPresenter',
	#superclass : 'WamNavAbstractPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'events' }
WamNavRailModalPresenter >> handleNavEvent: aNavEvent [

	self application navToNavAction: aNavEvent.

]

{ #category : 'rendering' }
WamNavRailModalPresenter >> renderView [
	| list |

	list := self model navItems collect: [ :each | each asDictionary ].
	list isEmpty ifTrue: [ ^ self ].
	self view renderNavContent: list asArray.
]

{ #category : 'view' }
WamNavRailModalPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent

]
