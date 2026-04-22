Class {
	#name : 'WamPreferencesPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Preferences',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Preferences'
}

{ #category : 'events' }
WamPreferencesPresenter >> handleNavEvent: anObject [
	| eventId |

	self systemLog logTrace: anObject printString.

	eventId := anObject id.

	eventId = #layoutSettingChange ifTrue: [
		^ self model doLayoutSettings: anObject ].

	self systemLog logError: 'Unhandled event: ', eventId printString.

]

{ #category : 'rendering' }
WamPreferencesPresenter >> renderView [
	| props |

	props := self model asMap.
	self view
		renderContent: props;
		"layoutInitialSetUp: props;"
		yourself.

]

{ #category : 'view' }
WamPreferencesPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent
]
