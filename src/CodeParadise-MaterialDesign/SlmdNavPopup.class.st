Class {
	#name : 'SlmdNavPopup',
	#superclass : 'Object',
	#instVars : [
		'navItems'
	],
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'initialization' }
SlmdNavPopup >> initialize [

	super initialize.

	self navItemsClear.

]

{ #category : 'accessing' }
SlmdNavPopup >> navItems [

	^ navItems
]

{ #category : 'accessing' }
SlmdNavPopup >> navItems: anObject [

	navItems := anObject
]

{ #category : 'initialization' }
SlmdNavPopup >> navItemsClear [

	self navItems: OrderedCollection new.

]
