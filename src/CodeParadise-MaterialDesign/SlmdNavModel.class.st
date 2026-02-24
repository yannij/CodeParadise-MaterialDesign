Class {
	#name : 'SlmdNavModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'navItems'
	],
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'initialization' }
SlmdNavModel >> initialize [

	super initialize.

	navItems := OrderedCollection new.

]

{ #category : 'accessing' }
SlmdNavModel >> navActionAdd: aNavAction [

	self navItems add: aNavAction
]

{ #category : 'rendering' }
SlmdNavModel >> navActionAtId: anObject [

	^ self navItems detect: [ :each | each eventId = anObject ] ifNone: []
]

{ #category : 'accessing' }
SlmdNavModel >> navActionDetect: aBlock ifNone: noneBlock [
	| item |

	self navItems do: [ :eachNavItem |
		eachNavItem data = #menu ifTrue: [
			| popup |
			popup := self application layout popupsAt: (eachNavItem eventId) ifAbsent: [].
			item := popup popupItems detect: aBlock ifNone: [].
			item ifNotNil: [ :value | ^ value ] ].
		(aBlock value: eachNavItem) ifTrue: [ ^ eachNavItem ] ].
	^ noneBlock value
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
SlmdNavModel >> removeAllSuchThat: aBlock [

	self navItems removeAllSuchThat: aBlock

]
