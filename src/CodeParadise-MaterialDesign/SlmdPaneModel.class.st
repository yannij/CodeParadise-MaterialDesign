Class {
	#name : 'SlmdPaneModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'id',
		'content',
		'paneContent',
		'appBarModel',
		'appBarDisplayed'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'instance creation' }
SlmdPaneModel class >> on: aPaneConetentModel [

	^ self new
		paneContent: aPaneConetentModel;
		yourself
]

{ #category : 'accessing' }
SlmdPaneModel >> appBarDisplayed [

	^ appBarDisplayed
]

{ #category : 'accessing' }
SlmdPaneModel >> appBarDisplayed: anObject [

	appBarDisplayed := anObject
]

{ #category : 'accessing' }
SlmdPaneModel >> appBarModel [

	^ appBarModel
]

{ #category : 'accessing' }
SlmdPaneModel >> appBarModel: anObject [

	appBarModel := anObject
]

{ #category : 'actions' }
SlmdPaneModel >> handleActionRequest: aBasicEvent [

	self paneContent handleActionRequest: aBasicEvent.

]

{ #category : 'initialization' }
SlmdPaneModel >> initialize [

	super initialize.

	appBarDisplayed := true.
	appBarModel := SlmdAppBarModel new.

]

{ #category : 'accessing' }
SlmdPaneModel >> paneContent [

	^ paneContent
]

{ #category : 'accessing' }
SlmdPaneModel >> paneContent: anObject [

	paneContent := anObject
]

{ #category : 'accessing' }
SlmdPaneModel >> setPaneContent: anObject [

	self paneContent: anObject.
	self valueChanged.

]
