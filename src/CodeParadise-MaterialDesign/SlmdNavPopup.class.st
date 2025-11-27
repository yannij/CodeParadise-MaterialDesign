Class {
	#name : 'SlmdNavPopup',
	#superclass : 'Object',
	#instVars : [
		'popupItems'
	],
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
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
