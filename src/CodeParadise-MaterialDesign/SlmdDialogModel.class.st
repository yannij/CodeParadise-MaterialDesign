Class {
	#name : 'SlmdDialogModel',
	#superclass : 'SlmdModel',
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
SlmdDialogModel class >> on: aModel [

	^ self new
		contentModel: aModel;
		yourself
]

{ #category : 'accessing' }
SlmdDialogModel >> body [

	^ body
]

{ #category : 'accessing' }
SlmdDialogModel >> body: anObject [

	body := anObject
]

{ #category : 'accessing' }
SlmdDialogModel >> contentModel [

	^ contentModel
]

{ #category : 'accessing' }
SlmdDialogModel >> contentModel: anObject [

	contentModel := anObject
]

{ #category : 'accessing' }
SlmdDialogModel >> label [

	^ label
]

{ #category : 'accessing' }
SlmdDialogModel >> label: anObject [

	label := anObject
]

{ #category : 'accessing' }
SlmdDialogModel >> setContentModel: anObject [

	self contentModel: anObject.
	self valueChanged.
	"self body: self contentModel printString."

]
