Class {
	#name : 'SlmdNavActionModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'eventType',
		'eventSubtype',
		'data',
		'iconName',
		'iconLabel',
		'groupTag'
	],
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'instance creation' }
SlmdNavActionModel class >> newActionSubtype: subtype groupTag: groupTag iconName: iconName iconLabel: iconLabel data: data [

	^ self new
		eventType: #action;
		eventSubtype: subtype;
		groupTag: groupTag;
		iconName: iconName;
		iconLabel: iconLabel;
		data: data;
		yourself
]

{ #category : 'instance creation' }
SlmdNavActionModel class >> newNativeSubtype: subtype groupTag: groupTag iconName: iconName iconLabel: iconLabel data: data [

	^ self new
		eventType: #native;
		eventSubtype: subtype;
		groupTag: groupTag;
		iconName: iconName;
		iconLabel: iconLabel;
		data: data;
		yourself
]

{ #category : 'instance creation' }
SlmdNavActionModel class >> newNavSubtype: subtype groupTag: groupTag iconName: iconName iconLabel: iconLabel data: data [

	^ self new
		eventType: #nav;
		eventSubtype: subtype;
		groupTag: groupTag;
		iconName: iconName;
		iconLabel: iconLabel;
		data: data;
		yourself
]

{ #category : 'converting' }
SlmdNavActionModel >> asDictionary [

	^ Dictionary new
		at: #type put: eventType;
		at: #subtype put: eventSubtype;
		at: #data put: data;
		at: #groupTag put: groupTag;
		at: #iconName put: iconName;
		at: #iconLabel put: iconLabel;
		yourself
]

{ #category : 'accessing' }
SlmdNavActionModel >> data [

	^ data
]

{ #category : 'accessing' }
SlmdNavActionModel >> data: anObject [

	data := anObject
]

{ #category : 'accessing' }
SlmdNavActionModel >> eventSubtype [

	^ eventSubtype
]

{ #category : 'accessing' }
SlmdNavActionModel >> eventSubtype: anObject [

	eventSubtype := anObject
]

{ #category : 'accessing' }
SlmdNavActionModel >> eventType [

	^ eventType
]

{ #category : 'accessing' }
SlmdNavActionModel >> eventType: anObject [

	eventType := anObject
]

{ #category : 'accessing' }
SlmdNavActionModel >> groupTag [

	^ groupTag
]

{ #category : 'accessing' }
SlmdNavActionModel >> groupTag: anObject [

	groupTag := anObject
]

{ #category : 'accessing' }
SlmdNavActionModel >> iconLabel [

	^ iconLabel
]

{ #category : 'accessing' }
SlmdNavActionModel >> iconLabel: anObject [

	iconLabel := anObject
]

{ #category : 'accessing' }
SlmdNavActionModel >> iconName [

	^ iconName
]

{ #category : 'accessing' }
SlmdNavActionModel >> iconName: anObject [

	iconName := anObject
]

{ #category : 'testing' }
SlmdNavActionModel >> isActionType [

	^ self eventType = #action
]

{ #category : 'testing' }
SlmdNavActionModel >> isNativeType [

	^ self eventType = #native
]

{ #category : 'testing' }
SlmdNavActionModel >> isNavType [

	^ self eventType = #nav
]

{ #category : 'accessing' }
SlmdNavActionModel >> itemName [

	^ eventSubtype
]

{ #category : 'accessing' }
SlmdNavActionModel >> itemName: anObject [

	eventSubtype := anObject
]
