Class {
	#name : 'WamNavActionModel',
	#superclass : 'WamModel',
	#instVars : [
		'eventId',
		'groupTag',
		'iconName',
		'iconLabel',
		'data'
	],
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'instance creation' }
WamNavActionModel class >> newNavAction: id groupTag: groupTag iconName: iconName iconLabel: iconLabel data: data [

	^ self new
		eventId: id;
		groupTag: groupTag;
		iconName: iconName;
		iconLabel: iconLabel;
		data: data;
		yourself
]

{ #category : 'converting' }
WamNavActionModel >> asDictionary [

	^ Dictionary new
		at: #eventId put: eventId;
		at: #groupTag put: groupTag;
		at: #iconName put: iconName;
		at: #iconLabel put: iconLabel;
		at: #data put: data;
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
