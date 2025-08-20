Class {
	#name : 'SlmdDemoRepository',
	#superclass : 'Object',
	#classInstVars : [
		'map'
	],
	#category : 'CodeParadise-Examples-MD3-Common',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Common'
}

{ #category : 'accessing' }
SlmdDemoRepository class >> map [

	^ map ifNil: [ map := Dictionary new ]
]

{ #category : 'accessing' }
SlmdDemoRepository class >> mapAt: aKey ifAbsent: aBlock [

	^ self map at: aKey ifAbsent: aBlock
]

{ #category : 'accessing' }
SlmdDemoRepository class >> mapCreateAt: aKey [
	| repo |

	self map at: aKey ifPresent: [ :value | value close ].
	repo := (self onPath: aKey) create; open; yourself.
	^ self map at: aKey put: repo
]

{ #category : 'accessing' }
SlmdDemoRepository class >> mapReset [
	"
	self mapReset
	"

	map ifNotNil: [ :value |
		value values do: [ :each | each close ] ].

	map := nil
]

{ #category : 'instance creation' }
SlmdDemoRepository class >> onPath: aString [

	^ self new
		path: aString;
		yourself
]

{ #category : 'accessing' }
SlmdDemoRepository class >> singletonKey [

	^ 'current'
]

{ #category : 'api' }
SlmdDemoRepository >> close [
	"Do nothing. Subclasses may override"
]

{ #category : 'persistence' }
SlmdDemoRepository >> collectionNameFor: aClass [

	self subclassResponsibility
]

{ #category : 'persistence' }
SlmdDemoRepository >> commit: aBlock [

	self subclassResponsibility
]

{ #category : 'persistence' }
SlmdDemoRepository >> count: aClass [

	self subclassResponsibility
]

{ #category : 'persistence' }
SlmdDemoRepository >> count: aClass where: aDictionary [

	self subclassResponsibility
]

{ #category : 'api' }
SlmdDemoRepository >> create [
	"Do nothing. Subclasses may override"
]

{ #category : 'api' }
SlmdDemoRepository >> destroy [
	"Do nothing. Subclasses may override"
]

{ #category : 'api' }
SlmdDemoRepository >> open [
	"Do nothing. Subclasses may override"
]

{ #category : 'api' }
SlmdDemoRepository >> path: anObject [
	"Subclasses may override"
]

{ #category : 'persistence' }
SlmdDemoRepository >> remove: anObject [

	self subclassResponsibility
]

{ #category : 'persistence' }
SlmdDemoRepository >> removeAll: aClass [

	self subclassResponsibility
]

{ #category : 'persistence' }
SlmdDemoRepository >> selectAll: aClass [

	^ self selectAll: aClass sortBy: nil
]

{ #category : 'persistence' }
SlmdDemoRepository >> selectAll: aClass sortBy: sortBlockOrSymbol [

	self subclassResponsibility
]

{ #category : 'persistence' }
SlmdDemoRepository >> selectMany: aClass where: aDictionary [

	^ self selectMany: aClass where: aDictionary limit: nil
]

{ #category : 'persistence' }
SlmdDemoRepository >> selectMany: aClass where: aDictionary limit: aLimit [

	^ self selectMany: aClass where: aDictionary limit: aLimit offset: 0
]

{ #category : 'persistence' }
SlmdDemoRepository >> selectMany: aClass where: aDictionary limit: aLimit offset: anOffset [

	self subclassResponsibility
]

{ #category : 'persistence' }
SlmdDemoRepository >> selectMany: aClass where: aBlock sortBy: sortBlockOrSymbol [

	self subclassResponsibility
]

{ #category : 'persistence' }
SlmdDemoRepository >> selectOne: aClass where: aBlock [

	self subclassResponsibility
]

{ #category : 'persistence' }
SlmdDemoRepository >> updateData: anId class: aClass [

	self subclassResponsibility
]
