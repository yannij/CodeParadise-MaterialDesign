Class {
	#name : 'WamDialogModel',
	#superclass : 'WamModel',
	#instVars : [
		'contentModel',
		'label',
		'body',
		'open'
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

{ #category : 'initialization' }
WamDialogModel >> initialize [

	super initialize.

	open := false.

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
WamDialogModel >> open [

	^ open
]

{ #category : 'accessing' }
WamDialogModel >> open: anObject [

	open := anObject
]

{ #category : 'accessing' }
WamDialogModel >> setContentModel: anObject [

	self contentModel: anObject.
	self valueChanged.
	"self body: self contentModel printString."

]

{ #category : 'accessing' }
WamDialogModel >> setOpen: aBoolean [

	self open: aBoolean.
	self valueChanged.

]
