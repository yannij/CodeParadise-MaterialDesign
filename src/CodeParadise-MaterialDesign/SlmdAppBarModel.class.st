Class {
	#name : 'SlmdAppBarModel',
	#superclass : 'SlmdToolbarModel',
	#instVars : [
		'primary',
		'actionItems',
		'actionGroupToUse'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
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
SlmdAppBarModel >> actionItems [

	^ actionItems
]

{ #category : 'accessing' }
SlmdAppBarModel >> actionItems: anObject [

	actionItems := anObject
]

{ #category : 'accessing' }
SlmdAppBarModel >> actionItemsAdd: anObject [

	self actionItems add: anObject
]

{ #category : 'accessing' }
SlmdAppBarModel >> actionItemsClear [

	self actionItems: OrderedCollection new.

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

{ #category : 'initialization' }
SlmdAppBarModel >> initialize [

	super initialize.

	actionItems := OrderedCollection new.
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
SlmdAppBarModel >> primary [

	^ primary
]

{ #category : 'accessing' }
SlmdAppBarModel >> primary: anObject [

	primary := anObject
]
