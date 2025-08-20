Class {
	#name : 'SlmdDemoMemoryRepository',
	#superclass : 'SlmdDemoRepository',
	#instVars : [
		'objectMap'
	],
	#category : 'CodeParadise-Examples-MD3-Common',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Common'
}

{ #category : 'accessing' }
SlmdDemoMemoryRepository class >> cleanup [
	"
	self cleanup.
	"

	self mapReset
]

{ #category : 'private' }
SlmdDemoMemoryRepository >> collectionNameFor: aClass [

	^ aClass name
]

{ #category : 'persistence' }
SlmdDemoMemoryRepository >> commit: aBlock [

	#todo
]

{ #category : 'persistence' }
SlmdDemoMemoryRepository >> count: aClass [

	^ (self listOf: aClass) size
]

{ #category : 'persistence' }
SlmdDemoMemoryRepository >> count: aClass where: condition [

	^ (self selectMany: aClass where: condition) size
]

{ #category : 'initialization' }
SlmdDemoMemoryRepository >> initialize [

	super initialize.

	objectMap := Dictionary new
]

{ #category : 'private' }
SlmdDemoMemoryRepository >> list: aClass [

	^ objectMap 
		at: (self collectionNameFor: aClass) 
		ifAbsentPut: [ Set new ]
]

{ #category : 'private' }
SlmdDemoMemoryRepository >> listOf: aClass [
	| objectSet |

	objectSet := self list: aClass.

	"^ aClass = aClass persistentClass 
		ifTrue: [ objectSet ]
		ifFalse: [ objectSet select: [ :each | each isKindOf: aClass] ]"
	^ objectSet
]

{ #category : 'accessing' }
SlmdDemoMemoryRepository >> objectMap [

	^ objectMap
]

{ #category : 'accessing' }
SlmdDemoMemoryRepository >> objectMap: anObject [

	objectMap := anObject
]

{ #category : 'persistence' }
SlmdDemoMemoryRepository >> remove: anObject [

	^ (self list: anObject class)
		remove: anObject
		ifAbsent: [ "Do nothing" ]
]

{ #category : 'persistence' }
SlmdDemoMemoryRepository >> removeAll: aClass [ 

	self removeCollection: aClass
]

{ #category : 'persistence' }
SlmdDemoMemoryRepository >> removeCollection: aClass [ 

	objectMap 
		removeKey: (self collectionNameFor: aClass)
		ifAbsent: [ "Do nothing" ]	
]

{ #category : 'persistence' }
SlmdDemoMemoryRepository >> save: anObject [

	(self list: anObject class) add: anObject
]

{ #category : 'persistence' }
SlmdDemoMemoryRepository >> selectAll: aClass [

	^ self listOf: aClass
]

{ #category : 'persistence' }
SlmdDemoMemoryRepository >> selectAll: aClass sortBy: sortBlock [

	^ sortBlock
		ifNotNil: [ (self listOf: aClass) sortedBy: sortBlock ]
		ifNil: [ self listOf: aClass ]
]

{ #category : 'persistence' }
SlmdDemoMemoryRepository >> selectMany: aClass where: aBlock [

	aBlock ifNil: [ ^ self selectAll: aClass ].
	^ (self listOf: aClass) select: aBlock
]

{ #category : 'persistence' }
SlmdDemoMemoryRepository >> selectMany: aClass where: aBlock limit: aLimit offset: anOffset [
	| list |

	list := self selectMany: aClass where: aBlock.
	(anOffset > list size) ifTrue: [ ^ {  } ].
	^ list asOrderedCollection
		copyFrom: anOffset + 1
		to: (anOffset + aLimit min: list size)
]

{ #category : 'persistence' }
SlmdDemoMemoryRepository >> selectMany: aClass where: aBlock sortBy: sortBlock [

	^ sortBlock
		ifNotNil: [ (((self listOf: aClass) select: aBlock) asSortedCollection: sortBlock) asOrderedCollection ]
		ifNil: [ (self listOf: aClass) select: aBlock ]
]

{ #category : 'persistence' }
SlmdDemoMemoryRepository >> selectOne: aClass where: aBlock [

	^ (self listOf: aClass) detect: aBlock ifNone: [ nil ]
]

{ #category : 'persistence' }
SlmdDemoMemoryRepository >> updateData: data class: aClass [
	"Do nothing for memory persistence"
]
