Class {
	#name : 'WamListDetailLayoutModel',
	#superclass : 'WamPaneLayoutModel',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'accessing' }
WamListDetailLayoutModel >> detail [

	^ self pane2 paneContent
]

{ #category : 'accessing' }
WamListDetailLayoutModel >> detail: anObject [

	self pane2 setPaneContent: anObject
]

{ #category : 'accessing' }
WamListDetailLayoutModel >> list [

	^ self pane1 paneContent
]

{ #category : 'accessing' }
WamListDetailLayoutModel >> list: anObject [

	self pane1 setPaneContent: anObject
]

{ #category : 'presenter' }
WamListDetailLayoutModel >> preferredPresenterClass [

	^ WamPaneLayoutPresenter
]
