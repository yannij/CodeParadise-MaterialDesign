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
SlmdFabModel >> navActionFind: anObject [

	self fab ifNotNil: [ :value |
		value eventSubtype = anObject ifTrue: [
			^ value ] ].
	^ nil
]
