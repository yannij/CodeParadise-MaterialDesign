Class {
	#name : 'WamFabModel',
	#superclass : 'WamToolbarModel',
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'initialization' }
WamFabModel >> actionGroupToUse [

	^ #fab
]

{ #category : 'events' }
WamFabModel >> navActionAtId: anObject [

	self fab ifNotNil: [ :value |
		value eventId = anObject ifTrue: [
			^ value ] ].
	^ nil
]
