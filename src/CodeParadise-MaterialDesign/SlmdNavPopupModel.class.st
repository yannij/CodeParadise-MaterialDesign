Class {
	#name : 'SlmdNavPopupModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'navItems',
		'popupName'
	],
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'instance creation' }
SlmdNavPopupModel class >> named: aSymbol [

	^ self new popupName: aSymbol; yourself
]

{ #category : 'initialization' }
SlmdNavPopupModel >> initialize [

	super initialize.

	self navItemsClear.

]

{ #category : 'accessing' }
SlmdNavPopupModel >> navItems [

	^ navItems
]

{ #category : 'accessing' }
SlmdNavPopupModel >> navItems: anObject [

	navItems := anObject
]

{ #category : 'initialization' }
SlmdNavPopupModel >> navItemsClear [

	self navItems: OrderedCollection new.

]

{ #category : 'accessing' }
SlmdNavPopupModel >> popupName [

	^ popupName
]

{ #category : 'accessing' }
SlmdNavPopupModel >> popupName: anObject [

	popupName := anObject
]
