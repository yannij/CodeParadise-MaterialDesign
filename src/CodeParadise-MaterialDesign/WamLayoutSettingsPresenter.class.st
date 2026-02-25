Class {
	#name : 'WamLayoutSettingsPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'events' }
WamLayoutSettingsPresenter >> handleNavEvent: anObject [
	| eventId |

	self systemLog logTrace: anObject printString.

	eventId := anObject id.

	eventId = #layoutSettingChange ifTrue: [
		^ self model doLayoutSettings: anObject ].

	self systemLog logError: 'Unhandled event: ', eventId printString.

]

{ #category : 'view' }
WamLayoutSettingsPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent
]

{ #category : 'view' }
WamLayoutSettingsPresenter >> viewInitialized [
	| props |

	super viewInitialized.

	props := self model asMap.
	self view
		renderContent: props;
		layoutInitialSetUp: props;
		yourself.

]
