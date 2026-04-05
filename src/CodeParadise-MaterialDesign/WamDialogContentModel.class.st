Class {
	#name : 'WamDialogContentModel',
	#superclass : 'WamModel',
	#instVars : [
		'message',
		'answerBlock'
	],
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'accessing' }
WamDialogContentModel >> answerBlock [

	^ answerBlock
]

{ #category : 'accessing' }
WamDialogContentModel >> answerBlock: anObject [

	answerBlock := anObject
]

{ #category : 'accessing' }
WamDialogContentModel >> message [

	^ message
]

{ #category : 'accessing' }
WamDialogContentModel >> message: anObject [

	message := anObject
]
