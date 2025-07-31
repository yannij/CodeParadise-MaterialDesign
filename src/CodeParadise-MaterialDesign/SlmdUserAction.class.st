Class {
	#name : 'SlmdUserAction',
	#superclass : 'Object',
	#instVars : [
		'itemName',
		'iconName',
		'iconLabel',
		'groupTag'
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

{ #category : 'converting' }
SlmdUserAction >> asDictionary [

	self subclassResponsibility
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
