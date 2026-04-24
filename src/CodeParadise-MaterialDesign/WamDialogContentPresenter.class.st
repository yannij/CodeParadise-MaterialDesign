Class {
	#name : 'WamDialogContentPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'view' }
WamDialogContentPresenter >> handleNavEvent: aNavEvent [
	| eventId |

	self systemLog logTrace: '**** ', aNavEvent printString.

	eventId := aNavEvent id.
	eventId = #dialogAnswer ifTrue: [
		^ self model answerBlock value: aNavEvent parameters. ].

	self systemLog logError: 'No handler: ', aNavEvent id printString.

]

{ #category : 'view' }
WamDialogContentPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent.

]
