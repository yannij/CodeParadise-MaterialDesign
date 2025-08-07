Class {
	#name : 'SlmdPaneLayoutModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'pane1',
		'pane2',
		'pane1Width'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'initialization' }
SlmdPaneLayoutModel >> initialize [

	super initialize.

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
