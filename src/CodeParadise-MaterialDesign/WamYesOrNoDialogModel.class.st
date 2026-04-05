Class {
	#name : 'WamYesOrNoDialogModel',
	#superclass : 'WamDialogContentModel',
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
