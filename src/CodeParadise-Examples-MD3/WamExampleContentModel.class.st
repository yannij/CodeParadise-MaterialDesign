Class {
	#name : 'WamExampleContentModel',
	#superclass : 'WamModel',
	#instVars : [
		'content'
	],
	#category : 'CodeParadise-Examples-MD3-SimpleDemo',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'SimpleDemo'
}

{ #category : 'instance creation' }
WamExampleContentModel class >> on: aString [

	^ self new
		content: aString;
		yourself
]

{ #category : 'accessing' }
WamExampleContentModel >> content [

	^ content
]

{ #category : 'accessing' }
WamExampleContentModel >> content: anObject [

	content := anObject
]

{ #category : 'actions' }
WamExampleContentModel >> processNavActionEvent: aBasicEvent [

	self setContent: aBasicEvent data.

]

{ #category : 'accessing' }
WamExampleContentModel >> setContent: anObject [

	self content: anObject.
	self valueChanged.

]
