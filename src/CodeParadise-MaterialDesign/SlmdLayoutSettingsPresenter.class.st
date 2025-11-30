Class {
	#name : 'SlmdLayoutSettingsPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'events' }
SlmdLayoutSettingsPresenter >> handleNavEvent: anObject [
	| subtype |

	self systemLog logTrace: anObject printString.

	subtype := anObject parameterAt: #subtype.

	subtype = #layoutSettingChange ifTrue: [
		^ self model doLayoutSettings: anObject ].

	self systemLog logError: 'Unhandled event: ', subtype printString.

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
		modalDivSetUp: props;
		layoutInitialSetUp: props.

]
