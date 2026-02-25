Class {
	#name : 'WamAppBarModel',
	#superclass : 'WamToolbarModel',
	#instVars : [
		'primary',
		'headline',
		'actionGroupToUse',
		'leadingAction'
	],
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'accessing' }
WamAppBarModel >> actionGroupToUse [

	^ actionGroupToUse
]

{ #category : 'accessing' }
WamAppBarModel >> actionGroupToUse: anObject [

	actionGroupToUse := anObject
]

{ #category : 'accessing' }
WamAppBarModel >> bePrimary [

	self primary: true.
	self actionGroupToUse: #appBar1.

]

{ #category : 'accessing' }
WamAppBarModel >> beSecondary [

	self primary: false.
	self actionGroupToUse: #appBar2.

]

{ #category : 'accessing' }
WamAppBarModel >> headline [

	^ headline
]

{ #category : 'accessing' }
WamAppBarModel >> headline: anObject [

	headline := anObject
]

{ #category : 'initialization' }
WamAppBarModel >> initialize [

	super initialize.

	self bePrimary.

]

{ #category : 'testing' }
WamAppBarModel >> isPrimary [

	^ self primary = true
]

{ #category : 'testing' }
WamAppBarModel >> isSecondary [

	^ self isPrimary not
]

{ #category : 'accessing' }
WamAppBarModel >> leadingAction [

	^ leadingAction
]

{ #category : 'accessing' }
WamAppBarModel >> leadingAction: anObject [

	leadingAction := anObject
]

{ #category : 'events' }
WamAppBarModel >> navActionAtId: anObject [

	self leadingAction ifNotNil: [ :value |
		value eventId = anObject ifTrue: [
			^ anObject = #back ifTrue: [ #back ] ifFalse: [ value ] ] ].

	^ self navActionItems detect: [ :each | each eventId = anObject ] ifNone: [].

]

{ #category : 'accessing' }
WamAppBarModel >> primary [

	^ primary
]

{ #category : 'accessing' }
WamAppBarModel >> primary: anObject [

	primary := anObject
]
