Class {
	#name : 'WamDemoMemoryRepository',
	#superclass : 'WamDemoRepository',
	#instVars : [
		'objectMap'
	],
	#category : 'CodeParadise-Examples-MD3-Common',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Common'
}

{ #category : 'accessing' }
WamDemoMemoryRepository class >> cleanup [
	"
	self cleanup.
	"

	self mapReset
]

{ #category : 'private' }
WamDemoMemoryRepository >> collectionNameFor: aClass [

	^ aClass name
]

{ #category : 'persistence' }
WamDemoMemoryRepository >> commit: aBlock [

	#todo
]

{ #category : 'persistence' }
WamDemoMemoryRepository >> count: aClass [

	^ (self listOf: aClass) size
]

{ #category : 'persistence' }
WamDemoMemoryRepository >> count: aClass where: condition [

	^ (self selectMany: aClass where: condition) size
]

{ #category : 'initialization' }
WamDemoMemoryRepository >> initialize [

	super initialize.

	objectMap := Dictionary new
]

{ #category : 'private' }
WamDemoMemoryRepository >> list: aClass [

	^ objectMap 
		at: (self collectionNameFor: aClass) 
		ifAbsentPut: [ Set new ]
]

{ #category : 'private' }
WamDemoMemoryRepository >> listOf: aClass [
	| objectSet |

	objectSet := self list: aClass.

	"^ aClass = aClass persistentClass 
		ifTrue: [ objectSet ]
		ifFalse: [ objectSet select: [ :each | each isKindOf: aClass] ]"
	^ objectSet
]

{ #category : 'accessing' }
WamDemoMemoryRepository >> objectMap [

	^ objectMap
]

{ #category : 'accessing' }
WamDemoMemoryRepository >> objectMap: anObject [

	objectMap := anObject
]

{ #category : 'persistence' }
WamDemoMemoryRepository >> remove: anObject [

	^ (self list: anObject class)
		remove: anObject
		ifAbsent: [ "Do nothing" ]
]

{ #category : 'persistence' }
WamDemoMemoryRepository >> removeAll: aClass [ 

	self removeCollection: aClass
]

{ #category : 'persistence' }
WamDemoMemoryRepository >> removeCollection: aClass [ 

	objectMap 
		removeKey: (self collectionNameFor: aClass)
		ifAbsent: [ "Do nothing" ]	
]

{ #category : 'persistence' }
WamDemoMemoryRepository >> save: anObject [

	(self list: anObject class) add: anObject
]

{ #category : 'persistence' }
WamDemoMemoryRepository >> selectAll: aClass [

	^ self listOf: aClass
]

{ #category : 'persistence' }
WamDemoMemoryRepository >> selectAll: aClass sortBy: sortBlock [

	^ sortBlock
		ifNotNil: [ (self listOf: aClass) sortedBy: sortBlock ]
		ifNil: [ self listOf: aClass ]
]

{ #category : 'persistence' }
WamDemoMemoryRepository >> selectMany: aClass where: aBlock [

	aBlock ifNil: [ ^ self selectAll: aClass ].
	^ (self listOf: aClass) select: aBlock
]

{ #category : 'persistence' }
WamDemoMemoryRepository >> selectMany: aClass where: aBlock limit: aLimit offset: anOffset [
	| list |

	list := self selectMany: aClass where: aBlock.
	(anOffset > list size) ifTrue: [ ^ {  } ].
	^ list asOrderedCollection
		copyFrom: anOffset + 1
		to: (anOffset + aLimit min: list size)
]

{ #category : 'persistence' }
WamDemoMemoryRepository >> selectMany: aClass where: aBlock sortBy: sortBlock [

	^ sortBlock
		ifNotNil: [ (((self listOf: aClass) select: aBlock) asSortedCollection: sortBlock) asOrderedCollection ]
		ifNil: [ (self listOf: aClass) select: aBlock ]
]

{ #category : 'persistence' }
WamDemoMemoryRepository >> selectOne: aClass where: aBlock [

	^ (self listOf: aClass) detect: aBlock ifNone: [ nil ]
]

{ #category : 'persistence' }
WamDemoMemoryRepository >> updateData: data class: aClass [
	"Do nothing for memory persistence"
]
