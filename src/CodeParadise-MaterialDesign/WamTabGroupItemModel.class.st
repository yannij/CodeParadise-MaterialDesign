Class {
	#name : 'WamTabGroupItemModel',
	#superclass : 'WamModel',
	#instVars : [
		'tabName',
		'tabContent'
	],
	#category : 'CodeParadise-MaterialDesign-Preferences',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Preferences'
}

{ #category : 'instance creation' }
WamTabGroupItemModel class >> on: aContent label: aString [

	^ self new
		tabName: aString;
		tabContent: aContent;
		yourself
]

{ #category : 'accessing' }
WamTabGroupItemModel >> tabContent [

	^ tabContent
]

{ #category : 'accessing' }
WamTabGroupItemModel >> tabContent: anObject [

	tabContent := anObject
]

{ #category : 'accessing' }
WamTabGroupItemModel >> tabName [

	^ tabName
]

{ #category : 'accessing' }
WamTabGroupItemModel >> tabName: anObject [

	tabName := anObject
]
