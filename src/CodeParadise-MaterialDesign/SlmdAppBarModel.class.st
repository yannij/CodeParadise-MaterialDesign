Class {
	#name : 'SlmdAppBarModel',
	#superclass : 'SlmdToolbarModel',
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
SlmdAppBarModel >> actionGroupToUse [

	^ actionGroupToUse
]

{ #category : 'accessing' }
SlmdAppBarModel >> actionGroupToUse: anObject [

	actionGroupToUse := anObject
]

{ #category : 'accessing' }
SlmdAppBarModel >> bePrimary [

	self primary: true.
	self actionGroupToUse: #primary.

]

{ #category : 'accessing' }
SlmdAppBarModel >> beSecondary [

	self primary: false.
	self actionGroupToUse: #secondary.

]

{ #category : 'accessing' }
SlmdAppBarModel >> headline [

	^ headline
]

{ #category : 'accessing' }
SlmdAppBarModel >> headline: anObject [

	headline := anObject
]

{ #category : 'initialization' }
SlmdAppBarModel >> initialize [

	super initialize.

	headline := ''.
	self bePrimary.

]

{ #category : 'testing' }
SlmdAppBarModel >> isPrimary [

	^ self primary = true
]

{ #category : 'testing' }
SlmdAppBarModel >> isSecondary [

	^ self isPrimary not
]

{ #category : 'accessing' }
SlmdAppBarModel >> leadingAction [

	^ leadingAction
]

{ #category : 'accessing' }
SlmdAppBarModel >> leadingAction: anObject [

	leadingAction := anObject
]

{ #category : 'events' }
SlmdAppBarModel >> navActionFind: anObject [

	self leadingAction ifNotNil: [ :value |
		value eventSubtype = anObject ifTrue: [
			^ anObject = #back ifTrue: [ #back ] ifFalse: [ value ] ] ].

	^ self navActionItems detect: [ :each | each eventSubtype = anObject ] ifNone: [].

]

{ #category : 'accessing' }
SlmdAppBarModel >> primary [

	^ primary
]

{ #category : 'accessing' }
SlmdAppBarModel >> primary: anObject [

	primary := anObject
]
