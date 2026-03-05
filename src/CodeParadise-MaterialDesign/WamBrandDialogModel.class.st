Class {
	#name : 'WamBrandDialogModel',
	#superclass : 'WamModel',
	#instVars : [
		'contentModel',
		'label',
		'body',
		'open'
	],
	#category : 'CodeParadise-MaterialDesign-Preferences',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Preferences'
}

{ #category : 'instance creation' }
WamBrandDialogModel class >> on: aModel [

	^ self new
		contentModel: aModel;
		yourself
]

{ #category : 'accessing' }
WamBrandDialogModel >> body [

	^ body
]

{ #category : 'accessing' }
WamBrandDialogModel >> body: anObject [

	body := anObject
]

{ #category : 'accessing' }
WamBrandDialogModel >> contentModel [

	^ contentModel
]

{ #category : 'accessing' }
WamBrandDialogModel >> contentModel: anObject [

	contentModel := anObject
]

{ #category : 'accessing' }
WamBrandDialogModel >> label [

	^ label
]

{ #category : 'accessing' }
WamBrandDialogModel >> label: anObject [

	label := anObject
]

{ #category : 'accessing' }
WamBrandDialogModel >> open [

	^ open
]

{ #category : 'accessing' }
WamBrandDialogModel >> open: anObject [

	open := anObject
]

{ #category : 'initialization' }
WamBrandDialogModel >> setContentModel: anObject [

	self contentModel: anObject.
	"anObject valueChanged."
	self valueChanged.
	"self body: self contentModel printString."

]

{ #category : 'initialization' }
WamBrandDialogModel >> setOpen: aBoolean [

	self open: aBoolean.
	self valueChanged.

]
