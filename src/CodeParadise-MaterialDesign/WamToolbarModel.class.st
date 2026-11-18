Class {
	#name : 'WamToolbarModel',
	#superclass : 'WamModel',
	#instVars : [
		'navActionItems',
		'hidden'
	],
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'initialization' }
WamToolbarModel >> actionGroupToUse [

	self subclassResponsibility
]

{ #category : 'view' }
WamToolbarModel >> actionItemsToUse [

	^ self application navItemSpecsInGroup: self actionGroupToUse
]

{ #category : 'accessing' }
WamToolbarModel >> addItem: anObject [

	self navActionItems add: anObject
]

{ #category : 'accessing' }
WamToolbarModel >> hidden [

	^ hidden
]

{ #category : 'accessing' }
WamToolbarModel >> hidden: anObject [

	hidden := anObject
]

{ #category : 'initialization' }
WamToolbarModel >> initialize [

	super initialize.

	hidden := false.
	self navActionItemsClear.

]

{ #category : 'events' }
WamToolbarModel >> navActionAtId: anObject [

	^ self navActionItems detect: [ :each | each eventId = anObject ] ifNone: [].

]

{ #category : 'accessing' }
WamToolbarModel >> navActionItems [

	^ navActionItems
]

{ #category : 'accessing' }
WamToolbarModel >> navActionItems: anObject [

	navActionItems := anObject
]

{ #category : 'accessing' }
WamToolbarModel >> navActionItemsAdd: anObject [

	self navActionItems add: anObject
]

{ #category : 'accessing' }
WamToolbarModel >> navActionItemsAddAll: anObject [

	self navActionItems addAll: anObject
]

{ #category : 'accessing' }
WamToolbarModel >> navActionItemsClear [

	self navActionItems: OrderedCollection new.

]
