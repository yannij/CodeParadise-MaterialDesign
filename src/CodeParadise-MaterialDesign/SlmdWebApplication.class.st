Class {
	#name : 'SlmdWebApplication',
	#superclass : 'CpMvpWebApplication',
	#instVars : [
		'layout',
		'navItems',
		'actionItems'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'accessing' }
SlmdWebApplication >> actionItemNamed: aKey [

	^ self actionItems detect: [ :each | each id = aKey ] ifNone: []
]

{ #category : 'accessing' }
SlmdWebApplication >> actionItems [

	^ actionItems
]

{ #category : 'accessing' }
SlmdWebApplication >> actionItems: anObject [

	actionItems := anObject
]

{ #category : 'accessing' }
SlmdWebApplication >> applicationModel [

	"Answer the Model for the receiver, which is the receiver itself"

	^ self
]

{ #category : 'initialization' }
SlmdWebApplication >> initialize [

	super initialize.

	layout := SlmdResponsiveLayoutModel new.
	navItems := OrderedCollection new.
	actionItems := OrderedCollection new.

	self setUpNavItems.
	self setUpActionItems.

]

{ #category : 'accessing' }
SlmdWebApplication >> layout [

	^ layout
]

{ #category : 'accessing' }
SlmdWebApplication >> layout: anObject [

	layout := anObject
]

{ #category : 'accessing' }
SlmdWebApplication >> navItems [

	^ navItems
]

{ #category : 'accessing' }
SlmdWebApplication >> navItems: anObject [

	navItems := anObject
]

{ #category : 'initialization' }
SlmdWebApplication >> setUpActionItems [
	"Subclasses may enhance"

]

{ #category : 'initialization' }
SlmdWebApplication >> setUpNavItems [
	"Subclasses may enhance"

]
