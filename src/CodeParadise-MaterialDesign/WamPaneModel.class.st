Class {
	#name : 'WamPaneModel',
	#superclass : 'WamModel',
	#instVars : [
		'paneContent',
		'appBarModel',
		'appBarDisplayed'
	],
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'instance creation' }
WamPaneModel class >> on: aPaneConetentModel [

	^ self new
		paneContent: aPaneConetentModel;
		yourself
]

{ #category : 'accessing' }
WamPaneModel >> appBarDisplayed [

	^ appBarDisplayed
]

{ #category : 'accessing' }
WamPaneModel >> appBarDisplayed: anObject [

	appBarDisplayed := anObject
]

{ #category : 'accessing' }
WamPaneModel >> appBarModel [

	^ appBarModel
]

{ #category : 'accessing' }
WamPaneModel >> appBarModel: anObject [

	appBarModel := anObject
]

{ #category : 'initialization' }
WamPaneModel >> initialize [

	super initialize.

	appBarDisplayed := true.
	appBarModel := WamAppBarModel new.

]

{ #category : 'accessing' }
WamPaneModel >> paneContent [

	^ paneContent
]

{ #category : 'accessing' }
WamPaneModel >> paneContent: anObject [

	paneContent := anObject
]

{ #category : 'actions' }
WamPaneModel >> processNavActionEvent: aBasicEvent [

	self paneContent processNavActionEvent: aBasicEvent.

]

{ #category : 'accessing' }
WamPaneModel >> setPaneContent: anObject [

	self paneContent: anObject.
	self valueChanged.

]
