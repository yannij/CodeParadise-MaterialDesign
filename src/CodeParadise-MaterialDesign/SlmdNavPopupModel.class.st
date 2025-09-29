Class {
	#name : 'SlmdNavPopupModel',
	#superclass : 'SlmdNavModel',
	#instVars : [
		'popupName'
	],
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'instance creation' }
SlmdNavPopupModel class >> named: aSymbol [

	^ self new popupName: aSymbol; yourself
]

{ #category : 'accessing' }
SlmdNavPopupModel >> popupName [

	^ popupName
]

{ #category : 'accessing' }
SlmdNavPopupModel >> popupName: anObject [

	popupName := anObject
]
