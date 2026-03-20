Class {
	#name : 'WamYesOrNoDialogModel',
	#superclass : 'WamModel',
	#instVars : [
		'message',
		'answerBlock'
	],
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'instance creation' }
WamYesOrNoDialogModel class >> confirm: aString onAnswer: aBlock [

	^ self new
		message: aString;
		answerBlock: aBlock;
		yourself
]

{ #category : 'accessing' }
WamYesOrNoDialogModel >> answerBlock [

	^ answerBlock
]

{ #category : 'accessing' }
WamYesOrNoDialogModel >> answerBlock: anObject [

	answerBlock := anObject
]

{ #category : 'accessing' }
WamYesOrNoDialogModel >> message [

	^ message
]

{ #category : 'accessing' }
WamYesOrNoDialogModel >> message: anObject [

	message := anObject
]
