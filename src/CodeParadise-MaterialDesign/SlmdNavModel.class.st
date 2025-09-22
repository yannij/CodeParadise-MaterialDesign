Class {
	#name : 'SlmdNavModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'navItems'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'initialization' }
SlmdNavModel >> initialize [

	super initialize.

	self navItemsClear.

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
SlmdNavModel >> navItemsClear [

	self navItems: OrderedCollection new.

]
