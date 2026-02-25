Class {
	#name : 'WamNavBarPresenter',
	#superclass : 'WamNavAbstractPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'events' }
WamNavBarPresenter >> handleNavEvent: aNavEvent [

	self application navToNavAction: aNavEvent.

]

{ #category : 'rendering' }
WamNavBarPresenter >> renderView [
	| list |

	list := self model navItems collect: [ :each | each asDictionary ].
	list isEmpty ifTrue: [ ^ self ].
	self view renderNavContent: list asArray.
]

{ #category : 'view' }
WamNavBarPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent

]
