Class {
	#name : 'SlmdNavActionModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'eventId',
		'eventType',
		'groupTag',
		'iconName',
		'iconLabel',
		'data'
	],
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'instance creation' }
SlmdNavActionModel class >> newActionSubtype: subtype groupTag: groupTag iconName: iconName iconLabel: iconLabel data: data [

	^ self new
		eventType: #action;
		eventId: subtype;
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
		eventId: subtype;
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
		eventId: subtype;
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
		at: #eventId put: eventId;
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
SlmdNavActionModel >> eventId [

	^ eventId
]

{ #category : 'accessing' }
SlmdNavActionModel >> eventId: anObject [

	eventId := anObject
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
SlmdNavActionModel >> itemName: anObject [

	eventId := anObject
]

{ #category : 'events' }
SlmdNavActionModel >> navActionAtId: anObject [

	^ self
]

{ #category : 'presenter' }
SlmdNavActionModel >> preferredPresenterClass [

	self data = #menu ifTrue: [
		^ SlmdNavActionDropdownPresenter ].

	^ super preferredPresenterClass
]
