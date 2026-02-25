Class {
	#name : 'WamNavModel',
	#superclass : 'WamModel',
	#instVars : [
		'navItems'
	],
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'initialization' }
WamNavModel >> initialize [

	super initialize.

	navItems := OrderedCollection new.

]

{ #category : 'accessing' }
WamNavModel >> navActionAdd: aNavAction [

	self navItems add: aNavAction
]

{ #category : 'rendering' }
WamNavModel >> navActionAtId: anObject [

	^ self navItems detect: [ :each | each eventId = anObject ] ifNone: []
]

{ #category : 'accessing' }
WamNavModel >> navActionDetect: aBlock ifNone: noneBlock [
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
WamNavModel >> navItems [

	^ navItems
]

{ #category : 'accessing' }
WamNavModel >> navItems: anObject [

	navItems := anObject
]

{ #category : 'initialization' }
WamNavModel >> removeAllSuchThat: aBlock [

	self navItems removeAllSuchThat: aBlock

]
