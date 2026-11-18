Class {
	#name : 'WamFabModel',
	#superclass : 'WamToolbarModel',
	#instVars : [
		'fabAction'
	],
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'initialization' }
WamFabModel >> actionGroupToUse [

	^ #fab
]

{ #category : 'accessing' }
WamFabModel >> fabAction [

	^ fabAction
]

{ #category : 'accessing' }
WamFabModel >> fabAction: anObject [

	fabAction := anObject
]

{ #category : 'events' }
WamFabModel >> navActionAtId: anObject [

	self fabAction ifNotNil: [ :value |
		value eventId = anObject ifTrue: [
			^ value ] ].
	^ nil
]
