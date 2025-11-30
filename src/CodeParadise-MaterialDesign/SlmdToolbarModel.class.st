Class {
	#name : 'SlmdToolbarModel',
	#superclass : 'SlmdModel',
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
SlmdToolbarModel >> actionGroupToUse [

	self subclassResponsibility
]

{ #category : 'view' }
SlmdToolbarModel >> actionItemFabOrNil [

	^ self application userEventSpecFAB
]

{ #category : 'view' }
SlmdToolbarModel >> actionItemsToUse [

	^ self application actionItemsInGroup: self actionGroupToUse
]

{ #category : 'accessing' }
SlmdToolbarModel >> addItem: anObject [

	self navActionItems add: anObject
]

{ #category : 'accessing' }
SlmdToolbarModel >> fab [

	^ fab
]

{ #category : 'accessing' }
SlmdToolbarModel >> fab: anObject [

	fab := anObject
]

{ #category : 'initialization' }
SlmdToolbarModel >> initialize [

	super initialize.

	self navActionItemsClear.

]

{ #category : 'accessing' }
SlmdToolbarModel >> isVisible [

	^ isVisible
]

{ #category : 'accessing' }
SlmdToolbarModel >> isVisible: anObject [

	isVisible := anObject
]

{ #category : 'events' }
SlmdToolbarModel >> navActionFind: anObject [

	^ self navActionItems detect: [ :each | each itemName = anObject ] ifNone: [].

]

{ #category : 'accessing' }
SlmdToolbarModel >> navActionItems [

	^ navActionItems
]

{ #category : 'accessing' }
SlmdToolbarModel >> navActionItems: anObject [

	navActionItems := anObject
]

{ #category : 'accessing' }
SlmdToolbarModel >> navActionItemsAdd: anObject [

	self navActionItems add: anObject
]

{ #category : 'accessing' }
SlmdToolbarModel >> navActionItemsAddAll: anObject [

	self navActionItems addAll: anObject
]

{ #category : 'accessing' }
SlmdToolbarModel >> navActionItemsClear [

	self navActionItems: OrderedCollection new.

]
