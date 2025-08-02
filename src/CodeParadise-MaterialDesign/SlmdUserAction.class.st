Class {
	#name : 'SlmdUserAction',
	#superclass : 'Object',
	#instVars : [
		'itemName',
		'userActionType',
		'iconName',
		'iconLabel',
		'groupTag'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'instance creation' }
SlmdUserAction class >> actionItemName: itemName groupTag: groupTag iconName: iconName iconLabel: iconLabel [

	^ self new
		itemName: itemName;
		userActionType: self userActionTypeAction;
		groupTag: groupTag;
		iconName: iconName;
		iconLabel: iconLabel;
		yourself
]

{ #category : 'instance creation' }
SlmdUserAction class >> navItemName: itemName groupTag: groupTag iconName: iconName iconLabel: iconLabel [

	^ self new
		itemName: itemName;
		userActionType: self userActionTypeNav;
		groupTag: groupTag;
		iconName: iconName;
		iconLabel: iconLabel;
		yourself
]

{ #category : 'accessing' }
SlmdUserAction class >> userActionTypeAction [

	^ #action
]

{ #category : 'accessing' }
SlmdUserAction class >> userActionTypeNav [

	^ #nav
]

{ #category : 'converting' }
SlmdUserAction >> asDictionary [

	^ Dictionary new
		at: #itemName put: itemName;
		at: #userActionType put: self userActionType;
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
SlmdUserAction >> userActionType [

	^ userActionType
]

{ #category : 'accessing' }
SlmdUserAction >> userActionType: anObject [

	userActionType := anObject
]
