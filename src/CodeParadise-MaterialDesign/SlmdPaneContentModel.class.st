Class {
	#name : 'SlmdPaneContentModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'content'
	],
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
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
SlmdPaneContentModel >> processNavActionEvent: aBasicEvent [
	| newContent |

	newContent := (aBasicEvent eventType = #nav)
		ifTrue: [ aBasicEvent data ]
		ifFalse: [ aBasicEvent eventId ].
	self setContent: newContent.

]

{ #category : 'accessing' }
SlmdPaneContentModel >> setContent: anObject [

	self content: anObject.
	self valueChanged.

]
