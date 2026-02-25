Class {
	#name : 'WamDemoRepository',
	#superclass : 'Object',
	#classInstVars : [
		'map'
	],
	#category : 'CodeParadise-Examples-MD3-Common',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Common'
}

{ #category : 'accessing' }
WamDemoRepository class >> map [

	^ map ifNil: [ map := Dictionary new ]
]

{ #category : 'accessing' }
WamDemoRepository class >> mapAt: aKey ifAbsent: aBlock [

	^ self map at: aKey ifAbsent: aBlock
]

{ #category : 'accessing' }
WamDemoRepository class >> mapCreateAt: aKey [
	| repo |

	self map at: aKey ifPresent: [ :value | value close ].
	repo := (self onPath: aKey) create; open; yourself.
	^ self map at: aKey put: repo
]

{ #category : 'accessing' }
WamDemoRepository class >> mapReset [
	"
	self mapReset
	"

	map ifNotNil: [ :value |
		value values do: [ :each | each close ] ].

	map := nil
]

{ #category : 'instance creation' }
WamDemoRepository class >> onPath: aString [

	^ self new
		path: aString;
		yourself
]

{ #category : 'accessing' }
WamDemoRepository class >> singletonKey [

	^ 'current'
]

{ #category : 'api' }
WamDemoRepository >> close [
	"Do nothing. Subclasses may override"
]

{ #category : 'persistence' }
WamDemoRepository >> collectionNameFor: aClass [

	self subclassResponsibility
]

{ #category : 'persistence' }
WamDemoRepository >> commit: aBlock [

	self subclassResponsibility
]

{ #category : 'persistence' }
WamDemoRepository >> count: aClass [

	self subclassResponsibility
]

{ #category : 'persistence' }
WamDemoRepository >> count: aClass where: aDictionary [

	self subclassResponsibility
]

{ #category : 'api' }
WamDemoRepository >> create [
	"Do nothing. Subclasses may override"
]

{ #category : 'api' }
WamDemoRepository >> destroy [
	"Do nothing. Subclasses may override"
]

{ #category : 'api' }
WamDemoRepository >> open [
	"Do nothing. Subclasses may override"
]

{ #category : 'api' }
WamDemoRepository >> path: anObject [
	"Subclasses may override"
]

{ #category : 'persistence' }
WamDemoRepository >> remove: anObject [

	self subclassResponsibility
]

{ #category : 'persistence' }
WamDemoRepository >> removeAll: aClass [

	self subclassResponsibility
]

{ #category : 'persistence' }
WamDemoRepository >> selectAll: aClass [

	^ self selectAll: aClass sortBy: nil
]

{ #category : 'persistence' }
WamDemoRepository >> selectAll: aClass sortBy: sortBlockOrSymbol [

	self subclassResponsibility
]

{ #category : 'persistence' }
WamDemoRepository >> selectMany: aClass where: aDictionary [

	^ self selectMany: aClass where: aDictionary limit: nil
]

{ #category : 'persistence' }
WamDemoRepository >> selectMany: aClass where: aDictionary limit: aLimit [

	^ self selectMany: aClass where: aDictionary limit: aLimit offset: 0
]

{ #category : 'persistence' }
WamDemoRepository >> selectMany: aClass where: aDictionary limit: aLimit offset: anOffset [

	self subclassResponsibility
]

{ #category : 'persistence' }
WamDemoRepository >> selectMany: aClass where: aBlock sortBy: sortBlockOrSymbol [

	self subclassResponsibility
]

{ #category : 'persistence' }
WamDemoRepository >> selectOne: aClass where: aBlock [

	self subclassResponsibility
]

{ #category : 'persistence' }
WamDemoRepository >> updateData: anId class: aClass [

	self subclassResponsibility
]
