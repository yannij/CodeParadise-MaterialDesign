Class {
	#name : 'WamNavPopup',
	#superclass : 'Object',
	#instVars : [
		'popupItems'
	],
	#category : 'CodeParadise-MaterialDesign-NavElement',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavElement'
}

{ #category : 'initialization' }
WamNavPopup >> initialize [

	super initialize.

	popupItems := OrderedCollection new.

]

{ #category : 'accessing' }
WamNavPopup >> popupItems [

	^ popupItems
]

{ #category : 'accessing' }
WamNavPopup >> popupItems: anObject [

	popupItems := anObject
]
