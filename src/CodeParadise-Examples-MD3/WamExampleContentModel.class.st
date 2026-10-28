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
WamExampleContentModel >> doExtraActions: aNavActionEvent [
	| actionId |

	actionId := aNavActionEvent eventId.

	actionId = #clover ifTrue: [
		self application layout paneLayoutBeListDetail; valueChanged.
		^ self ].

	actionId = #diamond ifTrue: [
		self application layout paneLayoutBeFeed; valueChanged.
		^ self ].

	actionId = #heart ifTrue: [
		self application layout paneLayoutBeSupportingPane; valueChanged.
		^ self ].

]

{ #category : 'actions' }
WamExampleContentModel >> processNavActionEvent: aNavActionEvent [

	self doExtraActions: aNavActionEvent.
	self setContent: aNavActionEvent data.

]

{ #category : 'accessing' }
WamExampleContentModel >> setContent: anObject [

	self content: anObject.
	self valueChanged.

]
