Class {
	#name : 'SlmdDemoSoilRepository',
	#superclass : 'SlmdDemoRepository',
	#instVars : [
		'pathPrefix',
		'path',
		'soil'
	],
	#category : 'CodeParadise-Examples-MD3-Common',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Common'
}

{ #category : 'demo data' }
SlmdDemoSoilRepository class >> soilCleanup [
	"
	self soilCleanup.
	QuasarDemoSoilRepository allInstances.
	QuasarDemoSoilRepository allInstances first pointersTo.
	"

	"WAAdmin clearSessions."
	self withAllSubclassesDo: [ :e |
		e mapReset.
		e allInstances do: [ :value | value close ] ].
	Smalltalk garbageCollect; garbageCollect; garbageCollect
]

{ #category : 'api' }
SlmdDemoSoilRepository >> close [

	soil ifNotNil: [
		soil close.
		soil := nil ]
]

{ #category : 'private' }
SlmdDemoSoilRepository >> collectionNameFor: aClass [

	^ aClass name
]

{ #category : 'private' }
SlmdDemoSoilRepository >> collectionNewFor: aClass [

	"^ Set new"
	^ SoilSkipListDictionary new
		keySize: 16;
		maxLevel: 8;
		yourself
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> commit: aBlock [

	#todo
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> count: aClass [

	^ (self listOf: aClass) size
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> count: aClass where: condition [

	^ (self selectMany: aClass where: condition) size
]

{ #category : 'api' }
SlmdDemoSoilRepository >> create [
	| tx dict |

	soil := (Soil path: self fullPath)
		destroy;
		initializeFilesystem.

	tx := soil newTransaction.
	dict := SoilPersistentDictionary new.
	tx makeRoot: dict.
	tx root: dict.
	"tx markDirty: dict."
	tx commit.

	soil close
]

{ #category : 'api' }
SlmdDemoSoilRepository >> destroy [

	soil ifNotNil: [
		soil destroy ]
]

{ #category : 'accessing' }
SlmdDemoSoilRepository >> fullPath [

	^ self pathPrefix
		ifNil: [ self path ]
		ifNotNil: [ :value | value asPath / self path ]
]

{ #category : 'initialization' }
SlmdDemoSoilRepository >> initialize [

	super initialize.

	self pathPrefix: 'dataxa'.
	"objectMap := Dictionary new"
]

{ #category : 'private' }
SlmdDemoSoilRepository >> list: aClass [
	| tx list |

	tx := soil newTransaction.

	list := self list: aClass transaction: tx.

	^ list
]

{ #category : 'private' }
SlmdDemoSoilRepository >> list: aClass transaction: tx [
	| list |

	list := tx root at: (self collectionNameFor: aClass) ifAbsentPut: [ self collectionNewFor: aClass ].

	list ifNil: [
		self crTrace: 'list not found for: ', aClass printString ].

	^ list
]

{ #category : 'private' }
SlmdDemoSoilRepository >> listOf: aClass [
	| objectSet |

	objectSet := self list: aClass.

	"^ aClass = aClass persistentClass 
		ifTrue: [ objectSet ]
		ifFalse: [ objectSet select: [ :each | each isKindOf: aClass] ]"
	^ objectSet values
]

{ #category : 'api' }
SlmdDemoSoilRepository >> open [

	soil := (Soil path: self fullPath) open; yourself
]

{ #category : 'accessing' }
SlmdDemoSoilRepository >> path [

	^ path
]

{ #category : 'accessing' }
SlmdDemoSoilRepository >> path: anObject [

	path := anObject
]

{ #category : 'accessing' }
SlmdDemoSoilRepository >> pathPrefix [

	^ pathPrefix
]

{ #category : 'accessing' }
SlmdDemoSoilRepository >> pathPrefix: anObject [

	pathPrefix := anObject
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> remove: anObject [
	| id key |

	id := anObject id.
	key := (id class = UUID and: [ SystemVersion current major >= 12 ])
		ifTrue: [ id uuidData ]
		ifFalse: [ id asInteger asByteArrayOfSize: 8].

	^ self remove: anObject atKey: key
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> remove: anObject atKey: aKey [
	| tx |

	tx := soil newTransaction.
	self remove: anObject atKey: aKey transaction: tx.
	tx commit
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> remove: anObject atKey: aKey transaction: tx [
	| list |

	list := tx root
		at: (self collectionNameFor: anObject class)
		ifAbsent: [ ^ self ].
	list removeKey: aKey ifAbsent: [ (aKey printString, ' not found') traceCr ].
	tx markDirty: list
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> removeAll: aClass [ 

	self removeCollection: aClass
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> removeCollection: aClass [ 

	#todo
	"objectMap 
		removeKey: (self collectionNameFor: aClass)
		ifAbsent: [ ""Do nothing"" ]"
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> save: anObject [
	| tx |

	tx := soil newTransaction.
	self save: anObject transaction: tx.
	tx commit
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> save: anObject transaction: tx [
	| theRoot list id key |

	theRoot := tx root.
	list := tx root
		at: (self collectionNameFor: anObject class)
		ifAbsentPut: [
			| newList |
			newList := self collectionNewFor: anObject class.
			tx markDirty: theRoot.
			tx makeRoot: newList.
			newList ].
	tx markDirty: list.
	tx markDirty: theRoot.
	tx makeRoot: anObject.
	id := anObject id.
	key := (id class = UUID and: [ SystemVersion current major >= 12 ])
		ifTrue: [ id uuidData ]
		ifFalse: [ id asInteger asByteArrayOfSize: 8].
	('save: ', anObject class name printString, ' ', key printString) traceCr.
	list at: key put: anObject
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> selectAll: aClass [

	^ self listOf: aClass
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> selectAll: aClass sortBy: sortBlock [

	^ sortBlock
		ifNotNil: [ (self listOf: aClass) sortedBy: sortBlock ]
		ifNil: [ self listOf: aClass ]
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> selectMany: aClass where: aBlock [

	aBlock ifNil: [ ^ self selectAll: aClass ].
	^ (self listOf: aClass) select: aBlock
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> selectMany: aClass where: aBlock limit: aLimit offset: anOffset [
	| list |

	list := self selectMany: aClass where: aBlock.
	(anOffset > list size) ifTrue: [ ^ {  } ].
	^ list asOrderedCollection
		copyFrom: anOffset + 1
		to: (anOffset + aLimit min: list size)
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> selectMany: aClass where: aBlock sortBy: sortBlock [

	^ sortBlock
		ifNotNil: [ (((self listOf: aClass) select: aBlock) asSortedCollection: sortBlock) asOrderedCollection ]
		ifNil: [ (self listOf: aClass) select: aBlock ]
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> selectOne: aClass where: aBlock [

	^ (self listOf: aClass) detect: aBlock ifNone: [ nil ]
]

{ #category : 'accessing' }
SlmdDemoSoilRepository >> soil [

	^ soil
]

{ #category : 'accessing' }
SlmdDemoSoilRepository >> soil: anObject [

	soil := anObject
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> updateData: data class: aClass [
	| tx modelObject |

	tx := soil newTransaction.
	modelObject := self updateData: data class: aClass transaction: tx.
	modelObject updateFromMap: data.
	tx commit
]

{ #category : 'persistence' }
SlmdDemoSoilRepository >> updateData: data class: aClass transaction: tx [
	| list modelId modelObject |

	modelId := (data at: #id).

	list := tx root
		at: (self collectionNameFor: aClass)
		ifAbsent: [ self error: 'Missing list for: ', aClass name asString, ' id=', modelId asString ].
	modelObject := list
		at: modelId asByteArray
		ifAbsent: [ self error: 'Missing object for: ', aClass name asString, ' id=', modelId asString ].

	tx markDirty: list.
	tx markDirty: modelObject.

	"Answer the model object to allow further processing of it"
	^ modelObject
]
