Class {
	#name : 'SlmdPaneModel',
	#superclass : 'SlmdModel',
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

{ #category : 'actions' }
SlmdPaneModel >> processNavActionEvent: aBasicEvent [

	self paneContent processNavActionEvent: aBasicEvent.

]

{ #category : 'accessing' }
SlmdPaneModel >> setPaneContent: anObject [

	"self paneContent: anObject."
	"self paneContent setContent: anObject."
	"self paneContent ifNotNil: [ :value | value setContent: anObject ]."
	self paneContent: anObject.
	self valueChanged.

]
