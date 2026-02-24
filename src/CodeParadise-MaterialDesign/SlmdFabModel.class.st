Class {
	#name : 'SlmdFabModel',
	#superclass : 'SlmdToolbarModel',
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'initialization' }
SlmdFabModel >> actionGroupToUse [

	^ #fab
]

{ #category : 'events' }
SlmdFabModel >> navActionAtId: anObject [

	self fab ifNotNil: [ :value |
		value eventId = anObject ifTrue: [
			^ value ] ].
	^ nil
]
