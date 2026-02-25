Class {
	#name : 'WamNavActionModel',
	#superclass : 'WamModel',
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
WamNavActionModel class >> newActionSubtype: subtype groupTag: groupTag iconName: iconName iconLabel: iconLabel data: data [

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
WamNavActionModel class >> newNativeSubtype: subtype groupTag: groupTag iconName: iconName iconLabel: iconLabel data: data [

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
WamNavActionModel class >> newNavSubtype: subtype groupTag: groupTag iconName: iconName iconLabel: iconLabel data: data [

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
WamNavActionModel >> asDictionary [

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
WamNavActionModel >> data [

	^ data
]

{ #category : 'accessing' }
WamNavActionModel >> data: anObject [

	data := anObject
]

{ #category : 'accessing' }
WamNavActionModel >> eventId [

	^ eventId
]

{ #category : 'accessing' }
WamNavActionModel >> eventId: anObject [

	eventId := anObject
]

{ #category : 'accessing' }
WamNavActionModel >> eventType [

	^ eventType
]

{ #category : 'accessing' }
WamNavActionModel >> eventType: anObject [

	eventType := anObject
]

{ #category : 'accessing' }
WamNavActionModel >> groupTag [

	^ groupTag
]

{ #category : 'accessing' }
WamNavActionModel >> groupTag: anObject [

	groupTag := anObject
]

{ #category : 'accessing' }
WamNavActionModel >> iconLabel [

	^ iconLabel
]

{ #category : 'accessing' }
WamNavActionModel >> iconLabel: anObject [

	iconLabel := anObject
]

{ #category : 'accessing' }
WamNavActionModel >> iconName [

	^ iconName
]

{ #category : 'accessing' }
WamNavActionModel >> iconName: anObject [

	iconName := anObject
]

{ #category : 'testing' }
WamNavActionModel >> isActionType [

	^ self eventType = #action
]

{ #category : 'testing' }
WamNavActionModel >> isNativeType [

	^ self eventType = #native
]

{ #category : 'testing' }
WamNavActionModel >> isNavType [

	^ self eventType = #nav
]

{ #category : 'accessing' }
WamNavActionModel >> itemName: anObject [

	eventId := anObject
]

{ #category : 'events' }
WamNavActionModel >> navActionAtId: anObject [

	^ self
]

{ #category : 'presenter' }
WamNavActionModel >> preferredPresenterClass [

	self data = #menu ifTrue: [
		^ WamNavActionDropdownPresenter ].

	^ super preferredPresenterClass
]
