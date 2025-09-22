Class {
	#name : 'SlmdNavBarModel',
	#superclass : 'SlmdNavModel',
	#instVars : [
		'isVisible',
		'iconButtons'
	],
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'initialization' }
SlmdNavBarModel >> clearItems [

	self iconButtons: OrderedCollection new.

]

{ #category : 'accessing' }
SlmdNavBarModel >> iconButtons [

	^ iconButtons
]

{ #category : 'accessing' }
SlmdNavBarModel >> iconButtons: anObject [

	iconButtons := anObject
]

{ #category : 'initialization' }
SlmdNavBarModel >> initialize [

	super initialize.

	self clearItems.

]

{ #category : 'accessing' }
SlmdNavBarModel >> isVisible [

	^ isVisible
]

{ #category : 'accessing' }
SlmdNavBarModel >> isVisible: anObject [

	isVisible := anObject
]
