Class {
	#name : 'SlmdUserAction',
	#superclass : 'Object',
	#instVars : [
		'itemName',
		'iconName',
		'iconLabel',
		'groupTag',
		'navTo'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'instance creation' }
SlmdUserAction class >> itemName: itemName groupTag: groupTag iconName: iconName iconLabel: iconLabel [

	^ self new
		itemName: itemName;
		groupTag: groupTag;
		iconName: iconName;
		iconLabel: iconLabel;
		yourself
]

{ #category : 'instance creation' }
SlmdUserAction class >> itemName: itemName groupTag: groupTag iconName: iconName iconLabel: iconLabel navTo: navTo [

	^ self new
		itemName: itemName;
		groupTag: groupTag;
		iconName: iconName;
		iconLabel: iconLabel;
		navTo: navTo;
		yourself
]

{ #category : 'converting' }
SlmdUserAction >> asDictionary [

	^ Dictionary new
		at: #itemName put: itemName;
		at: #navTo put: navTo;
		at: #groupTag put: groupTag;
		at: #iconName put: iconName;
		at: #iconLabel put: iconLabel;
		yourself
]

{ #category : 'accessing' }
SlmdUserAction >> groupTag [

	^ groupTag
]

{ #category : 'accessing' }
SlmdUserAction >> groupTag: anObject [

	groupTag := anObject
]

{ #category : 'accessing' }
SlmdUserAction >> iconLabel [

	^ iconLabel
]

{ #category : 'accessing' }
SlmdUserAction >> iconLabel: anObject [

	iconLabel := anObject
]

{ #category : 'accessing' }
SlmdUserAction >> iconName [

	^ iconName
]

{ #category : 'accessing' }
SlmdUserAction >> iconName: anObject [

	iconName := anObject
]

{ #category : 'accessing' }
SlmdUserAction >> itemName [

	^ itemName
]

{ #category : 'accessing' }
SlmdUserAction >> itemName: anObject [

	itemName := anObject
]

{ #category : 'accessing' }
SlmdUserAction >> navTo [

	^ navTo
]

{ #category : 'accessing' }
SlmdUserAction >> navTo: anObject [

	navTo := anObject
]
