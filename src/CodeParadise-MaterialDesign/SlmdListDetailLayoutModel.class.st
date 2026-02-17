Class {
	#name : 'SlmdListDetailLayoutModel',
	#superclass : 'SlmdPaneLayoutModel',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'accessing' }
SlmdListDetailLayoutModel >> detail [

	^ self pane2 paneContent
]

{ #category : 'accessing' }
SlmdListDetailLayoutModel >> detail: anObject [

	self pane2 setPaneContent: anObject
]

{ #category : 'accessing' }
SlmdListDetailLayoutModel >> list [

	^ self pane1 paneContent
]

{ #category : 'accessing' }
SlmdListDetailLayoutModel >> list: anObject [

	self pane1 setPaneContent: anObject
]

{ #category : 'presenter' }
SlmdListDetailLayoutModel >> preferredPresenterClass [

	^ SlmdPaneLayoutPresenter
]
