Class {
	#name : 'WamDialogModel',
	#superclass : 'WamModel',
	#instVars : [
		'contentModel',
		'label',
		'body'
	],
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'instance creation' }
WamDialogModel class >> on: aModel [

	^ self new
		contentModel: aModel;
		yourself
]

{ #category : 'accessing' }
WamDialogModel >> body [

	^ body
]

{ #category : 'accessing' }
WamDialogModel >> body: anObject [

	body := anObject
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
	"self body: self contentModel printString."

]
