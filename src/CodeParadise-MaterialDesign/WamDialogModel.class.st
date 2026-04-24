Class {
	#name : 'WamDialogModel',
	#superclass : 'WamModel',
	#instVars : [
		'contentModel',
		'label',
		'open'
	],
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'instance creation' }
WamDialogModel class >> on: aModel [

	^ self new
		contentModel: aModel;
		yourself
]

{ #category : 'accessing' }
WamDialogModel >> contentModel [

	^ contentModel
]

{ #category : 'accessing' }
WamDialogModel >> contentModel: anObject [

	contentModel := anObject
]

{ #category : 'accessing' }
WamDialogModel >> label [

	^ label
]

{ #category : 'accessing' }
WamDialogModel >> label: anObject [

	label := anObject
]

{ #category : 'accessing' }
WamDialogModel >> setContentModel: anObject [

	self contentModel: anObject.
	self valueChanged.

]
