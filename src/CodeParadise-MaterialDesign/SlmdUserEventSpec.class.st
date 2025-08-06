Class {
	#name : 'SlmdUserEventSpec',
	#superclass : 'Object',
	#instVars : [
		'eventType',
		'iconName',
		'iconLabel',
		'groupTag',
		'eventSubtype',
		'data'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'instance creation' }
SlmdUserEventSpec class >> type: type subtype: subtype groupTag: groupTag iconName: iconName iconLabel: iconLabel [

	^ self type: type subtype: subtype groupTag: groupTag iconName: iconName iconLabel: iconLabel data: nil
]

{ #category : 'instance creation' }
SlmdUserEventSpec class >> type: type subtype: subtype groupTag: groupTag iconName: iconName iconLabel: iconLabel data: data [

	^ self new
		eventType: type;
		eventSubtype: subtype;
		groupTag: groupTag;
		iconName: iconName;
		iconLabel: iconLabel;
		data: data;
		yourself
]

{ #category : 'converting' }
SlmdUserEventSpec >> asDictionary [

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
SlmdUserEventSpec >> data [

	^ data
]

{ #category : 'accessing' }
SlmdUserEventSpec >> data: anObject [

	data := anObject
]

{ #category : 'accessing' }
SlmdUserEventSpec >> eventSubtype [

	^ eventSubtype
]

{ #category : 'accessing' }
SlmdUserEventSpec >> eventSubtype: anObject [

	eventSubtype := anObject
]

{ #category : 'accessing' }
SlmdUserEventSpec >> eventType [

	^ eventType
]

{ #category : 'accessing' }
SlmdUserEventSpec >> eventType: anObject [

	eventType := anObject
]

{ #category : 'accessing' }
SlmdUserEventSpec >> groupTag [

	^ groupTag
]

{ #category : 'accessing' }
SlmdUserEventSpec >> groupTag: anObject [

	groupTag := anObject
]

{ #category : 'accessing' }
SlmdUserEventSpec >> iconLabel [

	^ iconLabel
]

{ #category : 'accessing' }
SlmdUserEventSpec >> iconLabel: anObject [

	iconLabel := anObject
]

{ #category : 'accessing' }
SlmdUserEventSpec >> iconName [

	^ iconName
]

{ #category : 'accessing' }
SlmdUserEventSpec >> iconName: anObject [

	iconName := anObject
]

{ #category : 'testing' }
SlmdUserEventSpec >> isActionType [

	^ self eventType = #action
]

{ #category : 'testing' }
SlmdUserEventSpec >> isNativeType [

	^ self eventType = #native
]

{ #category : 'testing' }
SlmdUserEventSpec >> isNavType [

	^ self eventType = #nav
]

{ #category : 'accessing' }
SlmdUserEventSpec >> itemName [

	^ eventSubtype
]

{ #category : 'accessing' }
SlmdUserEventSpec >> itemName: anObject [

	eventSubtype := anObject
]
