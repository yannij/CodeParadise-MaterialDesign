Class {
	#name : 'WamPaneContentModel',
	#superclass : 'WamModel',
	#instVars : [
		'content'
	],
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'instance creation' }
WamPaneContentModel class >> on: aString [

	^ self new
		content: aString;
		yourself
]

{ #category : 'accessing' }
WamPaneContentModel >> content [

	^ content
]

{ #category : 'accessing' }
WamPaneContentModel >> content: anObject [

	content := anObject
]

{ #category : 'actions' }
WamPaneContentModel >> processNavActionEvent: aBasicEvent [
	| newContent |

	newContent := (aBasicEvent eventType = #nav)
		ifTrue: [ aBasicEvent data ]
		ifFalse: [ aBasicEvent eventId ].
	self setContent: newContent.

]

{ #category : 'accessing' }
WamPaneContentModel >> setContent: anObject [

	self content: anObject.
	self valueChanged.

]
