Class {
	#name : 'WamYesOrNoDialogPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'view' }
WamYesOrNoDialogPresenter >> handleNavEvent: aNavEvent [
	| eventId |

	self systemLog logTrace: '**** ', aNavEvent printString.

	eventId := aNavEvent id.
	eventId = #dialogAnswer ifTrue: [
		self application dialogOpen: false.
		^ self model answerBlock value: aNavEvent firstParameter. ].

	self systemLog logError: 'No handler: ', aNavEvent id printString.

]

{ #category : 'rendering' }
WamYesOrNoDialogPresenter >> renderView [

	self view renderConfirm: self model message buttons: { 'Yes'->true. 'No'->false }
]

{ #category : 'view' }
WamYesOrNoDialogPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent.

]
