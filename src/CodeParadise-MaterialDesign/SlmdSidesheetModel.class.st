Class {
	#name : 'SlmdSidesheetModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'paneContent'
	],
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'instance creation' }
SlmdSidesheetModel class >> on: aPaneConetentModel [

	^ self new
		paneContent: aPaneConetentModel;
		yourself
]

{ #category : 'accessing' }
SlmdSidesheetModel >> paneContent [

	^ paneContent
]

{ #category : 'accessing' }
SlmdSidesheetModel >> paneContent: anObject [

	paneContent := anObject
]
