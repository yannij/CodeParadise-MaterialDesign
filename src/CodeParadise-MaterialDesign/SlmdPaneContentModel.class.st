Class {
	#name : 'SlmdPaneContentModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'content'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'instance creation' }
SlmdPaneContentModel class >> on: aString [

	^ self new
		content: aString;
		yourself
]

{ #category : 'accessing' }
SlmdPaneContentModel >> content [

	^ content
]

{ #category : 'accessing' }
SlmdPaneContentModel >> content: anObject [

	content := anObject
]

{ #category : 'actions' }
SlmdPaneContentModel >> handleActionRequest: aBasicEvent [

	self setContent: (aBasicEvent parameterAt: #to).

]

{ #category : 'accessing' }
SlmdPaneContentModel >> setContent: anObject [

	self content: anObject.
	self valueChanged.

]
