Class {
	#name : 'WamPaneLayoutModel',
	#superclass : 'WamModel',
	#instVars : [
		'pane1',
		'pane1Width',
		'pane2',
		'sidesheet'
	],
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'accessing' }
WamPaneLayoutModel >> detail [

	^ self pane2 paneContent
]

{ #category : 'accessing' }
WamPaneLayoutModel >> detail: anObject [

	self pane2 setPaneContent: anObject
]

{ #category : 'initialization' }
WamPaneLayoutModel >> initialize [

	super initialize.

	pane1Width := 500.
	sidesheet := WamSidesheetModel new.

]

{ #category : 'accessing' }
WamPaneLayoutModel >> list [

	^ self pane1 paneContent
]

{ #category : 'accessing' }
WamPaneLayoutModel >> list: anObject [

	self pane1 setPaneContent: anObject
]

{ #category : 'accessing' }
WamPaneLayoutModel >> pane1 [

	^ pane1
]

{ #category : 'accessing' }
WamPaneLayoutModel >> pane1: anObject [

	pane1 := anObject
]

{ #category : 'accessing' }
WamPaneLayoutModel >> pane1Width [

	^ pane1Width
]

{ #category : 'accessing' }
WamPaneLayoutModel >> pane1Width: anObject [

	pane1Width := anObject
]

{ #category : 'accessing' }
WamPaneLayoutModel >> pane2 [

	^ pane2
]

{ #category : 'accessing' }
WamPaneLayoutModel >> pane2: anObject [

	pane2 := anObject
]

{ #category : 'accessing' }
WamPaneLayoutModel >> sidesheet [

	^ sidesheet
]

{ #category : 'accessing' }
WamPaneLayoutModel >> sidesheet: anObject [

	sidesheet := anObject
]
