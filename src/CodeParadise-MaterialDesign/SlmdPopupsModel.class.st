Class {
	#name : 'SlmdPopupsModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'popups'
	],
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'initialization' }
SlmdPopupsModel >> initialize [

	super initialize.

	popups := OrderedIdentityDictionary new.

]

{ #category : 'accessing' }
SlmdPopupsModel >> popups [

	^ popups
]

{ #category : 'accessing' }
SlmdPopupsModel >> popups: anObject [

	popups := anObject
]

{ #category : 'accessing' }
SlmdPopupsModel >> popupsAt: aSymbol [

	^ self popups at: aSymbol
]

{ #category : 'accessing' }
SlmdPopupsModel >> popupsAt: aSymbol put: aNavPopop [

	self popups at: aSymbol put: aNavPopop
]

{ #category : 'accessing' }
SlmdPopupsModel >> popupsHasKey: aSymbol [

	^ self popups hasKey: aSymbol
]
