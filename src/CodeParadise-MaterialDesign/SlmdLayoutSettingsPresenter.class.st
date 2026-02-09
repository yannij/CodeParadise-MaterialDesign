Class {
	#name : 'SlmdLayoutSettingsPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'events' }
SlmdLayoutSettingsPresenter >> handleNavEvent: anObject [
	| eventId |

	self systemLog logTrace: anObject printString.

	eventId := anObject id.

	eventId = #layoutSettingChange ifTrue: [
		^ self model doLayoutSettings: anObject ].

	self systemLog logError: 'Unhandled event: ', eventId printString.

]

{ #category : 'view' }
SlmdLayoutSettingsPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent
]

{ #category : 'view' }
SlmdLayoutSettingsPresenter >> viewInitialized [
	| props |

	super viewInitialized.

	props := self model asMap.
	self view
		renderContent: props;
		layoutInitialSetUp: props;
		yourself.

]
