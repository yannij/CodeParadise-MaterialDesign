Class {
	#name : 'SlmdPaneLayoutModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'pane1',
		'pane2',
		'useTwoPaneBody',
		'pane1Width'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'initialization' }
SlmdPaneLayoutModel >> initialize [

	super initialize.

	useTwoPaneBody := false.
	pane1Width := 500.

]

{ #category : 'accessing' }
SlmdPaneLayoutModel >> pane1 [

	^ pane1
]

{ #category : 'accessing' }
SlmdPaneLayoutModel >> pane1: anObject [

	pane1 := anObject
]

{ #category : 'accessing' }
SlmdPaneLayoutModel >> pane1Width [

	^ pane1Width
]

{ #category : 'accessing' }
SlmdPaneLayoutModel >> pane1Width: anObject [

	pane1Width := anObject
]

{ #category : 'accessing' }
SlmdPaneLayoutModel >> pane2 [

	^ pane2
]

{ #category : 'accessing' }
SlmdPaneLayoutModel >> pane2: anObject [

	pane2 := anObject
]

{ #category : 'accessing' }
SlmdPaneLayoutModel >> useTwoPaneBody [

	^ useTwoPaneBody
]

{ #category : 'accessing' }
SlmdPaneLayoutModel >> useTwoPaneBody: anObject [

	useTwoPaneBody := anObject
]

{ #category : 'accessing' }
SlmdPaneLayoutModel >> useTwoPaneBodySet: anObject [

	self useTwoPaneBody = anObject ifTrue: [
		^ self ].

	self useTwoPaneBody: anObject.
	self valueChanged.

]
