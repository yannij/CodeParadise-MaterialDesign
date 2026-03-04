Class {
	#name : 'WamBrandDialogModel',
	#superclass : 'WamModel',
	#instVars : [
		'contentModel',
		'label',
		'body'
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

{ #category : 'initialization' }
WamBrandDialogModel >> setContentModel: anObject [

	self contentModel: anObject.
	self valueChanged.
	"self body: self contentModel printString."

]
