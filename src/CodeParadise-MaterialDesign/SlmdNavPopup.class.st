Class {
	#name : 'SlmdNavPopup',
	#superclass : 'Object',
	#instVars : [
		'popupItems'
	],
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'initialization' }
SlmdNavPopup >> initialize [

	super initialize.

	popupItems := OrderedCollection new.

]

{ #category : 'accessing' }
SlmdNavPopup >> popupItems [

	^ popupItems
]

{ #category : 'accessing' }
SlmdNavPopup >> popupItems: anObject [

	popupItems := anObject
]
