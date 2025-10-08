Class {
	#name : 'SlmdNavModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'navItems'
	],
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'initialization' }
SlmdNavModel >> initialize [

	super initialize.

	navItems := OrderedCollection new.

]

{ #category : 'accessing' }
SlmdNavModel >> navActionAdd: aNavAction [

	self navItems add: aNavAction
]

{ #category : 'accessing' }
SlmdNavModel >> navActionDetect: aBlock ifNone: noneBlock [

	^ self navItems detect: aBlock ifNone: noneBlock
]

{ #category : 'accessing' }
SlmdNavModel >> navItems [

	^ navItems
]

{ #category : 'accessing' }
SlmdNavModel >> navItems: anObject [

	navItems := anObject
]

{ #category : 'initialization' }
SlmdNavModel >> removeAllSuchThat: aBlock [

	self navItems removeAllSuchThat: aBlock

]
