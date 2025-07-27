Class {
	#name : 'SlmdNavAction',
	#superclass : 'Object',
	#instVars : [
		'id',
		'actionGroup',
		'iconName',
		'iconLabel',
		'actionName',
		'arg1'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'instance creation' }
SlmdNavAction class >> id: id actionGroup: groupName iconName: iconName iconLabel: iconLabel arg1: arg1 [

	^ self new
		id: id;
		actionGroup: groupName;
		iconName: iconName;
		iconLabel: iconLabel;
		arg1: arg1;
		yourself
]

{ #category : 'instance creation' }
SlmdNavAction class >> id: id iconName: iconName iconLabel: iconLabel actionName: actionName actionGroup: groupName arg1: arg1 [

	^ self new
		id: id;
		iconName: iconName;
		iconLabel: iconLabel;
		actionName: actionName;
		actionGroup: groupName;
		arg1: arg1;
		yourself
]

{ #category : 'instance creation' }
SlmdNavAction class >> id: id iconName: iconName iconLabel: iconLabel arg1: arg1 [

	^ self id: id iconName: iconName iconLabel: iconLabel actionName: nil actionGroup: #primary arg1: arg1
]

{ #category : 'accessing' }
SlmdNavAction >> actionGroup [

	^ actionGroup
]

{ #category : 'accessing' }
SlmdNavAction >> actionGroup: anObject [

	actionGroup := anObject
]

{ #category : 'accessing' }
SlmdNavAction >> actionName [

	^ actionName
]

{ #category : 'accessing' }
SlmdNavAction >> actionName: anObject [

	actionName := anObject
]

{ #category : 'accessing' }
SlmdNavAction >> arg1 [

	^ arg1
]

{ #category : 'accessing' }
SlmdNavAction >> arg1: anObject [

	arg1 := anObject
]

{ #category : 'converting' }
SlmdNavAction >> asDictionary [

	^ Dictionary new
		at: #id put: id;
		at: #actionGroup put: actionGroup;
		at: #actionName put: actionName;
		at: #iconName put: iconName;
		at: #iconLabel put: iconLabel;
		at: #arg1 put: arg1;
		yourself
]

{ #category : 'accessing' }
SlmdNavAction >> iconLabel [

	^ iconLabel
]

{ #category : 'accessing' }
SlmdNavAction >> iconLabel: anObject [

	iconLabel := anObject
]

{ #category : 'accessing' }
SlmdNavAction >> iconName [

	^ iconName
]

{ #category : 'accessing' }
SlmdNavAction >> iconName: anObject [

	iconName := anObject
]

{ #category : 'accessing' }
SlmdNavAction >> id [

	^ id
]

{ #category : 'accessing' }
SlmdNavAction >> id: anObject [

	id := anObject
]
