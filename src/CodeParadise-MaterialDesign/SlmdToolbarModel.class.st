Class {
	#name : 'SlmdToolbarModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'fab',
		'isVisible',
		'iconButtons'
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
	| list groupName |

	list := self application actionItems.
	groupName := self actionGroupToUse.
	^ list select: [ :each | each groupTag = groupName ]
]

{ #category : 'accessing' }
SlmdToolbarModel >> addItem: anObject [

	self iconButtons add: anObject
]

{ #category : 'accessing' }
SlmdToolbarModel >> clearItems [

	self iconButtons: OrderedCollection new.

]

{ #category : 'accessing' }
SlmdToolbarModel >> fab [

	^ fab
]

{ #category : 'accessing' }
SlmdToolbarModel >> fab: anObject [

	fab := anObject
]

{ #category : 'accessing' }
SlmdToolbarModel >> iconButtons [

	^ iconButtons
]

{ #category : 'accessing' }
SlmdToolbarModel >> iconButtons: anObject [

	iconButtons := anObject
]

{ #category : 'initialization' }
SlmdToolbarModel >> initialize [

	super initialize.

	self clearItems.

]

{ #category : 'accessing' }
SlmdToolbarModel >> isVisible [

	^ isVisible
]

{ #category : 'accessing' }
SlmdToolbarModel >> isVisible: anObject [

	isVisible := anObject
]
