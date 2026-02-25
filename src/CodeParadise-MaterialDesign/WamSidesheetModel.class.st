Class {
	#name : 'WamSidesheetModel',
	#superclass : 'WamModel',
	#instVars : [
		'paneContent'
	],
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'instance creation' }
WamSidesheetModel class >> on: aPaneConetentModel [

	^ self new
		paneContent: aPaneConetentModel;
		yourself
]

{ #category : 'accessing' }
WamSidesheetModel >> paneContent [

	^ paneContent
]

{ #category : 'accessing' }
WamSidesheetModel >> paneContent: anObject [

	paneContent := anObject
]
