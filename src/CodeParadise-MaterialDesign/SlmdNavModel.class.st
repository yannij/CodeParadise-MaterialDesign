Class {
	#name : 'SlmdNavModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'navItems'
	],
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
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
