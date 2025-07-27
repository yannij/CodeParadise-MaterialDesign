Class {
	#name : 'SlmdNavRailModel',
	#superclass : 'SlmdNavModel',
	#instVars : [
		'isModal',
		'isExpanded'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'initialization' }
SlmdNavRailModel >> initialize [

	super initialize.

	isModal := false.
	isExpanded := false.

]

{ #category : 'accessing' }
SlmdNavRailModel >> isModal [

	^ isModal
]

{ #category : 'accessing' }
SlmdNavRailModel >> isModal: anObject [

	isModal := anObject
]
