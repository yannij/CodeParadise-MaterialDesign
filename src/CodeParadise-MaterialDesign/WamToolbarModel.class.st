Class {
	#name : 'WamToolbarModel',
	#superclass : 'WamModel',
	#instVars : [
		'fab',
		'isVisible',
		'navActionItems'
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
WamToolbarModel >> actionItemFabOrNil [

	^ self application userEventSpecFAB
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
WamToolbarModel >> fab [

	^ fab
]

{ #category : 'accessing' }
WamToolbarModel >> fab: anObject [

	fab := anObject
]

{ #category : 'initialization' }
WamToolbarModel >> initialize [

	super initialize.

	self navActionItemsClear.

]

{ #category : 'accessing' }
WamToolbarModel >> isVisible [

	^ isVisible
]

{ #category : 'accessing' }
WamToolbarModel >> isVisible: anObject [

	isVisible := anObject
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
