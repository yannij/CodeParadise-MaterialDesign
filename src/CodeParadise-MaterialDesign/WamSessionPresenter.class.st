Class {
	#name : 'WamSessionPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'rendering' }
WamSessionPresenter >> renderView [

	self renderAllChildViewsForModels: self sessionNavItems usingPresenter: WamNavActionDialogPresenter atSlotNamed: nil
]

{ #category : 'rendering' }
WamSessionPresenter >> sessionNavItems [
	| items logInOrOut|

	logInOrOut := self model isAuthenticated ifTrue: [ #logout ] ifFalse: [ #login ].

	items := OrderedCollection new.
	items
		add: (self application nativeEventSpecAt: logInOrOut).
	^ items
]
